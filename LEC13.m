yt = sym('sqrt(4-4*x^2/1.44)');
yb = sym('-sqrt(1.44-x^2)');

A = 1/4*(pi*1.2^2 + pi *1.2*2);
A = double(int(yt-yb,'x',0,1.2));

syms x;   % Don’t forget this!!!!
xbar = 1/A*int(x*(yt-yb),'x',0,1.2)
% or xbar = double(xbar)

ybar = 1/(2*A)*int(yt^2-yb^2,'x',0,1.2)
