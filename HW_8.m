%% Part 1
M = [-1  2  5; 6  2  -4; 7  0  5];
[nrows, ncols] = size(M);
S = zeros(1,nrows);
for row = 1:nrows
    S(row) = M(row,1);
    for col = 2:ncols
        if M(row,col) < S(row)
            S(row) = M(row,col);
        end
    end
end
%% Part 2
M = [3  1  5;  4  -4  5; 2  -3  -5;  0  1  -1];
[nrows, ncols] = size(M);
Add = zeros(1,ncols);
Total = 0;
for col = 1:ncols
    for row = 1:nrows
        Add(col) = Add(col) + M(row,col)
        col
        row
    end
    Total = Total + Add(col)
end
%% Part 3
load HW8
C = zeros(4,6);
countA = 0;
countB = 0;
countSame = 0;
for x = 1:4
    for y = 1:6
        if A(x,y) > B(x,y)
            C(x,y) = A(x,y);
            countA = countA + 1;
        else
            C(x,y) = B(x,y);
            if A(x,y) == B(x,y)
                countSame = countSame + 1;
            else
                countB = countB + 1;
            end
        end
    end
end
fprintf('Larger A count: %i \nLarger B count: %i\nSame count: %i\n',countA,countB,countSame);
%% Part 4
win_lose = [0	1	-1	1	-1;
-1	0	1	-1	-1;
1	-1	0	-1	1;
1	-1	1	0	-1;
-1	1	-1	1	0];
rng('shuffle');
Picks = {'Rock','Paper','Scissors','Lizard','Spock'};
play_again = 1;
wins = 0;
ties = 0;
losses = 0;
while(play_again == 1) 
    pick = menu('Choose a move:','Rock','Paper','Scissors','Lizard','Spock');
    cpuChoice = randi([1,5]);
    if (win_lose(cpuChoice,pick) == 1)
        fprintf('You chose %s, cpu chose %s. You won!\n',char(Picks(:,pick)),char(Picks(:,cpuChoice)));
        wins = wins + 1;
    elseif (win_lose(cpuChoice,pick) == 0)
        fprintf('You chose %s, cpu chose %s. You Tied!\n',char(Picks(:,pick)),char(Picks(:,cpuChoice)));
        ties = ties + 1;
    else
        fprintf('You chose %s, cpu chose %s. You Lost!\n',char(Picks(:,pick)),char(Picks(:,cpuChoice)));
        losses = losses + 1;
    end
    play_again = menu('Play again?','Yes','No');
end
fprintf('Totals: \nWins: %i \nLosses: %i \nTies: %i\n',wins,losses,ties);



