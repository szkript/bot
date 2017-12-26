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