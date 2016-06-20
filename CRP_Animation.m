%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CRP_Animation.m - Dr. Bucks - 2/23/2015
% Description: This script will demonstrate the operation of the
% crank-rod-piston example by animating the movement of the system.
% Usage: >> CRP_Animation;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clean up
clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% determine how many revolutions to animate
revs = input('How many revolutions of the crankshaft do you wish to animate? ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute vectors
L = 0.3; r = 0.05; w = 100/60*2*pi;
t = 0:0.01:revs*2*pi/w;
Theta = w*t*180/pi;
position = r*cosd(Theta)+sqrt(L^2 - r^2*sind(Theta).^2);
velocity = -r*w*sind(Theta)-(r^2*w*sind(2*Theta))/(2*L);
acceleration = -r*w^2*cosd(Theta) - (r^2*w^2*cosd(2*Theta))/L;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% compute circle for crankshaft animation
xc = -0.05:0.001:0.05;
ytop = sqrt(0.05^2-xc.^2);
ybot = -sqrt(0.05^2-xc.^2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% animate system
for k = 1:length(t)
    subplot(3,2,1); plot(t,mod(Theta,360),t(k),mod(Theta(k),360),'r*');
    title('Angular Position'); xlabel('Time (s)'); ylabel('Angle (deg)');
    subplot(3,2,2); plot(t,position,t(k),position(k),'r*');
    title('Position of Piston'); xlabel('Time (s)'); ylabel('Distance (m)');
    subplot(3,2,3); plot(t,velocity,t(k),velocity(k),'r*');
    title('Velocity of Piston'); xlabel('Time (s)'); ylabel('Velocity (m/s)');
    subplot(3,2,4); plot(t,acceleration,t(k),acceleration(k),'r*');
    title('Acceleration of Piston'); xlabel('Time (s)'); ylabel('Acceleration (m/s^2)');
    subplot(3,2,5:6); plot([-0.4 0.1],[0 0],'k--');                                                 % mark axis
    hold on;
    subplot(3,2,5:6); plot(xc,ytop,'g--',xc,ybot,'g--');                                            % plot crankshaft
    subplot(3,2,5:6); plot([-position(k) -r*cosd(Theta(k))],[0 r*sind(Theta(k))],'k-');             % plot rod
    subplot(3,2,5:6); rectangle('Position',[-position(k)-0.05,-0.0125,0.05,0.025],'FaceColor','k'); % plot piston
    title('Crank-Rod-Piston System');
    hold off;
    pause(0.01);                                                                                     % pause to show animation
end