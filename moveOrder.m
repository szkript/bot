classdef moveOrder
    
    methods(Static)
        
        
        function a = PreFlop(preflop,hand,maxtier)
            for i = 1:169
                %                 if hand.card1.color == hand.card2.color
                if hand.card1.value == preflop(i).mc1 && hand.card2.value == preflop(i).mc2
                    
                    if  preflop(i,1).suittier <= maxtier
                        obj = 'check/call';
                    else
                        obj = 'fold/check';
                    end
                    a = obj;
                    return;
                end
                %
                %                 end
                if hand.card1.value == preflop(i).mc1 && hand.card2.value == preflop(i).mc2
                    
                    if  preflop(i,1).tier <= maxtier
                        obj = 'check/call';
                    else
                        obj = 'fold/check';
                    end
                    a = obj;
                    return;
                end
            end
        end
        
        % zalánéé
        
        function or = NextMove( currentCall, mymoney, pot, chances)
            jackpotOdds = pot + CurrentCall/ currentCall;
            if CurrentCall == 0 %
                if( chances > 0.67)
                    or='Raise';
                else
                    or='Check';
                end
            else
                
                if  0.85 > chance && chance > 0.69
                    or='Raise';
                    return;
                end
                if chance < 0.85
                    or='Call';
                    return;
                end
                if jackpotOdds >  (1/chance) * 1.1
                    or='Call';
                    return;
                end
                or='Fold';
            end
        end
    end
end

