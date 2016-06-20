clear; close all; clc;
r = 0.03;
L = 0.5;
w = 15.7; %150 rpm
v = sym('(-r*w*sin(Th) - (r^2*w*sin(2*Th)))/(2*L)');
dy = diff(v,'Th');
criticalPts = solve(dy==0,'Th');
criticalPts = subs(criticalPts);
criticalPts = double(criticalPts)

%solution
vel = sym('-0.03*15.708*sin(Theta)-
0.03^2*15.708*sin(2*Theta)/(2*0.5)');
der1 = diff(vel,'Theta');
CriticalPoints = solve(der1==0,'Theta');
CriticalPoints = double(CriticalPoints) % Radians
CriticalPoints_Deg = double(CriticalPoints)*180/pi % Degrees
CriticalPoints_Deg =
 1.0e+02 *
 -0.8658 + 0.0000i
 -1.8000 + 1.6140i
 1.8000 - 1.6140i
 0.8658 + 0.0000i
%



dy2 = diff(dy,'Th');
test = subs(dy2,'Th',criticalPts);
test = subs(test);
test = double(test)
%solution
der2 = diff(der1,'Theta');
der2_test = subs(der2,'Theta',CriticalPoints);
der2_test = double(der2_test)
 der2_test =
 -0.4771 + 0.0000i Negative so velocity is max at -86.580
 0.0000 + 3.9830i
 0.0000 - 3.9830i
 0.4771 + 0.0000i Positive so velocity is min at +86.58o
%


dCritical = criticalPts *180/pi

Th = dCritical(1);
min = subs(v);
min = double(min)
Th = dCritical(2);
max = subs(v);
max = double(max)

Tht = 0:10:360;
for x = 1:length(Tht)
   Th = Tht(x);
   vel(x) = subs(v);
   vel(x) = double(vel(x));
end
plot(Tht,vel);
xlabel('angle(degrees)');
ylabel('velocity m/s)');
title('Velocity over crank angle');

%% problem 2
clear; close all; clc;

%solution
S = sym('15000/L*(L-x)*(0.25*L-x)');
der1 = diff(S,'x');
CriticalPoints = solve(der1==0,'x')
CriticalPoints =
0.625*L
%

S = sym('(w/(2*z*L))*(L-x)*(0.25*L-x)');
w = 15000;
z = 0.5;
L = 40;

dy = diff(S,'x');
criticalPts = solve(dy==0,'x');
criticalPts = subs(criticalPts);
criticalPts = double(criticalPts)
x = criticalPts;

dy2 = diff(dy,'x');
test = subs(dy2,'x',criticalPts);
test = subs(test);
test = double(test)

%solution
L = 40;
x = 0:0.01:L;
Stress = 15000/L*(L-x).*(0.25*L-x);
plot(x,Stress,'k-','LineWidth',2)
title('Stress for Beam');
xlabel('Distance (m) from Fixed End');
ylabel('Stress (N/m^2)');

%

xdist = 1:x;
for k = 1:length(xdist)
    x = xdist(x);
    Y(k) = subs(S);
    Y(k) = double(Y(k));
end
plot(xdist,Y)
xlabel('dist (m)');
ylabel('stress N/m');
title('Stress graph');

%% part 3
clear; close all; clc;
%solution
def = sym('15000/(48*5e10*0.25*L)*x^2*(L-x)*(3*L - 2*x)');
der1 = diff(def,'x');
CriticalPoints = solve(der1 == 0,'x');
CriticalPoints = simplify(CriticalPoints)
CriticalPoints =
 0
0.57846483459137320875933678323632*L
 1.2965351654086267912406632167637*L INVALID OFF BEAM!
 %
Y = sym('(w/(48/8*e*i*L))*x^2*(L-x)*(3*L-2*x)');
w = 15000;
e = 5*10^10;
i = 0.25;
L=40;

dy = diff(Y,'x');
criticalPts = solve(dy==0,'x');
criticalPts = subs(criticalPts);
criticalPts = double(criticalPts)
x = criticalPts;

%solution
der2 = diff(der1,'x');
der2_test = subs(der2,'x',CriticalPoints);
der2_test = simplify(der2_test)
der2_test =
 0.00000015*L POS SO MIN
-0.000000083075687028235046715248706286381*L NEG SO MAX
 0.00000018620068702823504671524870628638*L
 %

dy2 = diff(dy,'x');
test = subs(dy2,'x',criticalPts);
test = subs(test);
test = double(test)

xdist = 1:x(end);
for k = 1:length(xdist)
    x = xdist(k);
    y(k) = subs(Y);
    y(k) = double(y(k));
end
plot(xdist,y)
xlabel('dist (m)');
ylabel('deflection (m)');
title('Deflection graph');
%solution
W = 15000; L = 40; I = 0.25; E = 5e10;
x = 0:0.1:L;
Def = W*x.^2.*(L-x).*(3*L - 2*x)/(48*E*I*L);
plot(x,Def,'k-','LineWidth',2);
title('Deflection in Beam');
ylabel('Deflection (m)');
xlabel('Distance (m) from Fixed End')
%

%% part 4
clear; close all; clc;
L = input('Enter loan amount: ');
P = input('Enter monthly payment: ');
N = input('Enter # of payments to make: ');
guess = 0.01;
f = (L*guess-P*(1-(1/(1+guess)^N)));
dF = (L-N*P*(guess+1)^(-N-1));
while f > 0.0001
    while (f) == 0
        guess = guess + 0.01;
    end
    f = (L*guess-P*(1-(1/(1+guess)^N)));
    dF = (L-N*P*(guess+1)^(-N-1));
    newGuess = guess - f / dF;
    guess = newGuess;
end
fprintf('monthly rate: %2f \n',guess);
fprintf('annual rate: %2f \n',guess*12);

%solution
clear; close all; clc;
L = input('Enter Loan Amount: ');
P = input('Enter Monthy Payment Amount: ');
N = input('Enter Number of Payments: ');
r = 0.01;
f = L*r - P*(1 - 1/(1+r)^N);
while abs(f) > 0.0001
 % Avoid Division by Zero by checking for Derivative = 0
 while L - N*P/(1+r)^(N+1) == 0
 r = r + 0.001;
 end

 % Update r using Newton-Raphson Algorithm
 r = r - (L*r - P*(1 - 1/(1+r)^N))/(L - N*P/(1+r)^(N+1));

 % Evaluate most recent estimate for accuracy
 f = L*r - P*(1 - 1/(1+r)^N);

end
AnnualRate = 12*r*100;
fprintf('The Monthly Interest Rate is: %0.2f %% \n', 100*r);
fprintf('The Annual Interest Rate is: %0.2f %% \n',
AnnualRate);
%

