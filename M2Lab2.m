clear; close all; clc
lat = [39.132844; 39.132662; 39.132353; 39.132076; 39.132001; 39.131964];
long = [-84.516888; -84.516955; -84.516878; -84.516945; -84.517047; -84.517095];
dist(1) = 0; pos(1) = 0; vel2(1) = 0; vel3(1) = 0; accel(1) = 0;
for x = 2:length(lat)
    dist(x) = 222240*asind(sqrt((sind((lat(x)-lat(x-1))/2))^2+cosd(lat(x-1))*cosd(lat(x))*(sind((long(x)-long(x-1))/2))^2));
    pos(x) = sum(dist);
    vel2(x) = (pos(x) - pos(x-1))/2;
end
for x = 2:length(lat)-1
    vel3(x) = (pos(x+1) - pos(x-1))/(2*2);
    accel(x) = (pos(x+1) - 2*pos(x) + pos(x-1))/(2^2);
end
fprintf('dist: '); disp(dist)
fprintf('pos:'); disp(pos)
fprintf('vel2: '); disp(vel2)
fprintf('vel3: '); disp(vel3)
fprintf('accel: '); disp(accel)