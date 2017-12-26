
classdef phase
    properties
        current
        card % new card revealed in phase, if phase 0 then 0
        pot
        playersAlive=1
        myMoney
        rank
        power
        chances
        moves=0
    end
    methods
        function obj = AddMoves(phs,move)
            if(phs.moves==0)
                phs.moves{1}=move;
            else
                phs.moves{size(phs.moves)+1}=move;
            end
            obj=phs;
        end
        function obj = setPhase(phs,current,pot,myMoney,rank,power)
            phs.current=current;
            phs.pot=pot;
            phs.myMoney=myMoney;
            phs.rank=rank;
            phs.power=power;
            obj=phs;
        end
        function a = getMove(obj)
            a=obj.moves{length(obj.moves)};
        end
    end
end
