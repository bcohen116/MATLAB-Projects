%Ben Cohen, Lab 2, section 8 Part B
clear; close all; clc;
load GPS_Data2;
dist(1) = 0; pos(1) = 0;
Dt = ((hour(2)/3600) + (minute(2)/60) + second(2))-((hour(1)/3600) + (minute(1)/60) + second(1));
t = 0:Dt:(length(latitude)*Dt)-Dt;
t2 = 0:Dt:(length(latitude)*Dt)-Dt*2;
for x = 2:length(latitude)
    dist(x) = 222240*asind(sqrt((sind((latitude(x)-latitude(x-1))/2))^2+cosd(latitude(x-1))*cosd(latitude(x))*(sind((longitude(x)-longitude(x-1))/2))^2));
    pos(x) = sum(dist);
    vel2(x) = (pos(x) - pos(x-1))/Dt;
end
for x = 2:length(latitude)-1
    vel3(x) = (pos(x+1) - pos(x-1))/(2*Dt);
    accel(x) = (pos(x+1) - 2*pos(x) + pos(x-1))/(Dt^2);
end
for x = 1:length(latitude)
    absError2(x) = abs((vel2(x) - actual_velocity(x)))/actual_velocity(x);
    if x < length(latitude)
        absError3(x) = abs((vel3(x) - actual_velocity(x)))/actual_velocity(x);
        absErrorA(x) = abs((accel(x) - actual_acceleration(x)))/actual_acceleration(x);
    end
end
%fprintf('dist: '); disp(dist)
%fprintf('pos:'); disp(pos)
%fprintf('vel2: '); disp(vel2)

figure;
subplot(2,1,1);
plot(t,vel2,'*r',t,actual_velocity);
xlabel('time (s)');
ylabel('Velocity (m/s)');
title('Estimated Velocity 2')
legend('Estimated','Actual');
subplot(2,1,2);
plot(t,absError2,'*r');
xlabel('time (s)');
ylabel('Velocity (m/s)');
title('Error')

figure;
subplot(2,1,1);
plot(t2,vel3,'*r',t,actual_velocity);
xlabel('time (s)');
ylabel('Velocity (m/s)');
title('Estimated Velocity 3')
legend('Estimated','Actual');
subplot(2,1,2);
plot(t2,absError3,'*r');
xlabel('time (s)');
ylabel('Velocity (m/s)');
title('Error')

figure;
subplot(2,1,1);
plot(t2,accel,'*r',t2,actual_acceleration);
xlabel('time (s)');
ylabel('Accel (m/s^2)');
title('Estimated Acceleration')
legend('Estimated','Actual');
subplot(2,1,2);
plot(t2,absErrorA,'*r');
xlabel('time (s)');
ylabel('Accel (m/s^2)');
title('Error')
