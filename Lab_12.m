%% Part C
clear; close all;
message = input('Enter message: ','s');
Pic = imread('Cat','png');
CodedPic = Pic;
picSize = size(CodedPic);
message = double(message);
bin_message = dec2bin(message,8);
bin_message = bin_message';
bin_message = bin_message(:);
bin_message = bin_message';
if picSize(1)*picSize(2) < length(bin_message);
    error('Your message is too long');
end
index = 1;
for rows = 1:picSize(1)
    
    for col = 1:picSize(2)
        if strcmp(bin_message(index),'1')
            if (Pic(rows,col) == 255)
                CodedPic(rows,col) = Pic(rows,col) - 1;
            else
                CodedPic(rows,col) = Pic(rows,col) + 1;
            end
        else
            CodedPic(rows,col) = Pic(rows,col);
        end
        if index == length(bin_message)
            break;
        else
            index = index + 1;
        end
    end
end

imshow(Pic); title('Original');
figure;
imshow(CodedPic); title('Coded');
imwrite(CodedPic,'CodedCat.png');

%% Part D
clear; close all;
Pic = imread('Cat','png');
CodedPic = imread('CodedCat','png');
Pic = double(Pic);
CodedPic = double(CodedPic);
Difference = abs(Pic - CodedPic);
index = 1;
for rows = 1:size(Difference,1)
    for col = 1:size(Difference,2)
        if Difference(rows,col) == 1
            bin_message(index) = '1';
        else
            bin_message(index) = '0';
        end
        index = index + 1;
    end
end
y = 1;
x = 1;
while y < length(bin_message)
    message(x) = char(bin2dec(bin_message(y:y+7)));
    y = y+8;
    x = x + 1;
end
disp(message)


%% Part E
clear; close all;
Message_Interceptor_v2
Pic = imread('Image1','png');
CodedPic = imread('Image2','png');
Pic = double(Pic);
CodedPic = double(CodedPic);
Difference = abs(Pic - CodedPic);
index = 1;
for rows = 1:size(Difference,1)
    for col = 1:size(Difference,2)
        if Difference(rows,col) == 1
            bin_message(index) = '1';
        else
            bin_message(index) = '0';
        end
        index = index + 1;
    end
end
y = 1;
x = 1;
while y < length(bin_message)
    message(x) = char(bin2dec(bin_message(y:y+7)));
    y = y+8;
    x = x + 1;
end
disp(message)
