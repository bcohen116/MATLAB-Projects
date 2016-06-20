%Lab 5 part C, Ben Cohen, Section 8, 3-10-16.
clear; close all; clc;
load Submarine_Hatch

plot(x_left,y_hatch,x_right,y_hatch);
axis([-1 1 -2 0]);
xlabel('X coordinates (m)');
ylabel('Y coordinates (m)');
title('Hatch');

y = input('Enter curent depth (m): ');
Po = 101353;
g = 9.81;
p = 1027;
for k = 1:length(x_left) - 1
    P1 = x_left(k);
    P2 = x_left(k+1);
    P3 = x_right(k);
    P4 = x_right(k+1);
    x1 = P4-P2;
    x2 = P3-P1;
    dy = y_hatch(k);
    outside(k) = -(Po + p*g*y) * (x1+x2)/2*dy;
    inside(k) = -(Po) * (x1+x2)/2*dy;
end
outsideT = 0;
insideT = 0;
for k = 1:length(outside)
   outsideT = outsideT + outside(k); 
   insideT = insideT + inside(k);
end
netF = abs(outsideT - insideT);
if netF > 5000000 
    safe = 'false';
else
    safe = 'true';
end
fprintf('outside F: %f \n inside F: %f \n net F: %f \n safe? %s \n',outsideT,insideT,netF,safe)      

%% part D
close all; clear; clc;

load Airplane_Hatch

clear; close all; clc;
load Submarine_Hatch

plot(x_left,y_hatch,x_right,y_hatch);
axis([-1 1 -2 0]);
xlabel('X coordinates (m)');
ylabel('Y coordinates (m)');
title('Plane');

h = input('Enter curent altitude (m): ');
Po = 101353;
g = 9.81;
p = 1027;
pressure = (Po*(1-2.25577*10^(-5)*h)^5.25588);
for k = 1:length(x_left) - 1
    P1 = x_left(k);
    P2 = x_left(k+1);
    P3 = x_right(k);
    P4 = x_right(k+1);
    x1 = P4-P2;
    x2 = P3-P1;
    dy = y_hatch(k);
    outside(k) = -(Po*(1-2.25577*10^(-5)*h)^5.25588) * (x1+x2)/2*dy;
    inside(k) = -(Po) * (x1+x2)/2*dy;
end
outsideT = 0;
insideT = 0;
for k = 1:length(outside)
   outsideT = outsideT + outside(k); 
   insideT = insideT + inside(k);
end
netF = abs(outsideT - insideT);
if netF > 350000  
    safe = 'false';
else
    safe = 'true';
end
fprintf('pressure: %f \n outside F: %f \n inside F: %f \n net F: %f \n safe? %s \n',pressure,outsideT,insideT,netF,safe)      




