clc;clear;

% simulink parameters
dt = 0.001;

% initial settings
q0 = 0;
qdot0 = 0;

% actuator settings
jm = 9.215e-6; % rotor inertia
bm = 0.001;   % rotor friction
gearRatio = 51;
Jm = jm * gearRatio * gearRatio;
Bm = bm * gearRatio * gearRatio;
num1c = [kp];
den1c = [Jm Bm kp];
sys1c = tf(num1c, den1c);

% control settings
kp = 50;
kd = 1;

% chirp setting
f0 = 0.01;
f1 = 250;

simData = sim('posModel2.slx');
chirpResultAnalysis;

% use System Identification toolbox 
% to get system transfer function from chirp result

% systemIdentification
% bandwidth(sys1c)
