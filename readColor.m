function a = readColor(obj,width,height)
void = 0;

minHeight = height/10;
minWidth = width/10;

maxHeight = height-minHeight;
maxWidth = width-minWidth;

% imshow(obj);

for i = 1:50
    y = randi(maxHeight)+minHeight;
    x = randi(maxWidth)+minWidth;
    
    
    pixelColor = impixel(obj,x,y);      %r,g,b (1,2,3)
    red=pixelColor(1);
    green =pixelColor(2);
    blue =pixelColor(3);
    
    
    example = colorMatch(red,green,blue,63,70,96,103,107,113);
   
    
    if example
        a = true;
        return;
    
    else
        
        void = void+1;
    end
    
    if void >=45
        a = [];
        return;
    end
end

end