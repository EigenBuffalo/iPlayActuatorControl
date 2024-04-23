clc;clear;

addpath('../frictionModel/');

% simulink parameters
dt = 0.001;
runT = 5.0;
noiseSeedIndex = floor(rand * 30000);

% initial settings
q0 = 0;
qdot0 = 0;

% actuator settings
jm = 9.215e-6; % rotor inertia
bm = 0.001;   % rotor friction
N = 51;
Jm = jm * N * N;
Bm = bm * N * N;
Kt = 0.1118 * N; % torque constant
tauMax = 35;
iMax = tauMax/Kt;

simPara.Jm = Jm;
simPara.Bm = Bm;
simPara.kp = 5;
simPara.kd = 0.5;
simPara.Kt = Kt;

wn = 1000;
zeta = 1;
num1c = wn*wn;
den1c = [1, 2*zeta*wn, wn*wn];
motorPICloseLoopTF = tf(num1c, den1c);

simData = sim('noLoadmodel.slx');

