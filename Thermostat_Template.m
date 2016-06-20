%Ben Cohen, Austin Thomas, Conn Gerrard
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lab_09_Thermostat_2.m - <Team Members> - <Date>
% Description: This script will simulate the operation of a thermostat,
% utilizing the NI myDAQ and a simple LM335 temperature sensor.  The
% voltage from the sensor will be read in and converted to a temperature
% value.  The script will then determine, based on the temperature, whether
% to turn on the air conditioning (if it is too hot) or the furnace (if it
% is too cold), which are indicated by LED's.
% Usage: >> Lab_09_Thermostat;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Circuit Connections:
% 5V used to power temperature sensor
% AO0 connected to Red LED
% AO1 connected to Green LED
% AI0+ connected to point between reistor and temperature sensor
% AI0- connected to AGND
% AGND used for circuit grounding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% move to command window
commandwindow;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clean up
clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DAQ setup
fprintf('Setting up connection to DAQ...\n');

% check for connected device, if no device found, inform user and terminate
devices_found = daq.getDevices;
if isempty(devices_found)
    error('No devices connected: please connect a DAQ device and rerun.');
end

% set up DAQ
DAQ_Vendor = devices_found.Vendor.ID;               % determine type of device connected
DAQ_ID = devices_found.ID;                          % determine ID for connected device
DAQ = daq.createSession(DAQ_Vendor);                % create DAQ session
if strcmp(DAQ_Vendor,'digilent')
    DAQ.addAnalogOutputChannel(DAQ_ID,1,'Voltage'); % add output voltage channel to turn on furnace light
    DAQ.addAnalogOutputChannel(DAQ_ID,2,'Voltage'); % add output voltage channel to turn on AC light
    DAQ.addAnalogInputChannel(DAQ_ID,1,'Voltage');  % add input voltage channel to check temperature value
    DAQ.addAnalogInputChannel(DAQ_ID,2,'Voltage');  % add input voltage channel to check thermostat off
else
    DAQ.addAnalogOutputChannel(DAQ_ID,0,'Voltage'); % add output voltage channel to turn on furnace light
    DAQ.addAnalogOutputChannel(DAQ_ID,1,'Voltage'); % add output voltage channel to turn on AC light
    DAQ.addAnalogInputChannel(DAQ_ID,0,'Voltage');  % add input voltage channel to check temperature value
    DAQ.addAnalogInputChannel(DAQ_ID,1,'Voltage');  % add input voltage channel to check thermostat off
end
DAQ.outputSingleScan([0 0]);
fprintf('Connection established...\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTION E.1
desired_temp = input('Enter desired temperature ');
desired_range = input('Enter the desired range ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTION E.2
AC = 0;
heat = 0;
data = DAQ.inputSingleScan
while data(2) > 2.5
    data = DAQ.inputSingleScan
    T = ((data(1) - 3.0006)/.01) + 21.11;
    T_F = (9/5)*T+32;
    fprintf('The room temperature is %.4f \n.',T_F);
    if T_F > (desired_temp + desired_range) || (T_F > desired_temp && AC == 1)
        AC = 1; heat = 0;
        DAQ.outputSingleScan([10,0]);
        fprintf('The AC is on');
    elseif T_F < (desired_temp - desired_range) || (T_F < desired_temp && heat == 1)
        heat = 1; AC = 0;
        DAQ.outputSingleScan([0,10]);
        fprintf('The heat is on');
    else
        heat = 0; AC = 0;
        DAQ.outputSingleScan([0,0]);
        fprintf('The heat and AC are both off');
    end
    pause(1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTION E.3
DAQ.outputSingleScan([0 0]);
fprintf('Thermostat is no longer running');




