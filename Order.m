classdef Order
    enumeration
        Fold , Check , Raise, Bet, Call
    end
    methods(static)
        
        function or = NextMove(obj, currentCall, mymoney, pot, chances, players)
                bb=currentCall/mymoney;
                if bb<25
                    %AggresiveMove()
                else if 
        end
    end
end