classdef button    
    
    properties
        name =[];
        value =[];
        
        
    end
    
    
    methods
        function a = setButton(obj,btndata)
            if isempty(btndata.name)
                a = obj;   
                return;
            end
            obj.name = char(btndata.name);
            obj.value = btndata.value;            
            a = obj;
        end
        
    end
    
end

