for i = 1:config.players
    
    posinfo = readColor(read.dealerchip(i).position,w.dealerchip,h.dealerchip) ;
    
    if posinfo
        
        if config.players == 9           
            switch i
                case {1,2,3}    % early position
                    myposition = 'late';                    
                    maxtier = 2;
                case {4,5,6}    % mid pos
                    myposition = 'mid';
                    maxtier = 1;
                case {9,7,8}    % late pos
                    myposition = 'early';
                    maxtier = 0;
            end
            readControl.myposition = myposition;
           
        elseif config.players == 6
            switch i
                case {1,2}    % early position
                    myposition = 'late';
                    maxtier = 2;
                case {3,4}    % mid pos
                    myposition = 'mid';
                    maxtier = 1;
                case {5,6}    % late pos
                    myposition = 'early';
                    maxtier = 0;
            end            
           
           
        end
        config.maxtier = maxtier;
    end
end



function a = readColor(obj,width,height)
void = 0;
trashTrack = 0;
match = 0;


minHeight = height/10;
minWidth = width/10;

maxHeight = height-minHeight;
maxWidth = width-minWidth;

% imshow(obj);

for i = 1:150
    y = randi(maxHeight)+minHeight;
    x = randi(maxWidth)+minWidth;
    
    
    pixelColor = impixel(obj,x,y);      %r,g,b (1,2,3)
    red=pixelColor(1);
    green =pixelColor(2);
    blue =pixelColor(3);
    
    
    inner = colorMatch(red,green,blue,180,235,5,20,2,34);
    outter = colorMatch(red,green,blue,180,220,190,240,177,224);
    dealBlank = colorMatch(red,green,blue,0,5,107,123,34,42);
    
    if inner || outter
        match = match+1;
    else
        void = void+1;
    end
    
        if match > 5
            a = true;
            return;
        end       
        
    if dealBlank
       trashTrack = trashTrack+1;
    end
    
    if void >=140 || trashTrack > 70
        a = [];
        return;
    end
end

end

