load Lecture5
figure; imshow(Pic)
max = max(max(Pic));
min = min(min(Pic));
newPic = double(Pic);
newPic = 255/160 * (newPic - 40); %slope of min and max
newPic = uint8(newPic);
figure; imshow(newPic)