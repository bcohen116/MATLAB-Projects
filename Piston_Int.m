% Numerical Integration Example for CrankRodPiston 

DeltaT = input('Enter your deltaT value (seconds)  ');
r = 0.05; L = 0.3;   % Crank radius and length of rod (m)
w = 100/60*2*pi;     % Angular velocity in rad/sec

t=0:DeltaT:1.5;
% Create vector of velocity measurements
vel_meas = -r*w*sin(w*t) - r^2*w*sin(2*w*t)/(2*L);

% Estimate Position by integrating velocity (Trapezoid Rule)
pos_est = zeros(size(vel_meas));
pos_est(1) = 0.35;
for k = 2:length(pos_est)
    pos_est(k) = pos_est(k-1) + 0.5*(vel_meas(k-1)+vel_meas(k))*DeltaT;
end



% Check accuracy of estimate
pos_actual = r*cos(w*t)+sqrt(L^2-r^2*sin(w*t).^2);
Error = abs(pos_actual - pos_est);

% Calculate piston position using a finer time increment
tfine = 0:DeltaT/100:1.5;
pos_piston = r*cos(w*tfine)+sqrt(L^2-r^2*sin(w*tfine).^2);

% Plotting
subplot(2,1,1); plot(tfine,pos_piston,'k-',t,pos_est,'r*','LineWidth',2);
xlabel('time (sec)'); ylabel('Piston Position (m)'); 
legend('Actual','Estimated');
title(['Numerical Integration Using Trapezoid Rule  DeltaT = ',num2str(DeltaT)]); grid
subplot(2,1,2); stem(t,Error,'r*');
xlabel('time (sec)'); ylabel('Estimation Error (m)'); title('Error in Piston Position Estimate'); grid

