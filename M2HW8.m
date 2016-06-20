% The diagram below is of an odd-shaped window. The top of the window is a
% parabola and the bottom of the window is a portion of a circle with a radius of 4 ft.
% Note: use the origin indicated in the diagram.

yt = sym('-1.5*x^2 + 6 + sqrt(12)')
yb = sym('sqrt(16 - x^2)') %Positive Square Root since part of
top half of circle
Area = int(yt-yb,'x',-2,2);
Area = double(Area)



% (c) Find the length (arc length) of the cable from Point A to Point B. Note: the cable length
% from Point A to the left tower is exactly the same as the cable length from the right tower to
% Point B. Show all work, calculations and MATLAB commands.

yleft = sym('1/600*(x + 1600)^2')
ArcLeft = int(sqrt(1 + diff(yleft,'x')^2),'x',-1600,-1000);
ArcLeft = double(ArcLeft); % Point A to Left Tower
ArcRight = ArcLeft; % Right Tower to Point B
ycenter = sym('0.0006*x^2')
ArcCenter = int(sqrt(1 + diff(ycenter,'x')^2),'x',-1000,1000);
ArcCenter = double(ArcCenter);
ArcTotal = ArcLeft + ArcRight + ArcCenter

% Problem 3: If you take a flexible chain or wire, support it on both ends, then let it hang in the
% middle, you end up with a curve called a catenary curve. Catenary curves are used a lot in
% architecture. One famous example would be the St. Louis Arch. Find the arc length of the
% catenary curve shown below. Assuming an origin at the center of the base, the equation for the
% curve is provided. In MATLAB, the hyperbolic cosine function is: cosh. When you integrate,
% you may get a warning that an explict integral couldn’t be found. Use the double command
% and that will result in a numerical value for arc length. 


y = sym('165 - 70.14*cosh(x/100)')
Arc = int(sqrt(1 + diff(y,'x')^2),'x',-150,150);
Arc = double(Arc)