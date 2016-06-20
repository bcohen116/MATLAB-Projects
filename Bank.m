% Computes Bank Balance
clear all; close all; clc;
Balance = input('Enter Initial Balance  ');
Deposit = input('Enter Monthly Deposit  ');
Interest = input('Enter Annual Interest Rate  ');
Years = input('Enter Number of Years  ');
for N = 1:Years*12
    Balance = (1+Interest/12)*Balance + Deposit;
end
fprintf('Final Balance: $%0.2f \n',Balance);

