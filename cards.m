tmp = card;

for i=1:numOfCards
    cardvalue{i} = getValue(read.card(i).value);
    if isnan(cardvalue{i})       
       break;   
    end
    
    card(i) = tmp.setCard(cardvalue{i},cardcolor{i},i);
end


function b = getValue(cardval)
% imshow(cardval);
readin = ocr(cardval,'CharacterSet', '0123456789JQKA', 'TextLayout', 'Block');
value = readin.Words;
% readin2 = ocr(cardval,'Language','trainedData/cardValue/tessdata/cardValue.traineddata');
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