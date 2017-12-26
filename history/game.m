classdef game
    properties
        time
        id
        rounds
        roundSum=0
        players
        playerSum
        startMoney
    end
    methods
        function obj = AddRound(gm,round)
            gm.roundSum = gm.roundSum +1;
            gm.rounds{gm.roundSum}=round;
            obj=gm;
        end
        function s = CountPhases(gm)
            i=1;
            s=0;
            while(i<=gm.roundSum)
                s=s+gm.rounds{i}.phaseSum;
                i=i+1;
            end
        end
        function a = getCurrentRound(obj)
            a=obj.rounds{obj.roundSum};
        end
    end
end