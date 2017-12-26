%% preload
clear;
disp('preload begin');
% folder = '1/';
% fol=dir([folder '/*.jpg']);
% config.picNum=size(fol,1);

parp = gcp('nocreate');
if isempty(parp)  
% parpool(2);
end

run configs;
if exist('vars/coordinateSet.mat','file')
load vars/coordinateSet;
config.WindowStartingWidth =WindowStartingWidth;
config.WindowStartingHeight =WindowStartingHeight;
else
    disp('first setup!');
end
run takescreen;

% progRound = 1;
% save('proground.mat','progRound');
%% start
% while progRound < config.picNum
% if mod(x,5) == 3
disp('preload finished');
while true
    
    clearex('config');

    run takescreen;           
    run players    
%     for i = 1:config.players
%         disp(player(i).id);
%     end
%     break;
    % elvileg minden hiba sz�rve, csak akkor fogadja el a screenshotot ha
    % a hat�r�rt�kek stimmelnek a k�s�bbi sz�m�t�sok egyszer�bb� t�tele
    % miatt
    %%
    if screenData.feedback      
        disp('new round');
        disp('_______________');
        
        disp('cards');
        run cards;
        
        if ~isnan(card(1).value) || ~isnan(card(2).value)           
            if numOfCards > 1
                
                disp('position');
                run position;
                
                disp('hand');
                tmp = hand;
                hand = tmp.createHand(card);
                
                if numOfCards > 4
                    
                    disp('middle');
                    tmp = middle;
                    middle = tmp.createMiddle(card);
                    
                end             
                
                %% hand,middle t�rol�sa v�ltoz�sig vagy ha van gomb
                stucktruck = 1;
                compare.phase = phase;
                compare.cardcolor = cardcolor;
                compare.cardvalue = cardvalue;
                
                run buttons;
                numOfBtn = validateButton(button);
                if numOfBtn
                    %% Bbuttons
                    run newOrders;
                    disp('my turn');
                    readyToMove = true;
                else
                    %% looop
                    % am�g nincs gomb vagy nem t�rt�nik v�ltoz�s
                    
                    disp('Waiting for my turn');
                    disp('enter loop------------------->>');
                    while true  %% csakmert
                        clearex('config','stucktruck','compare','hand','middle')
                        readyToMove = false;
                        run takescreen;
                        run buttons;
                        
                        numOfBtn = validateButton(button);
                        
                        %% van gomb
                        if numOfBtn
                            mismatch = unstucker(compare,phase,cardcolor);
                            if mismatch
                                disp('<<-------------------exit loop');
                                break;
                            else
                                disp('my turn');
                                disp('<<-------------------exit loop');
                                readyToMove = true;
                                break;
                            end
                            
                        else
                            %% ha nincs gomb
                            %                     disp(stucktruck);
                            
                            mismatch = unstucker(compare,phase,cardcolor);
                            if mismatch
                                disp('<<-------------------exit loop');
                                break;
                            end
                            
                        end
                        stucktruck = stucktruck+1;
                    end
                end
                
                if readyToMove
                    
                    clear compare;
                    run suggest;
                    run newOrders;
                    %% van orderopt
                    %                     if ~isempty(orderopt)
                    if exist('orderopt','var')
                        %     if phase == 1 && strcmp(orderopt,'call')
                        %        load splat;
                        %        sound(y,Fs)
                        %     end
%                         if isempty(orderopt)
%                             disp('nicns lekezelve-> deafult:fold');
% %                             break;
%                         end
                        disp(orderopt);
                        pause(0.5);
                        %Control.Move(orderopt);
                        %                     break;
                    end
                end
                
            end
            randomPause(0.1,0.3); % min-max sec wait time, kev�sb� legyen �temes a k�pek beolvas�sa.
            
        end
    end
end
% functions ---------------------------------------------------------------


