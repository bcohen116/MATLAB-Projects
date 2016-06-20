% Find the area enclosed by the two curves shown below. The top curve is a portion
% of an ellipse and the bottom curve is a portion of a circle. The equations for each curve are:
% find area
yt = sym('sqrt(25-25/16*(x+5)^2)')
yb = sym('3 - sqrt(25 - (x+5)^2)')
Area = int(yt-yb,'x',-9,-1);
Area = double(Area)

% 
% The figure below is a sketch of a deck of a ship which has the shape of two
% intersecting parabolic curves. Use the location indicated in the figure as the origin!
% find areA
yt = sym('15 - 7.5/1024*x^2')
yb = sym('7.5/1024*x^2')
Area = int(yt-yb,'x',-32,24);
Area = double(Area)
% Alternative: Use Symmetry
Area = 2*int(yt - 7.5,'x',-32,24);
Area = double(Area)

% The figure below represents a concrete roof beam for an auditorium. It has a
% straight top edge and a parabolic lower edge. Use the location indicated in the figure as the
% origin!
% find volume

yb = sym('-1.8/25*x^2')
Area = int(0.6-yb,'x',-5,5);
Area = double(Area)
Volume = Area*0.8