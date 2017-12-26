classdef card
    
    properties
        value
        color
        index
        empty=true
    end
    
    methods
        
        function a= setCard(obj,value,color,index)            
            obj.empty=false;
            if isnan(value)
                
                a = [];
                return;
            end
            obj.empty=false;
            obj.value=value;
            obj.color=color;
            obj.index=index;
            a=obj;
        end
        
        
    end
    
end

