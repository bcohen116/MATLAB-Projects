
%% C-1
load Weather
t = 1970:1:2015;
for x = 1:46
    days(x) = length(find(W.TMAX > 90 & W.YEAR == x + 1969));
end
plot(t,days)
xlabel('Year');
ylabel('Days over 90 degrees');
title('Hot Days');
%% C-2
load Weather
close all;
t = 1970:1:2014;
for x = 1:45
    days = W.YEAR == x + 1969;
    year(x) = sum(W.PRCP(days));
    if x == 1
        lowest = x + 1969;
        highest = x + 1969;
    elseif year(lowest - 1969) > year(x)
        lowest = x + 1969;
    end
    if x ~=1 && year(highest - 1969) < year(x)
        highest = x + 1969;
    end
end
disp(lowest)
disp(highest)
mean(year)
plot(t,year)
xlabel('Year');
ylabel('Precipitation (in)');
title('Precipitation Levels');