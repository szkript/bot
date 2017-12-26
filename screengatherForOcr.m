clear;

dataSet = 1;
folder = '1/';
fol=dir([folder '/*.jpg']);
out=size(fol,1);
config.players=9;


for u = 1:out
    clearex('out','u');
    disp(u);
    config.path = sprintf('1/screen%d.jpg', u);
    
    
    screenshtNew = config.path;
    
    
    % robo = java.awt.Robot;
    % t = java.awt.Toolkit.getDefaultToolkit();
    % rectangle = java.awt.Rectangle(t.getScreenSize());
    % image = robo.createScreenCapture(rectangle);
    % filehandle = java.io.File(screenshtNew);
    % javax.imageio.ImageIO.write(image,'jpg',filehandle);
    
    new = imread(screenshtNew);
    new = imcrop(new,[1122 460 790 575]);
    
    new = imresize(new, 5);
    %     imshow(new);
    
    
    
    %     w.playerChips = 400;
    %     h.playerChips = 100;
    %
    %     read.player(1).chips = imcrop(new, [1695 2160 w.playerChips h.playerChips]);
    %     read.player(2).chips = imcrop(new, [555 1945 w.playerChips h.playerChips]);
    %     read.player(3).chips = imcrop(new, [100 1365 w.playerChips h.playerChips]);
    %     read.player(4).chips = imcrop(new, [295 815 w.playerChips h.playerChips]);
    %     read.player(5).chips = imcrop(new, [1090 530 w.playerChips h.playerChips]);
    %     read.player(6).chips = imcrop(new, [2440 530 w.playerChips h.playerChips]);
    %     read.player(7).chips = imcrop(new, [3240 805 w.playerChips h.playerChips]);
    %     read.player(8).chips = imcrop(new, [3425 1365 w.playerChips h.playerChips]);
    %     read.player(9).chips = imcrop(new, [2980 1945 w.playerChips h.playerChips]);
    %
    %
    %     w.playerName = 440;
    %     h.playerName = 120;
    %
    %     read.player(1).name = imcrop(new, [1730 2040 w.playerName h.playerName]);
    %     read.player(2).name = imcrop(new, [525 1835 w.playerName h.playerName]);
    %     read.player(3).name = imcrop(new, [30 1250 w.playerName h.playerName]);
    %     read.player(4).name = imcrop(new, [285 690 w.playerName h.playerName]);
    %     read.player(5).name = imcrop(new, [1070 415 w.playerName h.playerName]);
    %     read.player(6).name = imcrop(new, [2430 410 w.playerName h.playerName]);
    %     read.player(7).name = imcrop(new, [3212 683 w.playerName h.playerName]);
    %     read.player(8).name = imcrop(new, [3435 1245 w.playerName h.playerName]);
    %     read.player(9).name = imcrop(new, [2970 1830 w.playerName h.playerName]);
    w.cardColor = 200;
    h.cardColor = 50;
    
    read.card(1).color = imcrop(new, [1725 1975 w.cardColor h.cardColor]);
    read.card(2).color = imcrop(new, [1980 1975 w.cardColor h.cardColor]);
    read.card(3).color = imcrop(new, [1315 1185 w.cardColor h.cardColor]);
    read.card(4).color = imcrop(new, [1590 1185 w.cardColor h.cardColor]);
    read.card(5).color = imcrop(new, [1860 1185 w.cardColor h.cardColor]);
    read.card(6).color = imcrop(new, [2125 1185 w.cardColor h.cardColor]);
    read.card(7).color = imcrop(new, [2400 1185 w.cardColor h.cardColor]);
    
    
    w.cardValue = 115;
    h.cardValue = 145;
    
    read.card(1).value = imcrop(new, [1730 1835 w.cardValue  h.cardValue]);
    read.card(2).value = imcrop(new, [1970 1835 w.cardValue  h.cardValue]);
    read.card(3).value = imcrop(new, [1320 1040 w.cardValue  h.cardValue]);
    read.card(4).value = imcrop(new, [1590 1040 w.cardValue  h.cardValue]);
    read.card(5).value = imcrop(new, [1860 1036 w.cardValue  h.cardValue]);
    read.card(6).value = imcrop(new, [2130 1036 w.cardValue  h.cardValue]);
    read.card(7).value = imcrop(new, [2400 1040 w.cardValue  h.cardValue]);
    
    %     for i = 1:9
    %         q = read.player(i).chips;
    %         o = read.player(i).name;
    %         imname = sprintf('gathered/chips/%i/chip%d.jpg',i,u);
    %         imwrite(q,imname);
    %         imname = sprintf('gathered/names/%i/pname%d.jpg',i,o);
    %         imwrite(o,imname);
    %     end
    
    run scraping;
    for i = 1:numOfCards
        q = read.card(i).value;
        imname = sprintf('gathered/card/%i/chip%d.jpg',i,u);
        imwrite(q,imname);
    end
    
end
sound(randn(4096, 1), 8192);
