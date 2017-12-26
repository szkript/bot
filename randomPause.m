function u = randomPause(min,max)
min=0.8;
max=1.5;
numberOfRandoms=1;
pauser=min+rand(1,numberOfRandoms)*(max-min);
pause(pauser);
end