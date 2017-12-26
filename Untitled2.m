%     screenshtNew = 'screen.jpg';
%     screenshtNew = imread(screenshtNew);
%     screenshtNew = impixel(screenshtNew);
%     r = screenshtNew(:,:,1),1,[];
clear;
load readcucc;
[r,x] = imhist(read.card(1).color(:,:,1)); % select one of 3 channels
[g,x] = imhist(read.card(1).color(:,:,2));
[b,x] = imhist(read.card(1).color(:,:,3));