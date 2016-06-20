%% part 3
clear;
clc;
load HW7
z = zeros(1,length(x));
greater = 0;
less = 0
Location(1) = 0;
for k = 1:length(x)
    if x(k) > y(k)
        z(k) = x(k);
        greater = greater + 1;
    elseif y(k) > x(k)
        z(k) = y(k);
        less = less + 1;
    else
        z(k) = y(k);
        if k == 1
            Location(1) = k;
        else
            Location(end + 1) = k;
        end
    end
end
if Location(1) == 0
    Location(1) = '';
end
fprintf('z = \n');
disp(z);
fprintf('X was larger %i times \nY was larger %i times \nLocation = ',greater,less);
disp(Location);
        
    
%% problem 4
time = xlsread('Height','B1:GJ1');
height = xlsread('Height','B2:GJ8');
disp(height(:,1:6));
plot(time,height);
legend('Angle 25','Angle 35','Angle 45','Angle 55','Angle 65');
xlabel('time (sec)');
ylabel('height (m)');
title('Height vs time');
