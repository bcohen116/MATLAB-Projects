close all; clear;
V = sym('(30/Tf^5)*t^4-(60/Tf^4)*t^3+(30/Tf^3)*t^2');
der1 = diff(V,'t');
CriticalPoints = solve(der1==0,'t')
%CriticalPoints = subs(CriticalPoints);
%CriticalPoints = double(CriticalPoints)
der2 = diff(der1,'t');
test = subs(der2,'t',CriticalPoints)
Tf = 6;
test = subs(test);
der2_test = double(test)

%%
close all; clear;
circle_top = sym('x^2+y^2=25');
circle_bot = sym('x^2+(y-12)^2 = 100');
circle_top = solve(circle_top,'y');
circle_bot = solve(circle_bot,'y');
Area = double(int(circle_top - circle_bot,'x',2,5))
Area = Area(1) + Area(2)

%%
close all; clear;
y = sym('x^4 - 10.5*x^3 + 37*x^2 - 52.5*x + 35');
der = diff(y,'x');
distance = double(int(sqrt(1+der^2),'x',0,5))

%%
close all; clear;

yt = sym('(1/2)*x^2');
yb = sym('-(5/4)*(x-2)^2 - 1');
%Area = int(yt-yb,'x',-1,0);
%Area = double(Area);
Area = 48;
syms x; 
x_bar = 1/Area*int(x*(yt - yb),'x',-1,0);
x_bar = double(x_bar)
y_bar = 1/(2*Area)*int(yt^2-yb^2,'x',-1,0);
y_bar = double(y_bar)







