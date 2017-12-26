
while true
    clearex('config');
    config.players=9;
    config.path = '7/screen1.jpg';
    
    run takescreen;
    run scraping;
    
   screenFixated = screenFixBase(phase,read,cardcolor);
    if screenFixated 
        disp('namostjógechi');
    end
end


function p = screenFixBase(phase,read,cardcolor)


money = playerMoney(read.player(1).chips);
if isempty(money) || isnan(money)
    obj = false;
    p = obj;
    disp('isnan or empty money')
    return;    
end

if isempty(cardcolor{1}) && isempty(cardcolor{2})
    obj = false;
    p = obj;
    disp('empty color')
    return;
end
if ~exist('phase','var')
    obj = false;
    p = obj;
    disp('nincs phase')
    return;
end

switch phase
    case 1
        
        cardvalue{2} = getValue(read.card(2).value);
        if isempty(cardvalue{2}) || isnan(cardvalue{2})
            
            obj = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
        
    case 2
        
        cardvalue{5} = getValue(read.card(5).value);
        if isempty(cardvalue{5}) || isnan(cardvalue{5})
            obj = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
    case 3
        
        cardvalue{6} = getValue(read.card(6).value);
        if isempty(cardvalue{6}) || isnan(cardvalue{6})
            obj = false;
            p = obj;
            return;
        end
    case 4
        
        cardvalue{7} = getValue(read.card(7).value);
        if isempty(cardvalue{7}) || isnan(cardvalue{7})
            obj = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
        
    case 0
        
        obj = false;
        p = obj;
        disp('phase 0')
        return;
        
        
end


 obj = true;
 p = obj;
 
end



function b = getValue(cardval)
%
readin = ocr(cardval,'CharacterSet', '0123456789JQKA', 'TextLayout', 'Block');
value = readin.Words;

if strcmp(value,'K3')
    name = 'T';
    obj.value = 10;
elseif strcmp(value,'0')
    name = 'Q';
    obj.value = 12;
elseif strcmp(value,'KJ')
    name = 'T';
    obj.value = 10;
elseif strcmp(value,'K1')
    name = 'T';
    obj.value = 10;
else
    name = char(value);
end

if strcmp(name,'T') == 1
    obj.value = str2double('10');
elseif strcmp(name,'J') == 1
    obj.value = str2double('11');
elseif strcmp(name,'Q') == 1
    obj.value = str2double('12');
elseif strcmp(name,'K') == 1
    obj.value= str2double('13');
elseif strcmp(name,'A') == 1
    obj.value= str2double('14');
else
    obj.value = str2double(name);
    
end

b = obj.value;

end


function g = playerMoney(playerMoney)
read= ocr(playerMoney,'Language','bestpokerbot/tessdata/bestpokerbot.traineddata');
obj = strrep(read.Text,'$','');
obj = strrep(obj,' ','.');
obj = char(obj);
obj = str2double(obj);

g = obj;
end