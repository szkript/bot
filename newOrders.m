if ~isempty(button(2).value)
    btnval = sprintf('btn val: %d',button(2).value);
    disp(btnval);
    disp(button(2).value);
    cashdisplay = sprintf('my money : %d',config.mymoney);
    disp(cashdisplay);
    disp(config.mymoney);
    bb = config.mymoney/button(2).value;
    bbNature = bb;
    bb = sprintf('bb : %d ',bb);
    disp(bb);
    disp(bbNature);
end
%% default -> fold
orderopt = 'fold';

%%  fold , check

if strcmp(suggestion,'fold/check')
    
    
    %% ha nicns fold akk sneakysneaky ofc csak ha megéri cigánykodni
    if strcmp(button(2).name,'Check') && strcmp(button(3).name,'Bet')
        if strcmp(button(2).name,'Check')
            orderopt = 'check';
        end
        
    end
end


%% check
if strcmp(suggestion,'check')
    %% lehet checkelni
    
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
    end
    
    
end
%% call cheap
if strcmp(suggestion,'call cheap')
    %% ide kell bb calc
    
    if strcmp(button(2).name,'Call')
        if button(2).value <=  config.bigBlind*2
            orderopt = 'call';
        end
    end
    
    %%
    
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
    end
    
    
end
%% call
if strcmp(suggestion,'call')
    %% call
    
    if strcmp(button(2).name,'Call')
        if bb < 10
            if mychance > 90
              orderopt = 'call';
            end
        end
        if bb > 10
            orderopt = 'call';
        end
        
        if phase >= 3
            if bb < 20                
               if mychance >= 70 
                 orderopt = 'call';
               end
            end
        end
        
    end
    
    %% check
    
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
        if phase == 3
            orderopt = 'raiseX3';
        end
    end
    
    
    
end
%% bet
if strcmp(suggestion,'bet')
    
    
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
        if phase == 3
            orderopt = 'raiseX3';
        end
    end
    
    
    
    
end
%% raise
if strcmp(suggestion,'raise')
    if strcmp(button(2).name,'Call') && strcmp(button(3).name,'Raise')
        orderopt = 'raiseX3';
    end
    if strcmp(button(2).name,'Check') && strcmp(button(3).name,'Bet')
        orderopt = 'raiseX3';     %majd bet késõbb,am ua.
    end
    
    
end
%% allin
if strcmp(button(1).name,'Fold') && strcmp(button(3).name,'Call')
    if mychance > 90
        orderopt =  'call';
    end
end