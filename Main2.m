clear;
lastTime=0;
while(true)
    time=datetime;
    if second(time)- lastTime > 0.2
        clearex('time');
        screenshot;
        lastTime=second(time);
    end
end


