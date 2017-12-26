function a = validateButton(btn)
numOfButtons =0;
b(1) = true;
b(2) = true;
b(3) = true;
if isempty(btn(1).name)
    b(1) = false;
end
if isempty(btn(2).name)
    b(2) = false;
end
if isempty(btn(3).name)
    b(3) = false;   
    
end

    
for i = 1:3
    if b(i)
        numOfButtons=numOfButtons+1;
    end
end

a = numOfButtons;

end

