matrix = randn(5,4)
matrix(3,4)
matrix(2,:)
matrix(:,3)
matrix(3:4,1:2)
%error matrix(1,3) = '';
matrix(1,:) = ''
matrix > 0

%%
clear; close all; clc;
tsv = zeros(1,100);
tsv(1) = 1/2;
for x = 1:99
    tsv(x+1) = tsv(x) + 1/(x^2+3*x+2);
end
plot(0:99,tsv);

%%
clear; close all; clc;
speed = xlsread('Elevation','B2:M2');
elevation = xlsread('Elevation','B3:M8');
plot(speed,elevation);
