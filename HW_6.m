%% Problem 2
name = input('Enter name: ', 's');
age = input('Enter age: ');
city = input('Enter city: ','s');
state = input('Enter State: ', 's');
zip = input('Enter zip code: ');
fprintf(' Name: %s \n Age: %i\n City: %s\n State: %s\n Zip: %i\n',name,age,city,state,zip);
c=menu('Is this correct?','Yes','No');
while c ~= 1
    menu2 = menu('Which is incorrect?','Name','Age','City','State','Zip');
    switch menu2
        case 1
            name = input('Enter name: ', 's');
        case 2
            age = input('Enter age: ');
        case 3
            city = input('Enter city: ','s');
        case 4
            state = input('Enter State: ', 's');
        case 5
            zip = input('Enter zip code: ');
            
    end
    fprintf(' Name: %s \n Age: %i\n City: %s\n State: %s\n Zip: %i\n',name,age,city,state,zip);
    c=menu('Is this correct?','Yes','No');
end
fprintf('Congrats! It is correct! \n');

%% problem 3
angle = input('Enter angle between 0 and 2pi: ');
Est1(1) = 1;
Est2(1) = 0;
x = 1;
while abs(Est1(x)- Est2(x)) > 1e-5;
    x = x + 1;
    Est2(x) = Est1(x-1);
    Est1(x) = Est1(x-1) + (-1)^(x-1)*angle^(2*(x-2))/factorial(2*x-2);
end
fprintf('Estimate: %0.6f \n',Est1(x));
fprintf('Actual: %0.6f \n',sin(angle));
fprintf('Terms: %i \n',x);

%% Problem 4
rng('shuffle');
balance = input('How much $$ do your currently have?');
again = 1;
while again == 1 || balance <=0
    wager = balance + 1;
    while wager > balance
        wager = input('Enter how much $ to wager: ');
    end
    overUnder = menu('Over or under or equal 7?','Over 7','Under 7','Equal to 7');
    Dice1 = randi([1 6],1);  
    Dice2 = randi([1 6],1); 
    Sum = Dice1 + Dice2;
    fprintf('Dice 1: %i \nDice 2: %i \nSum: %i \n',Dice1,Dice2,Sum);
    if Sum > 7 && overUnder == 1
        fprintf('You win!, winnings are: $%0.2f \n',wager);
        balance = balance + wager;
        fprintf('Current balance is : $%0.2f \n',balance);
    elseif Sum < 7 && overUnder == 2
        fprintf('You win!, winnings are: $%0.2f \n',wager);
        balance = balance + wager;
        fprintf('Current balance is : $%0.2f \n',balance);
    elseif Sum == 7 && overUnder == 3
        winnings = wager * 4;
        fprintf('You win!, winnings are: $%0.2f \n',winnings);
        balance = balance + winnings;
        fprintf('Current balance is : $%0.2f \n',balance);
    else
        fprintf('You Lose! \n');
        balance = balance - wager;
        fprintf('Current balance is : $%0.2f \n',balance);
    end
    again = menu('Play again?','Yes','No');
end
fprintf('Your final balance is $%0.2f \n',balance);