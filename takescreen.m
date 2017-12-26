% disp(progRound);
screenshtNew = config.path;

robo = java.awt.Robot;
t = java.awt.Toolkit.getDefaultToolkit();
rectangle = java.awt.Rectangle(t.getScreenSize());
image = robo.createScreenCapture(rectangle);
filehandle = java.io.File(screenshtNew);
javax.imageio.ImageIO.write(image,'jpg',filehandle);

new = imread(screenshtNew);
run something;

new = imcrop(new,[config.WindowStartingWidth config.WindowStartingHeight 790 575]);
new = imresize(new, 5);
%     imshow(new);

run coordinates;

run scraping;
if ~exist('phase','var')
    phase = 0;
end

screenData = screenFix(phase,read,cardcolor);
if ~isempty(screenData.mymoney)
config.mymoney = screenData.mymoney;   
% disp(config.mymoney);
end

% function seciton---------------------------------------------------

function p = screenFix(phase,read,cardcolor)

% imshow(read.player(1).chips);
money = playerMoney(read.player(1).chips);
if isempty(money)    
    obj.mymoney = [];
end
if isnan(money)    
    obj.mymoney = [];
else
%     disp('my money');
%     disp(money);
    obj.mymoney = money;
end


    if isempty(cardcolor{1}) && isempty(cardcolor{2})
        obj.feedback = false;
        p = obj;
%         disp('waiting for card') 
        return;
    end


if ~exist('phase','var')
    obj.feedback = false;
    p = obj;
    disp('nincs phase')
    return;
end

switch phase
    case 1
        if isempty(cardcolor{1}) && isempty(cardcolor{2})
            obj.feedback = false;
            p = obj;
            disp('empty cardcolor')
            return;
        end
        
        cardvalue{2} = getValue(read.card(2).value);
        if isempty(cardvalue{2}) || isnan(cardvalue{2})
            
            obj.feedback = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
        
    case 2
        
        cardvalue{5} = getValue(read.card(5).value);
        if isempty(cardvalue{5}) || isnan(cardvalue{5})
            obj.feedback = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
    case 3
        
        cardvalue{6} = getValue(read.card(6).value);
        if isempty(cardvalue{6}) || isnan(cardvalue{6})
            obj.feedback = false;
            p = obj;
            return;
        end
    case 4
        
        cardvalue{7} = getValue(read.card(7).value);
        if isempty(cardvalue{7}) || isnan(cardvalue{7})
            obj.feedback = false;
            p = obj;
            disp('isnan or empty cardvalue')
            return;
        end
        
    case 0
        
        obj.feedback = false;
        p = obj;
%         disp('phase 0')
        return;
        
        
end


obj.feedback = true;
% disp('good pic');
p = obj;

end



function b = getValue(cardval)
% imshow(cardval);
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
read= ocr(playerMoney,'Language','trainedData/chips/tessdata/chips.traineddata');
obj = strrep(read.Text,'$','');
obj = strrep(obj,' ','');
obj = char(obj);
obj = str2double(obj);

g = obj;
end

