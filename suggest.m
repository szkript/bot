disp('count active players');
run activity;
maxtier = config.maxtier;
disp('create suggestion');

if phase > 0
    
        disp('cardanalyze-> calculate winchance');
        disp('__________________');
        
        chances = CardAnalyze(hand,middle,playersAlive,1000,phase);
        mychance = chances(1)*100;     
end

if phase == 1    
    
    suggestion = preflop(hand,config,maxtier);          
    if mychance > 55
        suggeston = 'call';
    end
else
    
    if phase > 1                
        
        option = 'fold/check';
        if mychance > 15
            option = 'check';
        end
        if mychance > 40
            option = 'call cheap';
        end
        if mychance > 58
            option = 'call';
        end
        if mychance > 84
            option = 'raise';
        end
        
        suggestion = option;
        
        
    end
end

if exist('suggestion','var')
    disp('- - - - -');
    disp(suggestion);    
    disp(mychance);
    disp('- - - - -');
    cardcolors = [hand.card1.color,',',hand.card2.color];
    disp(cardcolors);
    dispPhase = sprintf('phase : %d',phase);
    disp(dispPhase);
    disp('__________________');
    
end


%% functions


function z = preflop(hand,config,maxtier)


    suit = false;
    if strcmp(hand.card1.color,hand.card2.color)
        suit = true;
    end
    
    for i = 1:size(config.preflop,1)
        
        if hand.card1.value == config.preflop(i).mc1 && hand.card2.value == config.preflop(i).mc2
            suggestion='fold/check';
            if suit
                if config.preflop(i).suittier <= maxtier
                    suggestion='call';                
                end
                mytier = sprintf('my tier : %d',config.preflop(i).suittier);
               
            else
                if config.preflop(i).tier <= maxtier
                    suggestion='call';                              
                end   
                 mytier = sprintf('my tier : %d',config.preflop(i).tier);
                
            end
            disp('-------')
            winpercento = sprintf('winpercent : %d',config.preflop(i).winpercent);
            disp(winpercento);
            mymaxtier = sprintf('max tier : %d', maxtier);            
            disp(mytier);
            disp(mymaxtier);
        end
    end
    
z = suggestion;
end