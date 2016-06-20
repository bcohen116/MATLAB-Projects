% Starter Code for Tic Tac Toe  K. Ossman  11/8/2015
clear; close all; clc;
Board = {'-','-','-';'-','-','-';'-','-','-'};  % For Displaying Plays
disp(Board)
Array = zeros(3,3);  % For finding winner, if any
Winner = 0;
Player = 1;
while sum(sum(Array == 0)) > 0   % NEED CONDITION HERE TO CHECK FOR EMPTY SPOTS ON BOARD!
    switch Player
        case 1  % Player 1
            play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
            row = play(1); col = play(2);
            % Add entry error checking if time permits
            Check = 0;
            while Check == 0
                if (row ~=1 && row ~=2 && row ~=3) || (col ~=1 && col ~=2 && col ~=3)
                    fprintf('Invalid space, try again. \n');
                    play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
                    row = play(1); col = play(2);
                elseif Array(row,col) ~= 0
                    fprintf('Invalid space, try again. \n');
                    play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
                    row = play(1); col = play(2);
                else
                    Check = 1;
                end
            end
            % Enter Player's choice, display it, and determine if winner:
            Array(row,col) = 1;
            Board{row,col} = 'X';
            disp(Board);
            
            Diag1 = Array(1,1) + Array(2,2) + Array(3,3);
            Diag2 = Array(1,3) + Array(2,2) + Array(3,1);
            if sum(Array(row,:)) == 3 || sum(Array(:,col)) == 3 || Diag1 == 3 || Diag2 == 3
                Winner = 1;
                break;
            else
                Player = 2;
            end
            
        case 2  % Player 2
            play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
            row = play(1); col = play(2);

            Check = 0;
            while Check == 0
                if (row ~=1 && row ~=2 && row ~=3) || (col ~=1 && col ~=2 && col ~=3)
                    fprintf('Invalid space, try again. \n');
                    play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
                    row = play(1); col = play(2);
                elseif Array(row,col) ~= 0
                    fprintf('Invalid space, try again. \n');
                    play = input('Place X?  Ex. [1,3] is row 1 and column 3:  ');
                    row = play(1); col = play(2);
                else
                    Check = 1;
                end
            end
            % Enter Player's choice, display it, and determine if winner:
            Array(row,col) = -1;
            Board{row,col} = 'O';
            disp(Board);
            
            Diag1 = Array(1,1) + Array(2,2) + Array(3,3);
            Diag2 = Array(1,3) + Array(2,2) + Array(3,1);
            if sum(Array(row,:)) == -3 || sum(Array(:,col)) == -3 || Diag1 == -3 || Diag2 == -3
                Winner = -1;
                break;
            else
                Player = 1;
            end
            
    end
end

