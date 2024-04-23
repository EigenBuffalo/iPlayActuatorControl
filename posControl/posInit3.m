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

% control settings
kp = 80;
kd = 1;

% chirp setting
f0 = 0.01;
f1 = 250;

A = [0 1; 0 -Bm/Jm];
B = [0; 1/Jm];
C = [1, 0];
D = 0;


ssConCloseLoop = ss(A - B * [kp, 0],B,C,D);
ssDisCloseLoop = c2d(ssConCloseLoop,0.001);

dcGain = - C * inv(A - B * [kp, 0]) * B;

simData = sim('posModel3.slx');
chirpResultAnalysis;