%% part c
% C#1
r1 = input('Enter resistor 1 value: ');
r2 = input('Enter resistor 2 value: ');
source = input('Enter source voltage value: ');
tol1 = input('Enter tolerance 1 value as a decimal: ');
tol2 = input('Enter tolerance 2 value as a decimal: ');
atol1 = input('Enter acceptable tolerance 1 value as a decimal: ');
atol2 = input('Enter acceptable tolerance 2 value as a decimal: ');
% C#2
voltage1 = (r1 / (r1 + r2)) * source;
voltage2 = (r2 / (r1 + r2)) * source;
min1 = r1 - r1*tol1;
max1 = r1 + r1*tol1;
min2 = r2 - r2*tol2;
max2 = r2 + r2*tol2;
acceptableV1min = voltage1 - voltage1 * atol1;
acceptableV2min = voltage2 - voltage2 * atol2;
acceptableV1max = voltage1 * atol1 + voltage1;
acceptableV2max = voltage2 * atol2 + voltage2;
% C#3
range1 = min1:(max1-min1)/500:max1;
range2 = min2:(max2-min2)/500:max2;
results = zeros(500,500);
for x = 1:length(range1)
    for y = 1:length(range2)
        v1 = (range1(x)/(range1(x) + range2(y)))*source;
        if (v1 < acceptableV1min || v1 > acceptableV1max)
            results(x,y) = 0;
        else
            results(x,y) = 255;
        end
    end
end
% C#4
imshow(uint8(results))
% Part D
nominal1_value = r1;
nominal2_value = r2;
range1 = tol1 * nominal1_value;
range2 = tol2 * nominal2_value;
newr1 = zeros(1,10000);
newr2 = zeros(1,10000);
count = 0;
for z = 1:10000
    resistor1_value = nominal1_value + range1/2*randn(1);
    resistor2_value = nominal2_value + range2/2*randn(1);
    newr1(z) = (resistor1_value / (resistor1_value + resistor2_value)) * source;
    newr2(z) = (resistor2_value / (resistor1_value + resistor2_value)) * source;
    if (newr1(z) < acceptableV1min || newr1(z) > acceptableV1max)
        count = count + 1;
    end
end
figure; hist(newr1,100); xlabel('Voltage V'); ylabel('# of appearances'); title('Resistor 1 voltage');
figure; hist(newr2,100); xlabel('Voltage V'); ylabel('# of appearances'); title('Resistor 2 voltage');
probability = (count/10000) * 100;
fprintf('Probability is: %0.2f percent \nNumber of incorrect circuits: %i \n)',probability,count);
