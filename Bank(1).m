% Starter Code for Lecture 10 Bank Balance Example K. Ossman
clear; close all; clc;
Interest = 0.05;
Years = 10;
Deposit = 0:100:500; 
Balance = zeros(6,120);  % Pre-allocate Space

% Add an outer loop to go through each entry in the Deposit Vector
% Modify the code in the inner loop so Balance becomes a 6x120 matrix.  
for d = 1:length(Deposit);
    Balance(d,1) = 1000;
    for k = 1:12*Years
        Balance(d,k+1) = (1+Interest/12)*Balance(d,k) + Deposit(d);
    end

    % Display Final Balances for each Monthly Deposit
    fprintf('Montly deposit = $%0.2f \t Final Balance = $%0.2f \n',Deposit(d),Balance(d,k));
end
% Plot the Monthly Balances for each Deposit on a single graph
plot(0:120,Balance);
legend('$0','$100','$200','$300','$400','$500');

%% Sort
x = randi([1,100],[1,1000]);
plot(x);
pause(1);
swap = 1;
while swap == 1
    swap = 0;
    for k = 1:length(x)-1
        if x(k) > x(k+1) %swap
            x([k k+1]) = x([k+1 k]);
            swap = 1;
        end
    end
    plot(x)
    pause(0.01);
end


%% Blurring
pic = imread('Tree_Grayscale','jpg');
imshow(pic); title('original');
pic = double(pic);
newpic = zeros(size(pic));
[nrows ncol] = size(pic);
for row = 3: nrows - 2
    for col = 3: ncol - 2
       newpic(row,col) = mean(mean(pic(row - 2:row + 2, col - 2: col + 2))); 
    end
end
newpic = uint8(newpic);
figure; imshow(newpic); title('Blurred');






