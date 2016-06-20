sym('x^2 + 3*x + 2'); %creates the symbolic expression ?^2+3?+2
syms x; x^2 + 3*x + 2; %creates the symbolic variable x and uses it to create an expression
x_num = double(x_sym);

%lim(?t??0) ?(f(t+?t)?f(t))/?t? definition of derivative
%(f(t+?t)?f(t))/?t 2 point approx
%(f(t+?t)?f(t-?t))/2?t? 3 point approx
y = sym('x^2 + 3*x + 2');
y_der = diff(y,'x');

%lim(?t??0) ?(f'(t+?t)?f'(t))/?t?definition of second derivative
%?(f(t+?t)?2f(t) + f(t-?t))/?t^2? approx second deriv

%If second derivative < 0 ? local max
%If second derivative > 0 ? local min
%If second derivative = 0 ? possible point of inflection

y = sym('x^7 - 14*x^6 + 79*x^5 - 230*x^4 + 364*x^3 - 296*x^2 + 96*x + 30');
der1 = diff(y,'x');
der2 = diff(der1,'x');
CriticalPoints = double(solve(der1 == 0,'x'))
CriticalPoints =
    2.0000
    2.0000
    3.7321
    0.2679
    2.7559
    1.2441
results = subs(der2,'x',crit_points)
results = 
    0
    0
    176.6692
   -176.6692
   -14.6866
    14.6866    
min = 3.7321, 1.2441
max =  0.2679, 2.7559



integrals =  sum from 0 to n-1 of f(t_0)*?t + f(t_1)*?t + f(t_n-1)*?t
trapezoid rule = sum from 0 to n-1 of ((1/2)(f(t_0)+f(t_1) + f(t_2) + (1/2)f(t_n-1)))*?t
simpsons rule = ?t/3(f(t_0) + 4f(t_1) + 2f(t_2)+4f(t3)+2f(t_4)+... 4f(t_n-1)+f(t_n))
    
%Simpson’s rule will provide the most accurate approximation
%Trapezoidal rule will be less accurate than Simpson’s rule
%Riemann’s sums will be the least accurate

 area of curves = int(a to b)(y_top - y_bot)dx
 length of curve = int(x0 to x1) sqrt(1+y'^2)dx = int(y0 to y1) sqrt(1+x'^2)dy
 
% How do you compute the x and y centroids of an object?
% Option 1:
% Apply a coordinate system
% Determine the Equations, Moments, Areas for individual sections
% Find centroids using
% Option 2:
% Determine Equations
% Find centroids using

x = sum(M_y)/sum(area)
y = sum(M_x)/sum(area)

x = 1/A int(x1 to x2) x(y_top - y_bot)dx
y = 1/2A int(x1 to x2) (y_top^2 - y_bot^2)dx


parabola = (x-x) = k(y-y)^2
k = (y-y)/(x-x)^2

given the center
(x-x)^2+(y-y)^2 = r^2


y1 = sym('-(2/9)*x^2');
y2 = sym('-(2/9)*x^2');
x5 = sym('2-(2/25)*y^2');
y7t = sym('(-7/9.5^2)*x^2+7');
y7b = sym('(-7/9.5^2)*x^2+5');
x9 = sym('(-12/7*2)*y^2');
Area1 = double(int(y1+2,'x',-3,0));
Area2 = double(int(y2+2,'x',0,3));
Area3 = 2*25;
Area4 = 5*5;
Area5 = double(int(x5,'y',-5,0));
Area6 = 2*20;
Area7 = double(int(y7t,'x',-9.5,-7.5)) + double(int(y7t-y7b,'x',-7.5,7.5));
Area8 = 2*20;
Area9 = double(x9+12,'y',0,7));
Area = Area1 + Area2 + Area3 + Area4 + Area5 + Area6 + Area7 + Area8 + Area9;

%arc length predicting projectile distance
y = sym('-0.1*x^2 + x + 0.5');
ArcLength = int(sqrt(1+diff(y,'x')^2,'x',0,8);
ArcLength = double(ArcLength);

%distance traveled along path
x = sym('-6.5535e-6*y^3 + 0.0113*y^2 - 6.0125*y + 1407.9');
x_der = diff(x,'y');
walking_distance = double(int(sqrt(1+x_der^2),'y',289,656));


%centroids
Centroid – (5,25), Area = 10*10 = 100, My = 5*100 = 500, Mx = 25*100 = 2500;
Centroid – (17.5,10), Area = 35*20 = 700, My = 17.5*700 = 12250, Mx = 10*700 = 7000;
Centroid – (38.75,20), Area = 7.5*10 = 75, My = 38.75*75 = 2906.25, Mx = 20*75 = 1500;
Centroid – (55,27.5), Area = 25*5 = 125, My = 55*125 = 6875, Mx = 27.5*125 = 3437.5;
x = M_y/A = (500+12250+2906.25+6875)/(100+700+75+125) = 23.6628;
y = m_x/A = (2500+7000+1500+3437.5)/(100+700+75+125) = 14.8256;

Circle Equation: (x-0)2+(y-0)2 = 1.52 ? ?=±?(?1.5?^2??^2 )
Ellipse Equation: (??0)^2/?2.5?^2 +(??0)^2/?1.5?^2   = 1 ? ?=±?(?1.5?^2?0.36?^2 )

%egg
A = int(sqrt(1.5^2-x^2)-(-sqrt(1.5^2-x^2)),-1.5,0) + int(sqrt(1.5^2-0.36^2)-(-sqrt(1.5^2-0.36*x^2)),0,2.5);
x = 1/A * int(x*sqrt(1.5^2-x^2)-(-sqrt(1.5^2-x^2)),-1.5,0) + int(x*sqrt(1.5^2-0.36^2)-(-sqrt(1.5^2-0.36*x^2)),0,2.5);
y = 1/2A * int((1.5^2-x^2)-(1.5^2-x^2),-1.5,0) + int((1.5^2-0.36^2)-((1.5^2-0.36*x^2)),0,2.5);

y_circle_top = sym('sqrt(1.5^2-x^2)');
y_circle_bot = sym('-sqrt(1.5^2-x^2)');
y_ellipse_top = sym('sqrt(1.5^2 - 0.36*x^2)');
y_ellipse_bot = sym('sqrt(1.5^2 - 0.36*x^2)');
Area = double(int(y_circle_top - y_circle_bot,'x',-1.5,0) + double(int(y_ellipse_top - y_ellipse_bot,'x',0,2.5);
syms x;
x_cent = (1/Area) * double(int(x*(y_circle_top - y_circle_bot),'x',-1.5,0)) + double(int(x*(y_ellipse_top - y_ellipse_bot),'x',0,2.5)));
y_cent = (1/(2*Area)) * double(int(x*(y_circle_top^2 - y_circle_bot^2),'x',-1.5,0)) + double(int(x*(y_ellipse_top^2 - y_ellipse_bot^2),'x',0,2.5)));




 
 