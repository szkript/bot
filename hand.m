classdef hand
    
    
    properties
        card1
        card2
        empty = true;
    end
    
    methods
        function a = createHand(obj,cards)
            if ~isempty(cards(1)) || ~ismepty(cards(2))
                obj.card1 = cards(1,1);
                obj.card2 = cards(1,2);
                obj.empty = false;
                a = obj;
            end
        end
      
        
    end
    
end