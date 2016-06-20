%% sym
f1 = sym('(R1+R2)*I1-R2*I2 = 12');
f2 = sym('-R2*I1 + (R2+R3)*I2 = 0');
result = solve(f1,f2,'I1','I2')
I1 = result.I1
I2 = result.I2
pretty(I1)

%% robot arm
f1 = sym('xg = L1*cos(Th1) + L2*cos(Th1+Th2)')
f2 = sym('yg = L1*sin(Th1) + L2*sin(Th1+Th2)')

L1 = 3; L2 = 2; xg = 2.4; yg = 3.2;
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

