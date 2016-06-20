% Stats K. Ossman 11/16/2015
dates = {'11/23/2014','11/24/2014','11/25/2014','11/26/2014','11/27/2014','11/28/2014','11/29/2014','11/30/2014'};
airports = {'CVG','CMH','DAY'};
% Create a matrix with the mean daily delays.  
% Each column will be an airport and each row will be a date
avg_delay = zeros(length(dates),length(airports));
% Insert Nested For Loops Below:
for row = 1:length(dates)
    for col = 1: length(airports)
        n = find(strcmp(F.Airport,airports(col)) & strcmp(F.Date,dates(row)));
        avg_delay = mean(F.Delay(n));
    end
end

% Make bar plot
bar(avg_delay); 
% The next two commands show how to put the dates (strings) on the x-axis
set(gca,'XTick',1:length(dates));
set(gca,'XTickLabel',dates);
ylabel('Average Daily Delay (minutes)');
legend('CVG','CMH','DAY');

Delta = sum(strcmp(F.Airport,'CVG')&strcmp(F.Carrier,'DL'));

AmEagle = sum(strcmp(F.Airport,'CVG')&strcmp(F.Carrier,'MQ'));

Express = sum(strcmp(F.Airport,'CVG')&strcmp(F.Carrier,'E*'));

pie([Delta AmEagle Express])
legend('Delta','American Eagle','Express','Location','NorthEastOutside')
title('Flight Distribution at CVG')

Time = datevec(F.Depart);
F.Hour = Time(:,4);
gscatter(F.Hour,F.Delay,F.Carrier); ylim([-20,500]);
xlabel('Hour of Departure'); 
ylabel('Delay (minutes)');


