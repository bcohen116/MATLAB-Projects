%% Part B
message = input('Enter message to encrypt: ','s');
key = input('Enter encryption key: ');
number_message = double(message);
for x = 1:length(number_message)
    if number_message(x) > 64 && number_message(x) < 91
        number_message(x) = number_message(x) + key;
        if number_message(x) > 90
            number_message(x) = (number_message(x) - 90) + 64;
        end
    elseif number_message(x) > 96 && number_message(x) < 123
        number_message(x) = number_message(x) + key;
        if number_message(x) > 122
            number_message(x) = (number_message(x) - 122) + 96;
        end
    end
end
fprintf('Encrypted message is: %s \n',number_message);

%% Part C
message = input('Enter message to decrypt: ','s');
key = input('Enter decryption key: ');
number_message = double(message);
for x = 1:length(number_message)
    if number_message(x) > 64 && number_message(x) < 91
        number_message(x) = number_message(x) - key;
        if number_message(x) < 65
            number_message(x) = (number_message(x) - 65) + 91;
        end
    elseif number_message(x) > 96 && number_message(x) < 123
        number_message(x) = number_message(x) - key;
        if number_message(x) < 97
            number_message(x) = (number_message(x) - 97) + 123;
        end
    end
end
fprintf('Decrypted message is: %s \n',number_message);

%% Part D
message = input('Enter message to decrypt: ','s');
key = 25;
number_message = double(message);
c = 0;
while c ~=1 && key > 0
    for x = 1:length(number_message)
        if number_message(x) > 64 && number_message(x) < 91
            number_message(x) = number_message(x) - key;
            if number_message(x) < 65
                number_message(x) = (number_message(x) - 65) + 91;
            end
        elseif number_message(x) > 96 && number_message(x) < 123
            number_message(x) = number_message(x) - key;
            if number_message(x) < 97
                number_message(x) = (number_message(x) - 97) + 123;
            end
        end
    end
    key = key - 1;
    fprintf('Decrypted message is: %s , key = %i\n',number_message,key + 1);
    c = menu('Does this look Correct?','Yes','No');
end