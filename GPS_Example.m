%**************************************************************************
% Clear out memory and close figures
%**************************************************************************
close all;
clear;
figure('WindowStyle','docked');
%**************************************************************************
% generate original data
%**************************************************************************
% create time segments at 1 minute increments
t1 = 0:1/60:2;                  % hours 0-2
t2 = 2+(1/60):1/60:3;           % hours 2-3
t3 = 3+(1/60):1/60:5;           % hours 3-5
t4 = 5+(1/60):1/60:6;           % hours 5-6
t = [t1 t2 t3 t4];              % full time vector
% create position vectors
for k = 1:length(t)
    if k == 1
        x(k) = 0;                                       % start at 0
    elseif k <= 120
        x(k) = (55+randi([-5 5],1))*(1/60) + x(k-1);    % travel at 55 mph
    elseif k <= 180
        x(k) = 0 + x(k-1);                              % stop for lunch
    elseif k <= 300
        x(k) = (45+randi([-5 0],1))*(1/60) + x(k-1);    % travel at 45 mph
    else
        x(k) = (75+randi([0 5],1))*(1/60) + x(k-1);     % travel at 75 mph
    end 
end
% plot original data
subplot(2,2,1); plot(t,x);
xlabel('Time (hours)');
ylabel('Distance (miles)');
title('Road Trip Data: Actual Distance vs. Time');
axis([0 6 0 300]);

%**************************************************************************
% generate GPS data
%**************************************************************************
% get setting for GPS
step = input('How many minutes between GPS measurements? ');
% pull out data from time and x vectors
t_GPS = t(1:step:length(t));
x_GPS = x(1:step:length(x));
% plot GPS data
subplot(2,2,2); plot(t_GPS,x_GPS,'r*');
xlabel('Time (hours)');
ylabel('Distance (miles)');
title('GPS Data: Distance vs. Time');
axis([0 6 0 300]);

%**************************************************************************
% Speed Calculations using 2-pt. derivative
%**************************************************************************
% derivative of original data
for k = 1:length(t)-1
    speed(k) = (x(k+1)-x(k))/(1/60);
end
speed(length(t)) = speed(length(t)-1);
% derivative of GPS data
for k = 1:length(t_GPS) - 1
    speed_GPS(k) = (x_GPS(k+1)-x_GPS(k))/((1/60)*step);
end
speed_GPS(length(t_GPS)) = speed_GPS(length(t_GPS)-1);
% plot speed based on original data
subplot(2,2,3); plot(t,speed);
xlabel('Time (hours)');
ylabel('Speed (miles/hour)');
title('Road Trip Data: Actual Speed vs. Time');
axis([0 6 0 90]);
% plot speed based on GPS data
subplot(2,2,4); plot(t_GPS,speed_GPS);
xlabel('Time (hours)');
ylabel('Speed (miles/hour)');
title('Estimate from GPS Data: Speed vs. Time');
axis([0 6 0 90]);