clear; close all;
%% 1A
equation = sym('-(1/2)*g*t^2 + Vi*sin(Theta)*t');
time = solve(equation, 't')

%% 1B
equation = sym('y = -(1/2)*g*t^2 + Vi*sin(Theta)*t + yi');
time = solve(equation, 't')
%% 2A
clear; close all; clc;
yPos = sym('y = (-1/2) * g * t^2 + V*sin(Theta)*t + yi');
xPos = ('x = V*cos(Theta)*t + xi');
g = 9.81; x = 1200; y = 1600; t = 10; yi = 0; xi = 0;
yPos = subs(yPos);
xPos = subs(xPos);
result = solve(yPos, xPos, 'V', 'Theta');
V = double(result.V);

Theta = double(result.Theta * (180/pi));
%2B
t = 0:0.1:10;
for k = 1:length(t)
yy(k) = (-1/2) * g * t(k)^2 + V(1)*sind(Theta(1))*t(k) + yi;
xx(k) = V(1)*cosd(Theta(1))*t(k) + xi;
end

plot(xx,yy,'b',x,y,'ro')
% % plot([x xPos],[y yPos],'-ko',x,y,'ro','LineWidth',4)
 xlabel('x (m)');
 ylabel('y (m)');
 legend('y vs x','target')
%% 2C
figure  % Opens new figure window
for k = 1:length(x)
plot(xPos(k),yPos(k),'ko',1200,1600,'r*');  
axis([0 1250 0 2000])
pause(0.01);  % 0.01 was the increment in my time vector 
end
title('Projectile Path')
ylabel('Projectile Height (m)');
xlabel('Projectile Range (m)');
%% 3
clear; close all;
f1 = sym('xg = L1*cos(Th1) + L2*cos(Th1+Th2)')
f2 = sym('yg = L1*sin(Th1) + L2*sin(Th1+Th2)')

L1 = 5; L2 = 4; xg = 2; yg = 4;
f1 = subs(f1)
f2 = subs(f2)

result = solve(f1,f2,'Th1','Th2')
Th1 = result.Th1
Th2 = result.Th2

Th1 = double(result.Th1)*180/pi
Th2 = double(result.Th2)*180/pi

xj = L1*cosd(Th1(1))
yj = L1*sind(Th1(1))
xg = L1*cosd(Th1(1))+L2*cosd(Th1(1)+Th2(1))
yg = L1*sind(Th1(1))+L2*sind(Th1(1)+Th2(1))

plot([0 xj],[0 yj],'k-o',[xj xg],[yj yg],'ko-','LineWidth',4) 
xlabel('x (m)');
ylabel('y (m)');
title('Robotic Arm');
% 4e
t = 0:0.1:10;
for k = 1:length(t) 
    Th1(k) = 30 -0.0003684*t(k)^5 + 0.0092*t(k)^4 - 0.0614*t(k)^3;
    Th2(k) = 20 + 0.0061*t(k)^5 - 0.1525*t(k)^4 + 1.0167*t(k)^3;
    xj = L1*cosd(Th1(k));
    yj = L1*sind(Th1(k));
    xg = L1*cosd(Th1(k))+L2*cosd(Th1(k)+Th2(k))
    yg = L1*sind(Th1(k))+L2*sind(Th1(k)+Th2(k))
    plot([0 xj],[0 yj],'k-o',[xj xg],[yj yg],'ko-','LineWidth',4) 
    xlabel('x (m)');
    ylabel('y (m)');
    title('Robotic Arm');
    pause(0.01);
end

%% 4
clear; close all; clc;
Thfinal = sym('Thfinal = Thstart + a1*Tf^5 + a2*Tf^4 + a3*Tf^3');
Velfinal = sym('0 = 5*a1*Tf^4+4*a2*Tf^3+3*a3*Tf^2');
Accfinal = sym('0 = 20*a1*Tf^3 + 12*a2*Tf^2+6*a3*Tf');
Tht = sym('Tht = Thstart + a1*Tf^5+a2*Tf^4+a3*Tf^3');
Tht2 = sym('Tht = Thstart + a1*Tf^5+a2*Tf^4+a3*Tf^3');

result = solve(Thfinal,Velfinal,Accfinal,'a1','a2','a3');
a1 = result.a1;
a2 = result.a2;
a3 = result.a3;

%part b
Tf = 10;
Thstart = 30;
Thfinal = 13.86;
a1 = subs(a1);
a2 = subs(a2);
a3 = subs(a3);
Tht = solve(Tht,'Tht');
Tht = subs(Tht)

%part c
a1 = result.a1;
a2 = result.a2;
a3 = result.a3;
Tf = 10;
Thstart = 20;
Thfinal = 13.86;
a1 = subs(a1)
a2 = subs(a2)
a3 = subs(a3)
Tht2 = solve(Tht2,'Tht');
Tht2 = subs(Tht2);

%part d
t = 0:0.1:10;
for k = 1:length(t) 
    Tht(k) = 30 -0.0003684*t(k)^5 + 0.0092*t(k)^4 - 0.0614*t(k)^3;
    Tht2(k) = 20 + 0.0061*t(k)^5 - 0.1525*t(k)^4 + 1.0167*t(k)^3;
end
subplot(2,1,1)
plot(t,Tht,'b');
xlabel('time (s)');
ylabel('angles (degrees)');
title('Robotic arm angles over time T1');
subplot(2,1,2)
plot(t,Tht2,'b');
xlabel('time (s)');
ylabel('angles (degrees)');
title('Robotic arm angles over time T2');

