clear; close all; clc;
t = 0:0.75:9.75;
for x = 1:length(t)
    posBase(x) = 30-9.684*10^(-4)*t(x)^5 + 0.02421 * t(x)^4 - 0.1614*t(x)^3;
    posJoint(x) = 20 + 6.1002*10^(-3)*t(x)^5 - 0.152505*t(x)^4 + 1.0167*t(x)^3;

    velBase(x) = -5*9.864*10^(-4)*t(x)^4 + 4*0.02421*t(x)^3 - 3*0.1614*t(x)^2;
    velJoint(x) = 5 + 6.1002*10^(-3)*t(x)^4 - 4*0.152505*t(x)^3 + 3*1.0167*t(x)^2;
    
    accelBase(x) = -20*9.864*10^(-4)*t(x)^3 + 12*0.02421*t(x)^2 - 6*0.1614*t(x);
    accelJoint(x) = 20 * 6.1002*10^(-3)*t(x)^3 - 12*0.152505*t(x)^2 + 6*1.0167*t(x);
end
vel_estBase(1) = 0;
vel_estJoint(1) = 0;
for x = 2:length(t) - 1
    accel_estBase(x) = (accelBase(x+1) - 2*accelBase(x) + accelBase (x - 1))/0.75^2;
    accel_estJoint(x) = (accelJoint(x+1) - 2*accelJoint(x) + accelJoint(x - 1))/0.75^2;
end
for x = 1:length(t)-1
    t_accel(x) = t(x);
end
for x = 1:length(t_accel)
    errorBase(x) = abs(accel_estBase(x) - accelBase(x));
    errorJoint(x) = abs(accel_estJoint(x) - accelJoint(x));
end

subplot(3,1,1);
plot(t_accel,accel_estBase,'bo',t,accelBase,'r*');
xlabel('Time (sec)');
ylabel('Acceleration (m/s^2)');
title('Base Acceleration');
legend('Estimate (base)','Actual');

subplot(3,1,2);
plot(t_accel,accel_estJoint,'bo',t,accelJoint,'r*');
xlabel('Time (sec)');
ylabel('Acceleration (m/s^2)');
title('Joint Acceleration');
legend('Estimate (joint)','Actual');

subplot(3,1,3);
plot(t_accel,errorBase,'b*',t_accel,errorJoint,'ko');
xlabel('Time (sec)');
ylabel('Acceleration (m/s)');
title('Error');
legend('Error (base)','Error (joint)');

maxErrorBase = max(errorBase);
maxErrorJoint = max(errorJoint);
fprintf('Max Base error: %f \n',maxErrorBase);
fprintf('Max Joint error: %f \n',maxErrorJoint);


%% Part 4
clear;close all; clc;
load HW4
for x = 1:length(t)
    posJoint(x) = 20 + 6.1002*10^(-3)*t(x)^5 - 0.152505*t(x)^4 + 1.0167*t(x)^3;
    
    velJoint(x) = 5 + 6.1002*10^(-3)*t(x)^4 - 4*0.152505*t(x)^3 + 3*1.0167*t(x)^2;
    
    accelJoint(x) = 20 * 6.1002*10^(-3)*t(x)^3 - 12*0.152505*t(x)^2 + 6*1.0167*t(x);
end
vel_estJoint(1) = 0;
for x = 2:length(t)
    vel_estJoint(x) = (posJoint(x) - posJoint(x - 1))/0.75;
end
for x = 1:length(t)
    errorJoint(x) = abs(vel_estJoint(x) - velJoint(x));
end
for x = 1:length(t)-1
    t_accel(x) = t(x);
end
for x = 2:length(t) - 1
    accel_estJoint(x) = (accelJoint(x+1) - 2*accelJoint(x) + accelJoint(x - 1))/0.75^2;
end

plot(t,posJoint,'bo',t,Th2_n,'k*');
xlabel('Time (sec)');
ylabel('Position (deg)');
title('Noisy position estimates');
legend('Noisy','Actual');

figure;
plot(t,vel_estJoint,'bo',t,velJoint,'k*');
xlabel('Time (sec)');
ylabel('Velocity (m/s)');
title('Noisy velocity estimates');
legend('Noisy','Actual');

figure;
plot(t_accel,accel_estJoint,'bo',t,accelJoint,'k*');
xlabel('Time (sec)');
ylabel('Acceleration (m/s^2)');
title('Noisy acceleration estimates');
legend('Noisy','Actual');


%% part 3
clear; close all; clc;
t = 0:0.75:9.75;

for x = 1:length(t)
    posJoint(x) = 20 + 6.1002*10^(-3)*t(x)^5 - 0.152505*t(x)^4 + 1.0167*t(x)^3;
 
    velJoint(x) = 5 + 6.1002*10^(-3)*t(x)^4 - 4*0.152505*t(x)^3 + 3*1.0167*t(x)^2;
end
vel_estJoint(1) = 0;
for x = 2:length(t)
    vel_estJoint(x) = (posJoint(x) - posJoint(x - 1))/0.01;
end
for x = 1:length(t)
    errorJoint(x) = abs(vel_estJoint(x) - velJoint(x));
end

display(max(errorJoint));


