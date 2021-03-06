run blindSet;
%% cards
w.cardValue = 130;
h.cardValue = 150;

handHeightLine = 1847;
midHeightLine = 1045;

read.card(1).value = imcrop(new, [1715 handHeightLine w.cardValue  h.cardValue]);
read.card(2).value = imcrop(new, [1968 handHeightLine w.cardValue  h.cardValue]);
read.card(3).value = imcrop(new, [1303 midHeightLine w.cardValue  h.cardValue]);
read.card(4).value = imcrop(new, [1572 midHeightLine w.cardValue  h.cardValue]);
read.card(5).value = imcrop(new, [1843 midHeightLine w.cardValue  h.cardValue]);
read.card(6).value = imcrop(new, [2140 midHeightLine w.cardValue  h.cardValue]);
read.card(7).value = imcrop(new, [2410 midHeightLine w.cardValue  h.cardValue]);

w.cardColor = 200;
h.cardColor = 50;

handHeightLine = 1975;
midHeightLine = 1185;

read.card(1).color = imcrop(new, [1725 handHeightLine w.cardColor h.cardColor]);
read.card(2).color = imcrop(new, [1980 handHeightLine w.cardColor h.cardColor]);
read.card(3).color = imcrop(new, [1315 midHeightLine w.cardColor h.cardColor]);
read.card(4).color = imcrop(new, [1590 midHeightLine w.cardColor h.cardColor]);
read.card(5).color = imcrop(new, [1860 midHeightLine w.cardColor h.cardColor]);
read.card(6).color = imcrop(new, [2125 midHeightLine w.cardColor h.cardColor]);
read.card(7).color = imcrop(new, [2400 midHeightLine w.cardColor h.cardColor]);
%% buttons

w.buttonName = 500;
h.buttonName = 200;

read.button(1).name = imcrop(new, [1960 2610 w.buttonName h.buttonName]);
read.button(2).name = imcrop(new, [2640 2610 w.buttonName h.buttonName]);
read.button(3).name = imcrop(new, [3310 2610 w.buttonName h.buttonName]);

w.buttonValue = 450;
h.buttonValue = 120;

read.button(2).value = imcrop(new, [2780 2710 w.buttonValue h.buttonValue]);
read.button(3).value = imcrop(new, [3400 2700 w.buttonValue h.buttonValue]);

read.pot = imcrop(new, [1790 875 400 50]);

