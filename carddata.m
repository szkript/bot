
for n = 1:numOfCards
    imshow(read.card(n));
    read.card(n).name = ocr(read.card(n).value,'CharacterSet', '0123456789JQKA', 'TextLayout', 'Block');
    
    value = read.card(n).name.Words;
    
    if strcmp(value,'K3')
        read.card(n).name = 'T';
        read.card(n).value = 10;
    elseif strcmp(value,'0')
        read.card(n).name = 'Q';
        read.card(n).value = 12;
    elseif strcmp(value,'KJ')
        read.card(n).name = 'T';
        read.card(n).value = 10;
    elseif strcmp(value,'K1')
        read.(n).name = 'T';
        read.card(n).value = 10;
    else
        read.card(n).name = value;
    end
    
    if strcmp(read.card(n).name,'T') == 1
        read.card(n).value = str2double('10');
    elseif strcmp(read.card(n).name,'J') == 1
        read.card(n).value = str2double('11');
    elseif strcmp(read.card(n).name,'Q') == 1
        read.card(n).value = str2double('12');
    elseif strcmp(read.card(n).name,'K') == 1
        read.card(n).value= str2double('13');
    elseif strcmp(read.card(n).name,'A') == 1
        read.card(n).value = str2double('14');
    else
        read.card(n).value = str2double(read.card(n).name);
        
    end
    
    
end

for n = 1:7
    read.card(n).exist = true;
    if isempty(read.card(n).name)
        read.card(n).value = [];
        read.card(n).exist = false;
    end
    
end


for n = 1:2
    if isempty(read.card(n).value)
        fine = false;
        break;
    end
    fine = true;
end

if round == 1 && exist('hand','var')
    preflopcheck = true;
else
    preflopcheck = false;
end
clearvars b c n value;


% end
% myhand=upLoadHand(card);
% mymiddle=upLoadMiddle(card);

% function myh=upLoadHand(card)
%     myh=hand;
%     cardArray={length(card)};
%     for i = 1:length(card)%feltoltjuk a cardokat 
%         tmpcard=kartya;
%         cardArray{i}=tmpcard.setCard(card(i).value,card(i).color,i);
%     end
%     if length(card)>1
%         myh=myh.addCards(cardArray(1),cardArray(2));
%     end
% 
% end
% function mymid=upLoadMiddle(card)
%     mymid=middle;
%     cardArray={length(card)};
%     for i = 1:length(card)%feltoltjuk a cardokat 
%         tmpcard=kartya;
%         cardArray{i}=tmpcard.setCard(card(i).value,card(i).color,i);
%     end
%     if length(card)>2
%         mymid=mymid.addFlop({cardArray(3), cardArray(4), cardArray(5)});
%     end
%     if length(card)>5
%         mymid=mymid.addTurn(cardArray(6));
%     end
%     if length(card)>6
%         mymid=mymid.addRiver(cardArray(7));
%     end
% end
%     
% 
% 
