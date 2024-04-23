clc;clear;format long;

% simulink parameters
dt1k = 0.001;
dt5k = 1/5000;
runT = 10;
seedIndex = floor(rand * 10000);

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
num1c = 1;
den1c = [Jm, Bm];

% continuous, open-loop transfer function
velModelConTF = tf(num1c, den1c);

% continuous, close-loop transfer function
velModelConTFCL = feedback(kp*velModelConTF, 1);
num1cCL = cell2mat(velModelConTFCL.Numerator);
den1cCL = cell2mat(velModelConTFCL.Denominator);

% discrete, open-loop transfer function
velModelDisTF = c2d(velModelConTF, dt5k, 'tustin');
num1d = cell2mat(velModelDisTF.Numerator);
den1d = cell2mat(velModelDisTF.Denominator);

% discrete, close-loop transfer function
velModelDisTFCL = c2d(velModelConTFCL,dt5k, 'tustin');
num2d = cell2mat(velModelDisTFCL.Numerator);
den2d = cell2mat(velModelDisTFCL.Denominator);


% torque-velocity transformer
num2c = [Jm, Bm+kp];
den2c = [kp*Jm, kp*Bm];
sysEconTF = tf(num2c, den2c);
sysEdisTF = c2d(sysEconTF,dt1k,'tustin');
numEd = cell2mat(sysEdisTF.Numerator);
denEd = cell2mat(sysEdisTF.Denominator);