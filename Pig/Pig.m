%Ben Cohen
close all; clear;
load Dice; 
% Variable Initilization
numPlayers = input('How many players? ');
points = zeros(numPlayers, 1);
playerHasWon = false;
winningPlayer = 0;
PlayerTurn = 1;
pointsPerTurn = 0;
% Controls the turns until someone wins
while playerHasWon == false
    
    % Roll and Show Dice
    roll = randi([1 6],[1 2]); 
    figure('WindowStyle','docked'); close; 
    imshow([Dice{roll}],'InitialMagnification','fit');
    fprintf('Player %i Rolls: %i, %i \n', PlayerTurn, roll(1), roll(2));
    
    %Count points and display them
    pointsPerTurn = pointsPerTurn + (roll(1) + roll(2));
    if roll(1) == 1 || roll(2) == 1
        points(PlayerTurn) = points(PlayerTurn) - pointsPerTurn;
        pointsPerTurn = 0;
    end
    points(PlayerTurn) = points(PlayerTurn) + (roll(1) + roll(2));
    
    fprintf('Current points: %i \n', points(PlayerTurn));
    
    % Check if they win
    if points(PlayerTurn) >= 100
        PlayerHasWon = true;
        winningPlayer = PlayerTurn;
        break;
    end
    
    % Check if they hold or want to roll again
    rollAgain = menu('Roll again?', 'Yes','No (Hold)');
    if rollAgain == 2
        if PlayerTurn == numPlayers
            PlayerTurn = 1;
        else
            PlayerTurn = PlayerTurn + 1;
        end
        pointsPerTurn = 0;
    end
end
% Display the winner
fprintf('Player %i has won! \n', winningPlayer);

