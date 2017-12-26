% cardvals = strcat(card(1).value,card(2).value,card(3).value,card(4).value,card(5).value,card(6).value,card(7).value);
% cardcols = strcat(card(1).color,card(2).color,color(3).value,card(4).color,card(5).color,card(6).color,card(7).color);
s='';
for i =1 : numOfCards
    s= s + card(i).color + ' ';
end
disp(s);