clear; close all; clc;
time = 0:0.5:10;
position = [4;0.7;0.1;1.7;4;7;10;12;13.6;14.1;13.6;12;10;7;4;1.7;0.1;1;4;11;16];
estimateTimes = [6.1;6.2;6.3;6.4];
linear = interp1(time,position,estimateTimes,'linear');
%% part 2
clear; close all; clc;
load HW3P2
plot(t,V,'*')
xlabel('Time (sec)');
ylabel('Volts (volts)');
title('Voltage change over time');

newT = 0:0.005:0.8;
nearest = interp1(t,V,newT,'nearest');
plot(t,V,'r*',newT,nearest,'bo')
xlabel('Time (sec)');
ylabel('Volts (volts)');
title('Voltage change over time');
legend('Original','Estimates');

linear = interp1(t,V,newT,'linear');
plot(t,V,'r*',newT,linear,'bo')
xlabel('Time (sec)');
ylabel('Volts (volts)');
title('Voltage change over time');
legend('Original','Estimates');

spline = interp1(t,V,newT,'spline');
plot(t,V,'r*',newT,spline,'bo')
xlabel('Time (sec)');
ylabel('Volts (volts)');
title('Voltage change over time');
legend('Original','Estimates');

%% part 4
clear; close all; clc;
load HW3P4
plot(t,pos,'*');
xlabel('Time (sec)');
ylabel('Position (m)');
title('Change in position');
vel2(1) = 0;
for x = 2:length(t)
    vel2(x) = (pos(x) - pos(x-1))/0.1
end

plot(t,vel2,'r*',t_act,v_act,'bo');
xlabel('Time (sec)');
ylabel('Velocity (m/s)');
title('Change in position');
legend('Estimates','Actual');


