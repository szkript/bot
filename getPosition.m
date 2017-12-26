function c = getPosition(position)
dealblank = 0;
dealerbtn = 0;

for x = 1:140
    for y = 1:140
        
        if position(x,y) >= 140 &&position(x,y) <= 256
            dealerbtn= dealerbtn+1;
        elseif position(x,y) >= 1 && position(x,y) <= 139
            dealblank = dealblank+1;            
        end
        
        if dealerbtn >= 3000            
            obj = true;
            c = obj;
            return;
        end
        if dealblank >= 8000
            obj = false;
            c = obj;
            return;
        end
        
    end
end

c = false;

end
