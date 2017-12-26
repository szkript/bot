if isempty(config.WindowStartingWidth) && isempty(config.WindowStartingHeight)
    
    H = vision.TemplateMatcher;
    
    T = imread('img_templates/starsEmblem.jpg');
    T = rgb2gray(T);
    % % imshow(T);
    % T = imcrop(T,[1125 460 25 25]);
    % % T = imresize(T,5);
    % imshow(T);
    %
    % imwrite(T,'starsEmblem.jpg');
    I = imread('screen.jpg');
    I = rgb2gray(new);
    origin = I;
    startWidth = size(I,2) - size(I,2)/2-150;
    startHeight = size(I,1) - size(I,1)/1.5-150;
    I = imcrop(I,[startWidth startHeight 500 500]);
    imshow(I);
    LOC = step(H,I,T);
    WindowStartingWidth = startWidth+LOC(1)-15;
    WindowStartingHeight = startHeight+LOC(2)-15;
    config.WindowStartingWidth =WindowStartingWidth;
    config.WindowStartingHeight =WindowStartingHeight;
    p = imcrop(origin,[config.WindowStartingWidth config.WindowStartingHeight 790 570]);
    imshow(p);
    % H = vision.TemplateMatcher;
    save('vars/coordinateSet.mat','WindowStartingWidth','WindowStartingHeight');
    clearvars WindowStartingWidth WindowStartingHeight;
end
