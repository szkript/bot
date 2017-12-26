tiernumb = [];
winp = [];
history;
currentgame;
currentphase;
currentmove;
switch round
    
    case 1
        cardseen = strcat(card(1).name,card(2).name);
    case 2
        cardseen = strcat(card(1).name,card(2).name,card(3).name,card(4).name,card(5).name);
    case 3
        cardseen = strcat(card(1).name,card(2).name,card(3).name,card(4).name,card(5).name,card(6).name);
    case 4
        cardseen = strcat(card(1).name,card(2).name,card(3).name,card(4).name,card(5).name,card(6).name,card(7).name);
end
load q;

if isempty(myhand)%reset myhand at end
    if sameRound
        if btnupdate || cardupdate
            
            if round == 1
                
                run preflopmatch;
                %                 if myturn
                %                     run decide;
                if exist('MoveOrder','var')
                    if myturn || fastfold
                        
                        run decide;
                        
                        
                    end
                    disp(MoveOrder);
                    game(a).table(u).order = MoveOrder;
                else
                    game(a).table(u).order = [];
                end
                
            elseif round > 1
                tiernumb = [];
                winp = [];
                
            end
            
            game(a).table(u).cards = card;
            game(a).table(u).buttons = button;
            game(a).table(u).button1 = button(1).name;
            game(a).table(u).button2 = button(2).name;
            game(a).table(u).button2val = button(2).value;
            game(a).table(u).button3 = button(3).name;
            game(a).table(u).button3val = button(3).value;
            game(a).table(u).chips = player(1).chips;
            game(a).table(u).sum = cardseen;
            game(a).table(u).position = myposition;
            game(a).table(u).round = round;
            game(a).table(u).tier = tiernumb;
            game(a).table(u).winpercent = winp;
            
            
            save ('game.mat','game');
            asdf = sprintf('updated data %d',u);
            disp(asdf);
            
        end
        
    elseif newGame || newRound || nextdata
        
        if round == 1
            
            run preflopmatch;
            
            if exist('MoveOrder','var')
                if myturn || fastfold
                    run decide;
                   
                end
                game(a).table(q).order = MoveOrder;
            else
                game(a).table(q).order = [];
            end
            
        elseif round > 1
            tiernumb = [];
            winp = [];
        end
        
        game(a).table(q).cards = card;
        game(a).table(q).buttons = button;
        game(a).table(q).button1 = button(1).name;
        game(a).table(q).button2 = button(2).name;
        game(a).table(q).button2val = button(2).value;
        game(a).table(q).button3 = button(3).name;
        game(a).table(q).button3val = button(3).value;
        game(a).table(q).chips = player(1).chips;
        game(a).table(q).sum = cardseen;
        
        game(a).table(q).tier = tiernumb;
        game(a).table(q).winpercent = winp;
        
        game(a).table(q).position = myposition;
        game(a).table(q).round = round;
        save ('game.mat','game');
        asdf = sprintf('new data %d',q);
        disp(asdf);
        q =q+1;
        save ('q.mat','q');
        
        
    end
end

% if myturn && ~sameRound
%     if exist('tiernumb','var') && exist('winp','var')
%         if ~isempty(tiernumb) && ~isempty(winp)
%             disp('-----------');
%             disp(tiernumb);
%             disp(winp);
%             disp(MoveOrder);
%         end
%     end
% end

