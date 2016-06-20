%**************************************************************************
% Effects of different interpolation on signals
%**************************************************************************
clear all;
close all;
% initial signal
fprintf('Original Signal (After Compression) \n');
frequency = 1000;                   % frequency of 1000 Hz
t = 0:0.0003:5;                     % play sound for 5 seconds
y = sin(2*pi*frequency*t);          % create tone

subplot(2,3,1); plot(t,y,'r*'); % plot original signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Original Signal (After Compression)');

% upsample original signal using nearest point interpolation
fprintf('Please press enter to begin nearest point interpolation upsampling\n');
pause();
t1 = 0:0.0001:5;                    % generate desired time scale
y1 = interp1(t,y,t1,'nearest');     % interpolate using nearest point

subplot(2,3,2); plot(t1,y1,'r*');  % plot nearest point signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Nearest Point Upsampled Signal');
comp1 = audioplayer(y1,1/0.0001);   % create audio in MATLAB
playblocking(comp1);                % play comp1 audio signal

% upsample original signal using linear interpolation
fprintf('Please press enter to begin linear interpolation upsampling\n');
pause();
y2 = interp1(t,y,t1,'linear');      % interpolate using linear

subplot(2,3,3); plot(t1,y2,'r*--');        % plot linear signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Linear Upsampled Signal');
comp2 = audioplayer(y2,1/0.0001);   % create audio in MATLAB
playblocking(comp2);                % play comp2 audio signal

% upsample original signal using spline interpolation
fprintf('Please press enter to begin spline interpolation upsampling\n');
pause();
y3 = interp1(t,y,t1,'spline');      % interpolate using spline

subplot(2,3,5); plot(t1,y3,'r*--'); % plot spline signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Spline Upsampled Signal');
comp3 = audioplayer(y3,1/0.0001);   % create audio in MATLAB
playblocking(comp3);                % play comp3 audio signal

% upsample original signal using p-chip spline interpolation
fprintf('Please press enter to begin p-chip spline interpolation upsampling\n');
pause();
y4 = interp1(t,y,t1,'spline');      % interpolate using spline

subplot(2,3,6); plot(t1,y4,'r*--'); % plot spline signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('P-Chip Spline Upsampled Signal');
comp4 = audioplayer(y4,1/0.0001);   % create audio in MATLAB
playblocking(comp4);                % play comp3 audio signal

% actual signal
fprintf('Please press enter to begin original signal\n');
pause();
y5 = sin(2*pi*frequency*t1);        % compute original signal with current time values

subplot(2,3,4); plot(t1,y5,'r*--'); % plot original signal at higher samples
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Original Signal'); 
comp5 = audioplayer(y5,1/0.0001);   % create audio in MATLAB
playblocking(comp5);                % play comp4 audio signal