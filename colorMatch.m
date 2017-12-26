function colormatch = colorMatch(red,green,blue,rMIn,rMax,gMin,gMax,bMin,bMax)

if red >= rMIn && red <= rMax
    redMatch = true;
else
    redMatch = false;
end
if green >= gMin && green <= gMax
    greenMatch = true;
else
    greenMatch = false;
end
if blue >= bMin && blue <= bMax
    blueMatch = true;
else
    blueMatch = false;
end

if redMatch && greenMatch && blueMatch
    colormatch = true;
else
    colormatch = false;
end



end


