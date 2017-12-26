classdef player
    properties
        id
        seat
        money
        moneyInPot
        moves % 'g1 r1 p1 turn raise 500 r1 p1 raise 500
        currentGame       
    end
    methods
        
        function a = getId(obj)
            
                        
            a = obj;
        end     
        
        function c = setPlayer(obj,id,money,moneyInPot)
            obj.id = char(id);
            obj.money = money;
            obj.moneyInPot = moneyInPot;           
           
            
            c = obj;
        end
%         function a = getLastTurn(obj){
%                 
%             }
%         function a = Move(obj, game, round,phase, order, betamount)
%             a=obj;
%             a.moves = 
        
        
        
        
        
    end
end


