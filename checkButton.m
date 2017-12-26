function a = checkButton(obj,width,height)



btnblank = 0;
btnbck = 0;
scrap=0;


for x = 1:width
    for y = 1:height
        if obj.name(x,y) >= 10 && obj.name(x,y) <= 27
            btnbck = btnbck+1;
            
        elseif obj.name(x,y) >= 32 && obj.name(x,y) <= 51
            btnbck = btnbck+1;
            
        elseif obj.name(x,y) >= 28 && obj.name(x,y) <= 31
            btnblank = btnblank+1;
            
        else
            scrap = scrap+1;
            
        end
        
        
        if btnbck > 2500
            name = ocr(obj.name,'CharacterSet', '$CALBTFODRISEHKcalfodrisechbtk', 'TextLayout', 'Block');
            obj.name = name.Words(1);
            if strcmp(obj.name,'Fold')
                obj.value = [];
            else
                value = ocr(obj.value,'CharacterSet', '$0123456789', 'TextLayout', 'Block');
                obj.value = strrep(value.Text,'$','');
                obj.value = strrep(obj.value,' ','.');
                obj.value = char(obj.value);
                obj.value = str2double(obj.value);
            end
            break;
        end
        
        if btnblank > 700
            obj.name = [];
            obj.value = [];
            a = obj;
            return;
        end
        
        if scrap > 2000
            obj.name = [];
            a = obj;
            return;
        end
        
    end
    if isempty(obj.name)
        break;
    elseif strcmp(obj.name,'Fold')
        break;
    elseif strcmp(obj.name,'Call')
        break;
    elseif strcmp(obj.name,'Raise')
        break;
    elseif strcmp(obj.name,'Bet')
        break;
    elseif strcmp(obj.name,'Check')
        break;
    end
end
a = obj;

end
