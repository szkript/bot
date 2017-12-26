function e = isActive(data,widht,height)
if isempty(data)    %ha üres, false megy vissza  ,p1 et saját kártya szerint kell majd nézni
    e = false;
    return;
end

frame = 0;
out = 0;
inner = 0;
star = 0;
scrap = 0;

for x = 1:widht
    for y = 1:height
        
        if data(x,y) >= 230 && data(x,y) <= 240
            frame = frame+1;
        elseif data(x,y) >= 90 && data(x,y) <= 105
            out = out+1;
        elseif data(x,y) >= 97 && data(x,y) <= 112
            inner = inner+1;
        elseif data(x,y) >= 78 && data(x,y) <= 83
            star = star+1;
        else
            scrap = scrap+1;
        end
        
        summ = frame+out+inner+star;
        
        if summ > 10000
            data = true;
            e = data;
            return;
        end
        
        if scrap > 15000
            data = false;
            e = data;
            return;
        end
        
        
    end
end




e = data;
end
