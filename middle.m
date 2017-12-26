classdef middle
    
    properties
        flop
        turn
        river
        empty = true;
    end
    
    methods
        
        function a = createMiddle(obj,card)
            if size(card,2) > 2
                obj.flop = [card(3),card(4),card(5)];
                obj.empty = false;
                a = obj;
            
                if size(card,2) > 5
                    obj.turn = card(6);
                    a = obj;
                
                    if size(card,2) > 6
                        obj.river = card(7);
                        a = obj;
                    end
                end
            else
                obj.flop=[];
                obj.turn=[];
                obj.river=[];
                a = obj;
            end
            
        end 
        function a = getCard(obj,index)
            switch(index)
                case 1
                    a=obj.flop(index);
                case 2
                    a=obj.flop(index);
                case 3
                    a=obj.flop(index);
                case 4
                    a=obj.turn;
                case 5
                    a=obj.river;
                otherwise
                    warning("fasztcsinalsz nincs ilyen kartya");
            end
        end
       
    end
    
end

