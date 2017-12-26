%% képek elemzéshez +ocrtrain
    load proground;
    for i = 1:9
%         q = read.player(i).chips;
%         q = rgb2gray(q);
%         o = read.player(i).name;   
%         o = rgb2gray(o);
%         imname = sprintf('gathered/chips/chip%d-%d.jpg',progRound,i);
%         imwrite(q,imname);
%         imname = sprintf('gathered/names/pname%d-%d.jpg',progRound,i);
%         imwrite(o,imname);
%         if i > 2 && i < 8
%             v = read.card(i).value;
%             v = rgb2gray(v);
%             imname = sprintf('gathered/card/card%d-%d.jpg',progRound,i);
%             imwrite(v,imname);
%         end
        p = read.potmoney(i).position;   
        p = rgb2gray(p);
        imname = sprintf('gathered/potmoney/potmoney%d-%d.jpg',progRound,i);
        imwrite(p,imname);
    end
    progRound = progRound+1;
    save('proground.mat','progRound');