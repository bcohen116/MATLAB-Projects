close all; clear; clc;
yCircleT = sym('-sqrt(16-x^2)');
yCircleB = sym('sqrt(16-x^2)');

yEllipseT = sym('-2*x/3');
yEllipseB = sym('2*x/3');

Area = double(int(yCircleT - yCircleB,'x',0,4));
+ double(int(yEllipseT - yEllipseB,'x',4,10));


syms x;
xCent = (1/Area)*(double(int(x*(yCircleT - yCircleB),'x',0,4))) + (double(int(x*(yEllipseT - yEllipseB),'x',4,10)));

yCent = (1/(2*Area))*(double(int(x*(yCircleT^2 - yCircleB^2),'x',0,4))) + (double(int(x*(yEllipseT^2 - yEllipseB^2),'x',4,10)));



%part 2
yparabola = sym('(1/32) * (x-2)^2 + 12');

yline = sym('(7/5)*(x-10) + 14');

Area = double(int(yparabola - yline,'x',2,10));


syms x;
xCent = (1/Area)*(double(int(x*(yparabola - yline),'x',2,10)))

yCent = (1/(2*Area))*(double(int(x*(yparabola^2 - yline^2),'x',2,10))) 