%Austin Lods, Ben Cohen, Adam Stanek
clear all; close all;
load Connect
% initially shows the board
imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
%Variable set up
Player  = 1;
SpacesTaken = zeros(6,7);
win = false;
Down = 0;
Right = 0;
Left = 0;
RightMid = 0;
LeftMid = 0;
Diag1 = 0;
Diag2 = 0;
Diag3 = 0;
Diag4 = 0;
Diag5 = 0;
Diag6 = 0;
Diag7 = 0;
Diag8 = 0;
%loop to see if player has won
while win == false
     %records move
       move = menu('Pick your column','col1','col2','col3','col4','col5','col6','col7'); 
       x = 6;
       %checks for first open slot to place a piece on player move as well
       %as checks for winner.
       while x > 0 
           if SpacesTaken(x,move) == 0 
               %places the move
                if Player == 1
                    SpacesTaken(x,move) = 1;
                    for z = 1:x
                        if z ~= 1
                            Board{z - 1,move} = BlankSquare;
                        end
                        Board{z,move} = redchip;
                        imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
                        pause(0.1);
                        if x ~= 1
                            Board{1,move} = BlankSquare;
                            imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
                        end    
                    end
                else
                    SpacesTaken(x,move) = 22;
                    for z = 1:x
                        if z ~= 1
                            Board{z - 1,move} = BlankSquare;
                        end
                        Board{z,move} = blackchip;
                        imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
                        pause(0.1);
                        if x ~= 1
                            Board{1,move} = BlankSquare;
                            imshow([Board{1,:};Board{2,:};Board{3,:};Board{4,:};Board{5,:};Board{6,:}])
                        end    
                    end
                end
                %win checking, adds spaces together, makes ure checks dont
                %go out of bounds
                if x < 4
                Down = SpacesTaken(x,move) + SpacesTaken(x+1,move) + SpacesTaken(x+2,move) + SpacesTaken(x+3,move);
                end
                if move < 5
                Right = SpacesTaken(x,move) + SpacesTaken(x,move+1) + SpacesTaken(x,move+2) + SpacesTaken(x,move+3);
                end
                if move < 5 && x > 3
                Diag1 = SpacesTaken(x,move) + SpacesTaken(x-1,move+1) + SpacesTaken(x-2,move+2) + SpacesTaken(x-3,move+3);
                end
                if move > 3 && x < 4
                Diag2 = SpacesTaken(x,move) + SpacesTaken(x+1,move-1) + SpacesTaken(x+2,move-2) + SpacesTaken(x+3,move-3);
                end
                if move > 3
                Left = SpacesTaken(x,move) + SpacesTaken(x,move-1) + SpacesTaken(x,move-2) + SpacesTaken(x,move-3);
                end
                if move > 2 && move ~=7
                LeftMid = SpacesTaken(x,move) + SpacesTaken(x,move+1) + SpacesTaken(x,move-1) + SpacesTaken(x,move-2);
                end
                if move > 1 && move < 6
                RightMid = SpacesTaken(x,move) + SpacesTaken(x,move+1) + SpacesTaken(x,move-1) + SpacesTaken(x,move+2);
                end
                if move > 1 && x < 6 && x > 2 && move < 6
                Diag4 = SpacesTaken(x,move) + SpacesTaken(x-1,move+1) + SpacesTaken(x-2,move+2) + SpacesTaken(x+1,move-1);
                end
                if move > 3 && x < 5 && move < 7 && x > 1
                Diag3 = SpacesTaken(x,move) + SpacesTaken(x-1,move+1) + SpacesTaken(x+1,move-1) + SpacesTaken(x+2,move-2);
                end
                if move < 5 && x < 4
                Diag5 = SpacesTaken(x,move) + SpacesTaken(x+1,move+1) + SpacesTaken(x+2,move+2) + SpacesTaken(x+3,move+3);
                end
                if move > 3 && x > 3
                Diag6 = SpacesTaken(x,move) + SpacesTaken(x-1,move-1) + SpacesTaken(x-2,move-2) + SpacesTaken(x-3,move-3);
                end
                if move > 2 && x > 2 && move < 7 && x < 6
                Diag7 = SpacesTaken(x,move) + SpacesTaken(x-1,move-1) + SpacesTaken(x-2,move-2) + SpacesTaken(x+1,move+1);
                end
                if move < 6 && x < 5 && move > 1 && x > 1
                Diag8 = SpacesTaken(x,move) + SpacesTaken(x+1,move+1) + SpacesTaken(x+2,move+2) + SpacesTaken(x-1,move-1);
                end
                %control player turns and win statements
                %decides if player won
                if (Down == 4 || Right == 4 || Left == 4 || RightMid == 4 || LeftMid == 4 || Diag1 == 4 || Diag2 == 4 ||Diag3 == 4 ||Diag4 == 4 || Diag5 == 4 || Diag6 == 4 ||Diag7 == 4 ||Diag8 == 4)
                    win = true;
                    msgbox('Player 1 Wins');
                    break;
                elseif (Down == 88 || Right == 88 || Left == 88 || RightMid == 88 || LeftMid == 88 || Diag1 == 88 || Diag2 == 88 ||Diag3 == 88 ||Diag4 == 88 || Diag5 == 88 || Diag6 == 88 ||Diag7 == 88 ||Diag8 == 88)
                    win = true;
                    msgbox('Player 2 Wins');
                end
                %changes the player  
                if Player == 1
                    Player = 2;
                else
                    Player = 1;
                end
                      count = 0;
           %checks for a tie
           for y = 1:7
               if SpacesTaken(1,y) ~= 0
                   count = count + 1;
               end
           end
           if count == 7
               msgbox('CatsGame, you tied.');
           end
           %stops ths program from putting pieces everywhere on the board
           if SpacesTaken(x,move) > 0
               break;
           end
           x = x-1;
            %checks if a column is full
           elseif SpacesTaken(x,move) ~= 0 && x == 1
               msgbox('Column is full, try again.');
               break;
           %continues the loop so it's not infinite
           else
               x = x-1;
           end
        end
end