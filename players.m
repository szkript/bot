tmp = player;

% set player 1 , activitás átmeneti megoldása
id = 'szkript';
money = playerMoney(read.player(1).chips);
moneyInPot = potmoney(read.potmoney(1).position);

player(1) = tmp.setPlayer(id,money,moneyInPot);


for i = 2:config.players    
    id = playerId(read.player(i).name);
    money = playerMoney(read.player(i).chips);
    moneyInPot = potmoney(read.potmoney(i).position);
   
    player(i:config.players) = tmp.setPlayer(id,money,moneyInPot);    
end

%This replaces all except numbers from 0 to 9
% recognizedText = recognizedText.replaceAll("[^0-9]+", " ");

function p = potmoney(potmoney)
% imshow(playerMoney);
read= ocr(potmoney,'Language','trainedData/chips/tessdata/chips.traineddata');
if isempty(read.Words)
    obj = false;
    p = obj;
    return;
end
obj = strrep(read.Words(1),'$','');
obj = strrep(obj,' ','.');
obj = char(obj);
obj = str2double(obj);
if isnan(obj)
obj = strrep(read.Text,'$','');
obj = strrep(obj,' ','');
obj = char(obj);
obj = str2double(obj);
end

p=obj;
end

function f = playerId(playerName)
read = ocr(playerName,'Language','trainedData/eng/tessdata/eng_old.traineddata');
name = read.Text;
obj = cellstr(name);
f = obj;
end

function g = playerMoney(playerMoney)
% imshow(playerMoney);
read= ocr(playerMoney,'Language','trainedData/chips/tessdata/chips.traineddata');
if isempty(read.Words)
    obj = false;
    g = obj;
    return;
end
obj = strrep(read.Words(1),'$','');
obj = strrep(obj,' ','.');
obj = char(obj);
obj = str2double(obj);
if isnan(obj)
obj = strrep(read.Text,'$','');
obj = strrep(obj,' ','');
obj = char(obj);
obj = str2double(obj);
end
g = obj;
end


