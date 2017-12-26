% rank 1 - pár
% rank 2 - 2 pár
% rank 3 - drill
% rank 4 - sor
% rank 5 - flush
% rank 6 - full
% rank 7 - poker
% rank 8 - royalflush
rank = 0;
pairs=0;
pair1=0;
pair2=0;
drill=0;
card(1).value=4;
card(2).value=2;
card(3).value=2;
card(4).value=7;
card(5).value=2;
phase=5;
for i =1:length(card)
    for j =1+i:length(card)
        % kis segitseg a megerteshez
        % egyszerusites card(round(i).value to a var
        if card(i).value - card(j).value == 0
            if pair1 ==0 % elso par
                rank = 1;
                pairs= pairs + 1;
                pair1 = card(i).value;
                pair1ind1=i;
                pair1ind2=j;
            else
                if pair2 ==0 % masodik par
                    if (isValid(pair1ind1,pair1ind2,i,j) == 1)
                        pairs= pairs + 1;
                        pair2= card(i).value;
                        pair2ind1=i;
                        pair2ind2=j;
                        rank=2;
                        if pair1 == pair2% poker
                            rank=7;
                            return
                        end
                    else % drill
                        rank = 3;
                        drill = card(i).value;
                    end
                else % harmadik par
                    if isValid3(pair1ind1,pair1ind2,pair2ind1,pair2ind2,i,j)
                        
                        if(pair2 == card(i).value || pair1 == card(i).value) % poker
                            pair1= card(i).value;
                            pair2= card(i).value;
                            rank=7;
                            return
                        end
                        pairs= pairs + 1;
                        %ha tenyleg harom par van es a phase 7 akkor
                        %megkell vizsgalni az UTOLSO lapot hogy nem
                        %egyenlo e vmelyikkel  1+2+3...7 = 28
                        if length(middle) ==5
                            lastCard = 28 - pair2ind1 - pair2ind2 - pair1ind1 - pair1ind2 -card(i).value - card(j).value;
                            lastCard=card(lastCard);
                            if(isValid(lastCard,pair1, pair2,card(i).value) == 0 )
                                drill = lastCard;
                                rank=6;
                            end
                            
                        end
                        if pair2 < card(i).value
                            pair2=card(i).value;
                            pair2ind1=i;
                            pair2ind2=j;
                        else
                            if pair1 < card(i).value
                                pair1 = card(i).value;
                            end
                        end
                    else
                        if drill< card(i).value
                            drill = card(i).value;
                        end
                    end
                    
                end
            end
        end
    end
end
if pairs>1 && pair2 ~= 0
    if drill>0
        rank=6;
        if pair1==drill 
            pair1=pair2;
            pair2=0;
        end
        if pair2==drill
            pair2=0;
        end
    end
end
 %% ---------------------------------------
tablepairs = 0;
tablerank=0;
tablepair1=0;
tablepair2=0;
tabledrill=0;
for i =1:length(card)
    for j =1+i:length(card)
        % kis segitseg a megerteshez
        % egyszerusites card(round(i).value to a var
        if card(i).value - card(j).value == 0
            if tablepair1 ==0 % elso par
                tablerank = 1;
                tablepairs= tablepairs + 1;
                tablepair1 = card(i).value;
                tablepair1ind1=i;
                tablepair1ind2=j;
            else
                if tablepair2 ==0 % masodik par
                    if (isValid(tablepair1ind1,tablepair1ind2,i,j) == 1)
                        tablepairs= tablepairs + 1;
                        tablepair2= card(i).value;
                        tablepair2ind1=i;
                        tablepair2ind2=j;
                        tablerank=2;
                        if tablepair1 == tablepair2% poker
                            tablerank=7;
                            return
                        end
                    else % tabledrill
                        tablerank = 3;
                        tabledrill = card(i).value;
                    end
                else % harmadik par
                    if isValid3(tablepair1ind1,tablepair1ind2,tablepair2ind1,tablepair2ind2,i,j)
                        
                        if(tablepair2 == card(i).value || tablepair1 == card(i).value) % poker
                            tablepair1= card(i).value;
                            tablepair2= card(i).value;
                            tablerank=7;
                            return
                        end
                        tablepairs= tablepairs + 1;
                        %ha tenyleg harom par van es a phase 7 akkor
                        %megkell vizsgalni az UTOLSO lapot hogy nem
                        %egyenlo e vmelyikkel  1+2+3...7 = 28
                        if length(middle) ==5
                            lastCard = 28 - tablepair2ind1 - tablepair2ind2 - tablepair1ind1 - tablepair1ind2 -card(i).value - card(j).value;
                            lastCard=card(lastCard);
                            if(isValid(lastCard,tablepair1, tablepair2,card(i).value) == 0 )
                                tabledrill = lastCard;
                                tablerank=6;
                            end
                            
                        end
                        if tablepair2 < card(i).value
                            tablepair2=card(i).value;
                            tablepair2ind1=i;
                            tablepair2ind2=j;
                        else
                            if tablepair1 < card(i).value
                                tablepair1 = card(i).value;
                            end
                        end
                    else
                        if tabledrill< card(i).value
                            tabledrill = card(i).value;
                        end
                    end
                    
                end
            end
        end
    end
end
 %% ---------------------------------------
function isV = isValid(n1,n2,n3,n4)
if(n1==n3 || n1 == n4 || n2 == n3 || n2 == n4 || n1 == n2 || n3 == n4)
    isV=0;
else
    isV=1;
end
end
function isV = isValid3(n1,n2,n3,n4,n5,n6)
% biztosan tudjuk h n1 != n2 , n3!=n4 n5!=n6 a helyes index miatt
if(n1==n3 || n1 == n4 || n2 == n3 || n2 == n4)
    isV=0;
    return
end
if(n5==n3 || n5 == n4 || n6 == n3 || n6 == n4)
    isV=0;
else
    isV=1;
end

end