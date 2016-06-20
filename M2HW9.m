% he diagram below is of an odd-shaped window. The top of the window is a
% parabola and the bottom of the window is a portion of a circle with a radius of 4 ft.
% Note: use the origin indicated in the diagram.
% find centroid
Area = 14.5506;
yt = sym('-1.5*x^2 + 6 + sqrt(12)')
yb = sym('sqrt(16-x^2)')
y_bar = 1/(2*Area)*int(yt^2-yb^2,'x',-2,2);
y_bar = double(y_bar)

% Consider the object shown below. The bottom curve is a line and the top curve is a
% parabola with a vertex of (2, 12) as indicated in the diagram. Units are in cm.
% (a) Find the equation for the parabola (SHOW WORK)
% find centroid
x_bar = 3.1767 cm y_bar = 8.3285 cm

yt = sym('1/32*(x-2)^2 + 12')
yb = sym('1.4*x')
Area = int(yt-yb,'x',0,10);
Area = double(Area);
syms x; % Must declare x as symbolic variable to compute x_bar
x_bar = 1/Area*int(x*(yt - yb),'x',0,10);
x_bar = double(x_bar)
y_bar = 1/(2*Area)*int(yt^2-yb^2,'x',0,10);
y_bar = double(y_bar)