xmin=0.8;
xmax=1.5;
numberOfRandoms=1;
pauser=xmin+rand(1,numberOfRandoms)*(xmax-xmin);
pause(pauser);

clearvars xmin xmax numberOfRandoms pauser;