read.callprice = imcrop(new, [2900 2560 300 80]);
%% players
switch config.players
    
    case 9
        
        w.playerActivity = 600;
        h.playerActivity = 120;
        
        %         player(1).activity = imcrop(new, [1750 2165 w.playerActivity h.playerActivity]);
        read.player(2).activity = imcrop(new, [560 1695 w.playerActivity h.playerActivity]);
        read.player(3).activity = imcrop(new, [140 1120 w.playerActivity h.playerActivity]);
        read.player(4).activity = imcrop(new, [360 550 w.playerActivity h.playerActivity]);
        read.player(5).activity = imcrop(new, [1135 270 w.playerActivity h.playerActivity]);
        read.player(6).activity = imcrop(new, [2325 295 w.playerActivity h.playerActivity]);
        read.player(7).activity = imcrop(new, [3100 550 w.playerActivity h.playerActivity]);
        read.player(8).activity = imcrop(new, [3318 1110 w.playerActivity h.playerActivity]);
        read.player(9).activity = imcrop(new, [2850 1680 w.playerActivity h.playerActivity]);
        
        w.playerName = 500;
        h.playerName = 120;
        
        read.player(1).name = imcrop(new, [1720 2035 w.playerName h.playerName]);
        read.player(2).name = imcrop(new, [525 1825 w.playerName h.playerName]);
        read.player(3).name = imcrop(new, [30 1245 w.playerName h.playerName]);
        read.player(4).name = imcrop(new, [285 685 w.playerName h.playerName]);
        read.player(5).name = imcrop(new, [1080 415 w.playerName h.playerName]);
        read.player(6).name = imcrop(new, [2430 405 w.playerName h.playerName]);
        read.player(7).name = imcrop(new, [3212 683 w.playerName h.playerName]);
        read.player(8).name = imcrop(new, [3435 1240 w.playerName h.playerName]);
        read.player(9).name = imcrop(new, [2970 1830 w.playerName h.playerName]);
        
        w.playerChips = 450;
        h.playerChips = 100;
        
        read.player(1).chips = imcrop(new, [1680 2170 w.playerChips h.playerChips]);
        read.player(2).chips = imcrop(new, [555 1960 w.playerChips h.playerChips]);
        read.player(3).chips = imcrop(new, [100 1380 w.playerChips h.playerChips]);
        read.player(4).chips = imcrop(new, [300 810 w.playerChips h.playerChips]);
        read.player(5).chips = imcrop(new, [1170 500 w.playerChips h.playerChips]);
        read.player(6).chips = imcrop(new, [2470 530 w.playerChips h.playerChips]);
        read.player(7).chips = imcrop(new, [3240 800 w.playerChips h.playerChips]);
        read.player(8).chips = imcrop(new, [3430 1380 w.playerChips h.playerChips]);
        read.player(9).chips = imcrop(new, [3010 1960 w.playerChips h.playerChips]);
        
        
        w.playerSeat = 230;
        h.playerSeat = 95;
        
        read.player(2).seat = imcrop(new, [740 1870 w.playerSeat h.playerSeat]);
        read.player(3).seat = imcrop(new, [275 1290 w.playerSeat h.playerSeat]);
        read.player(4).seat = imcrop(new, [498 730 w.playerSeat h.playerSeat]);
        read.player(5).seat = imcrop(new, [1278 440 w.playerSeat h.playerSeat]);
        read.player(6).seat = imcrop(new, [2460 440 w.playerSeat h.playerSeat]);
        read.player(7).seat = imcrop(new, [3240 720 w.playerSeat h.playerSeat]);
        read.player(8).seat = imcrop(new, [3450 1285 w.playerSeat h.playerSeat]);
        read.player(9).seat = imcrop(new, [3000 1865 w.playerSeat h.playerSeat]);
        
        w.dealerchip = 150;
        h.dealerchip = 140;
        
        read.dealerchip(1).position = imcrop(new, [2260 1760 w.dealerchip h.dealerchip]);
        read.dealerchip(2).position = imcrop(new, [1220 1695 w.dealerchip h.dealerchip]);
        read.dealerchip(3).position = imcrop(new, [695 1135 w.dealerchip h.dealerchip]);
        read.dealerchip(4).position = imcrop(new, [845 925 w.dealerchip h.dealerchip]);
        read.dealerchip(5).position = imcrop(new, [1360 690 w.dealerchip h.dealerchip]);
        read.dealerchip(6).position = imcrop(new, [2515 700 w.dealerchip h.dealerchip]);
        read.dealerchip(7).position = imcrop(new, [2990 930 w.dealerchip h.dealerchip]);
        read.dealerchip(8).position = imcrop(new, [3130 1105 w.dealerchip h.dealerchip]);
        read.dealerchip(9).position = imcrop(new, [2660 1670 w.dealerchip h.dealerchip]);
        
        
        w.potmoney = 500;
        h.potmoney = 100;
        
        read.potmoney(1).position = imcrop(new, [1922 1630 w.potmoney h.potmoney]);
        read.potmoney(2).position = imcrop(new, [1250 1570 w.potmoney h.potmoney]);
        read.potmoney(3).position = imcrop(new, [900 1365 w.potmoney h.potmoney]);
        read.potmoney(4).position = imcrop(new, [1122 846 w.potmoney h.potmoney]);
        read.potmoney(5).position = imcrop(new, [1645 730 w.potmoney h.potmoney]);
        read.potmoney(6).position = imcrop(new, [2102 700 w.potmoney h.potmoney]);
        read.potmoney(7).position = imcrop(new, [2575 850 w.potmoney h.potmoney]);
        read.potmoney(8).position = imcrop(new, [2600 1375 w.potmoney h.potmoney]);
        read.potmoney(9).position = imcrop(new, [2470 1574 w.potmoney h.potmoney]);
        
        
    case  6
        
        w.dealerchip = 140;
        h.dealerchip = 140;
        
        read.dealerchip(1).position = imcrop(new, [2255 1780 w.dealerchip h.dealerchip]);
        read.dealerchip(2).position = imcrop(new, [955 1580 w.dealerchip h.dealerchip]);
        read.dealerchip(3).position = imcrop(new, [820 930 w.dealerchip h.dealerchip]);
        read.dealerchip(4).position = imcrop(new, [1620 650 w.dealerchip h.dealerchip]);
        read.dealerchip(5).position = imcrop(new, [3045 940 w.dealerchip h.dealerchip]);
        read.dealerchip(6).position = imcrop(new, [2870 1590 w.dealerchip h.dealerchip]);
        
        
end
clearvars new screenshtNew;

%% functions
function o = findBlind(guess)
obj = [];

a = readBlind(guess);

if ~isempty(a)
    obj = true;
    o = obj;
    return;
end

o = obj;
end

function g = readBlind(bigBlind)
read= ocr(bigBlind);
if isempty(read.Words)
    g = [];
    return;
end
read =read.Words(1);
obj = strrep(read(1),'5','');
obj = char(obj);
obj = str2double(obj);
if isnan(obj)
    g = [];
    return;
end
if obj <= 0
    g = [];
    return;
end
% if obj*1000 > 100       % disable if playmoney
%     g = [];
%     return;
% end

g = obj;
end