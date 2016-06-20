%**************************************************************************
% Effects of removing samples from a signal
%**************************************************************************
clear all;
close all;
% initial signal
fprintf('Original Signal\n');
frequency = 1000;                   % frequency of 1000 Hz
t = 0:0.0001:5;                     % play sound for 5 seconds
y = sin(2*pi*frequency*t);          % create tone

subplot(2,2,1); plot(t,y);          % plot original signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Original Signal');
original = audioplayer(y,1/0.0001); % create audio in MATLAB
playblocking(original);             % play original audio signal

% keep half of the samples from initial signal
fprintf('Please press enter to begin 2x downsampled signal\n');
pause();
t1 = t(1:2:length(t));              % take every other time value
y1 = y(1:2:length(y));              % take every other signal value

subplot(2,2,2); plot(t1,y1,'b*--');        % plot original signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Compressed by 2x Signal');
comp1 = audioplayer(y1,1/0.0002);   % create audio in MATLAB
playblocking(comp1);                % play comp1 audio signal

% keep quarter of the samples from initial signal
fprintf('Please press enter to begin 4x downsampled signal\n');
pause();
t2 = t(1:4:length(t));              % take every other time value
y2 = y(1:4:length(y));              % take every other signal value

subplot(2,2,3); plot(t2,y2,'b*--');        % plot original signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Compressed by 4x Signal');
comp2 = audioplayer(y2,1/0.0004);   % create audio in MATLAB
playblocking(comp2);                % play comp1 audio signal

% keep eighth of the samples from initial signal
fprintf('Please press enter to begin 8x downsampled signal\n');
pause();
t3 = t(1:8:length(t));              % take every other time value
y3 = y(1:8:length(y));              % take every other signal value

subplot(2,2,4); plot(t3,y3,'b*--');        % plot original signal
axis([0 0.005 -1 1]);               % scale axis so signal can be viewed
title('Compressed by 8x Signal');
comp3 = audioplayer(y3,1/0.0008);   % create audio in MATLAB
playblocking(comp3);                % play comp1 audio signal