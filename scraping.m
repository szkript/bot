
for i = 1:7
%     imshow(read.card(i).value)
    cardcolor{i} = readColor(read.card(i).color,w.cardColor,h.cardColor);     %színkódarray,szélességpx,hosszúságpx
    
    
end

numOfCards = 0;

for i = 1:7
    if isempty(cardcolor{i})
        break;
    else
        numOfCards = numOfCards+1;
    end
end


switch numOfCards
    case {0,1}
        phase = 0;
    case 2
        phase = 1;
    case 5
        phase = 2;
    case 6
        phase = 3;
    case 7
        phase = 4;
   
end

function a = readColor(obj,width,height)
void = 0;
match = 0;

% imshow(obj);

minHeight = height/10;
minWidth = width/10;

maxHeight = height-minHeight;
maxWidth = width-minWidth;

for i = 1:150
    y = randi(maxHeight)+minHeight;
    x = randi(maxWidth)+minWidth;
    
    
    pixelColor = impixel(obj,x,y);      %r,g,b (1,2,3)
    red=pixelColor(1);
    green =pixelColor(2);
    blue =pixelColor(3);
    
    
    diamond = colorMatch(red,green,blue,63,70,96,103,107,113);
    spades = colorMatch(red,green,blue,59,61,59,61,59,61);
    heart = colorMatch(red,green,blue,134,136,43,45,38,41);
    club = colorMatch(red,green,blue,85,93,135,145,49,57);
    
    
    
    if diamond || spades || heart || club
        match = match+1;
    else
        void = void+1;
    end
    
    if match > 5
        if diamond
            a = 'D';
            return;
        elseif spades
            a = 'S';
            return;
        elseif club
            a = 'C';
            return;
        elseif heart
            a = 'H';
            return
        end
    end
    
    if void >=140
        a = [];
        return;
    end
end



end



