%% 2A
A = [2 -3 1; 5 -33 7; 1 7 -1];
b = [12; 33; 5];
det(A)
inv(A)*b
%% 2B
A = [2 1 2 1; 1 5 -1 -3; 4 -2 6 -1; 3 1 10 -2];
b = [4;1;-16;-23];
det(A)
inv(A)*b
%% 3C
A = [11.49 9.64; -17.32 10; -24.75 -24.75; -30.58 -5.11];
plot(A);
%% 4
A = [cos(25) cos(55); sin(25) sin(55)];
b = [0;120];
inv(A)*b
%% 5a
A = [2.2 3.6 1 0;3.6 10 0 1.1;1 0 5.6 4.7;0 1.1 4.7 6.8]
b = [0;-15;9;0];
inv(A)*b


