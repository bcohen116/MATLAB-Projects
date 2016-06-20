clear; close all; clc;
Temps = xlsread('tire_lab', 'A22:A223');
Deflection = xlsread('tire_lab', 'B22:B223');
r1 = 1;
r2 = 201;
Trows = floor(linspace(r1,r2,20));
Temps = Temps(Trows);
Deflection = Deflection(Trows);
table1 = table(Temps,Deflection)
%Temp values to use for interpol
ExpectedT = transpose([-9.7 -6.7 0.2 4.3 9.5]); 


%interpol for table 2
linear = interp1(Temps, Deflection, ExpectedT, 'linear');
for x = 1:length(linear)
    errorL(x) = abs(linear(x)-Deflection(x))/Deflection(x) * 100;
end
errorL = transpose(errorL);
nearest = interp1(Temps, Deflection, ExpectedT, 'nearest');
for x = 1:length(nearest)
    errorN(x) = abs(nearest(x)-Deflection(x))/Deflection(x) * 100;
end
errorN = transpose(errorN);
spline = interp1(Temps, Deflection,ExpectedT, 'spline');
for x = 1:length(spline)
    errorS(x) = abs(spline(x)-Deflection(x))/Deflection(x) * 100;
end
errorS = transpose(errorS);
D = xlsread('tire_lab', 'B22:B223');
T = xlsread('tire_lab', 'A22:A223');
T = find(T == ExpectedT(1)| T == ExpectedT(2)| T == ExpectedT(3)| T == ExpectedT(4)| T == ExpectedT(5));
for x = 1:length(T)
    Actual(x) =  D(x);
end
Actual = transpose(Actual);
for x = 1:length(linear)
    absErrorL(x) = abs(linear(x)-Deflection(x));
end
for x = 1:length(nearest)
    absErrorN(x) = abs(nearest(x)-Deflection(x));
end
for x = 1:length(spline)
    absErrorS(x) = abs(spline(x)-Deflection(x));
end
absErrorN = transpose(absErrorN);
absErrorL = transpose(absErrorL);
absErrorS = transpose(absErrorS);
table2 = table(ExpectedT,nearest,linear,spline,Actual,errorN,errorL,errorS,absErrorN,absErrorL,absErrorS)

%mean for table 3
meanN = mean(absErrorN);
meanL = mean(absErrorL);
meanS = mean(absErrorS);
sqrMeanN = meanN^2;
sqrMeanL = meanL^2;
sqrMeanS = meanS^2;
table3 = table(meanN,meanL,meanS,sqrMeanN,sqrMeanL,sqrMeanS)

%plot
plot(Temps,Deflection,'-bo',ExpectedT,nearest,'-ko',ExpectedT,linear,'-ro',ExpectedT,spline,'-go')
xlabel('Temperature (AA)');
ylabel('Deflection (mm)');
title('Tire tests');
legend('Original','Near interpol','linear interpol','spine interpol');

% part 4 equations
realTemps = xlsread('tire_lab', 'C22:C223');
slope = (210-130)/(10-(-10)); % == 4
y = zeros(length(Temps),1);
for z = 1:length(Temps)
    x = Temps(z);
    y(z) = slope*(x-10)+210;
   
end
realTemps = realTemps(Trows);

figure;
plot(Temps,realTemps,'-bo',Temps,y,'-ro');
legend('Real values','calculated values');
ylabel('Degrees C');
xlabel('AA degrees');
title('Real Temperatures');


