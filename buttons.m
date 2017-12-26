tmp = button;
for i = 1:3
    btn = readColor1(read.button(i),200,500);  %azért nem változóból van az érték mert itt az egész gomb képét nézi
    
    button(i:3) = tmp.setButton(btn);
    
end



function a = readColor1(obj,width,height)
void = 0;


% imshow(obj.name);

for i = 1:50
    y = randi(height);
    x = randi(width);
    
    
    pixelColor = impixel(obj.name,x,y);      %r,g,b (1,2,3)
    red=pixelColor(1);
    green =pixelColor(2);
    blue =pixelColor(3);
    
    
    buttonback = colorMatch(red,green,blue,63,120,0,20,0,10);
    
    
    if buttonback
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
        
        a = obj;
        return;
        
    else
        
        void = void+1;
    end
    
    if void >=45
        obj.name = [];
        obj.value = [];
        a = obj;
        return;
    end
end



end