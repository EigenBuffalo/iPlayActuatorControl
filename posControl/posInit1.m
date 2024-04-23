clc;clear;

% simulink parameters
dt = 0.001;
runT = 20;

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
kp = 50;
kd = 1;

% chirp setting
f0 = 0.01;
f1 = 250;

% transfer function setup
num1c = [1];
den1c = [Jm*Jm, Bm, 0];
posModelConTF = tf(num1c, den1c);
posModelDisTF = c2d(posModelConTF, dt, 'tustin');

num1d = cell2mat(posModelDisTF.Numerator);
den1d = cell2mat(posModelDisTF.Denominator);

num2c = [Jm, Bm, kp];
den2c = [kp*Jm, kp*Bm, 0];
sysEconTF = tf(num2c, den2c);
sysEdisTF = c2d(sysEconTF,dt,'tustin');
num2d = cell2mat(sysEdisTF.Numerator);
den2d = cell2mat(sysEdisTF.Denominator);

