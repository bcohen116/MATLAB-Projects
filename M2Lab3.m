clear; close all; clc;
%Part b
num = input('Enter #: ');
guess = input('Enter guess: ');
newGuess = guess;
iterations = 0;
while abs(guess^5-num) > 0.0001 && iterations < 100
    while (5*guess^4) == 0
        guess = guess + 0.01;
    end
    data(iterations+1) = guess;
    newGuess = guess - (guess^5 - num) / (5*guess^4);
    
    guess = newGuess;
    
    iterations = iterations + 1;
    fprintf('Completed %i iterations. \n',iterations);
end
if iterations < 100
    fprintf('Final estimate: %0.5f \n',newGuess);
else
    fprintf('Failed to find an estimate, try using a better guess next time. \n');
end    
N = linspace(0,iterations,length(data));
plot(N,data);
xlabel('Iterations');
ylabel('Estimate');
title('Estimating 5th root');

%% Part C
clear; close all; clc;
guess = input('Enter guess: ');
newGuess = guess;
iterations = 0;
while abs((1000+2*guess+3*guess^(2/3))-4*guess) > 0.0001  && iterations < 100
    while (2+2*guess^(-1/3)-4) == 0
        guess = guess + 0.01;
    end
    data(iterations+1) = guess;
    newGuess = guess - ((1000+2*guess+3*guess^(2/3))-4*guess) / (2+2*guess^(-1/3)-4);
    
    guess = newGuess;
    
    iterations = iterations + 1;
    fprintf('Completed %i iterations. \n',iterations);
end
if iterations < 100
    fprintf('Final estimate: %0.5f \n',newGuess);
else
    fprintf('Failed to find an estimate, try using a better guess next time. \n');
end    
cost = 1000+2*guess+3*guess^(2/3)
sales = 4*guess