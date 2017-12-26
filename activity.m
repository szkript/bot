% if ~isempty(cardcolor{1}) && ~isempty(cardcolor{2})
   activeP{1} = true;
   playersAlive = 1;
% else
%    activeP{1} = false;    
%    playersAlive = 0;
% end

for i = 2:config.players
activeP{i} = readColor2(read.player(i).activity,120,600);

if activeP{i}
playersAlive= playersAlive+1;
end      

end



function a = readColor2(obj,width,height)
void = 0;
trashTrack = 0;
match = 0;
if isempty (obj)
    a = false;
    return;
end

% imshow(obj);

minHeight = height/10;
minWidth = width/10;

maxHeight = height-minHeight;
maxWidth = width-minWidth;




for i = 1:150
    x = randi(maxHeight)+minHeight;
    y = randi(maxWidth)+minWidth;
    
    
    pixelColor = impixel(obj,x,y);      %r,g,b (1,2,3)
    red=pixelColor(1);
    green =pixelColor(2);
    blue =pixelColor(3);
    
    
    activity = colorMatch(red,green,blue,154,167,56,92,68,90);
    cardframe = colorMatch(red,green,blue,240,250,228,234,227,231);
    bckgColor1 = colorMatch(red,green,blue,30,37,32,37,40,44);
    
    if activity || cardframe
        match = match +1;        
    else
        
        void = void+1;
    end
    
    if bckgColor1
        trashTrack = trashTrack+1;
    end
    
    if match > 5
        obj = true;
        a = obj;
        return;
    end
    
    if void >=140 || trashTrack >= 100
        obj = false;
        a = obj;
        return;
    end
end



end




