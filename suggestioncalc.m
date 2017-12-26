bigBlind = config.bigBlind;
orderopt = [];
if strcmp(suggestion,'fold/check')
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
    elseif strcmp(button(1).name,'Fold')
        
        orderopt = 'fold';
    end
    
end

if strcmp(suggestion,'check/call')
    
    if strcmp(button(2).name,'Check')
        
        orderopt = 'check';
    elseif strcmp(button(2).name,'Call')
        
        orderopt = 'call';
    end
    
end


if strcmp(suggestion,'check')
    if isempty(button(2).name) && strcmp(button(1).name,'Fold')
        orderopt='fold';
    end
    if strcmp(button(2).name,'Check')
        orderopt = 'check';
    elseif strcmp(button(2).name,'Call')
        if phase == 1
            if button(2).value <= bigBlind || button(3).value <= bigBlind
                orderopt ='call';
            else
                orderopt = 'fold';
            end
        else
            orderopt = 'fold';
        end
    end
end


if strcmp(suggestion,'call cheap')
    if isempty(button(2).name) && strcmp(button(1).name,'Fold')
        orderopt='fold';
    end
    if strcmp(button(2).name,'Call')
        bb = config.mymoney/button(2).value;
        if isnan(bb)
            orderopt = 'check';
        else            

            if button(2).value <= bigBlind*3
                orderopt ='call';
            else
                orderopt = 'fold';
            end
            
            %
        end
        
    elseif strcmp(button(2).name,'Check')
        orderopt = 'check';
        
    end
    
end


if strcmp(suggestion,'call')
    if strcmp(button(2).name,'Call')
        
        bb = config.mymoney/button(2).value;
        if ~isnan(bb)
            disp(bb);
            
        end
        if phase == 1
            if mychance > 40
                if button(2).value < 1000
                    orderopt ='call';
                else
                    orderopt = 'fold';
                end
            end
            if mychance > 80
                
                orderopt ='call';
                
            end
        end
        if phase > 1
            orderopt = 'fold';
            if mychance > 60
                if button(2).value < 2000
                    orderopt ='call';                
                end
            end
            if mychance > 90                
                orderopt ='call';            
            end
        end
    end
end


if strcmp(button(2).name,'Check')
    orderopt = 'check';
end



if strcmp(suggestion,'raise')
    
    orderopt = 'raise';
    
end