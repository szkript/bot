function g = unstucker(compare,phase,cardcolor)
obj = false;

if exist('phase','var')
    if phase ~= 0
        if phase ~= compare.phase   
            disp('eltérõ phase');
            obj = true;
            g = obj;
            return;
        end
    end
end

if exist('cardcolor','var')
    for i = 1:2
        
        if isempty(cardcolor{i})
            disper= sprintf('card %d is wrong',i);
            disp(disper);
            obj = true;
            g = obj;
            return;
            
        end
        
        if cardcolor{i} ~= compare.cardcolor{i}    
        obj = true;
        g = obj;
        disp('eltérõ kártya szín');
        return;
        end
    end
    
end

g = obj;
end