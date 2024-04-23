clc;clear;

addpath('../frictionModel/');

% simulink parameters
dt = 0.001;
runT = 5.0;
g = -9.80665;
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
tauMax = 350;
iMax = tauMax/Kt;

% link settings
r = 0.02;
rho = 800;
linkL = 1.0;
linkM = pi*r*r*linkL*rho;
linkJ = 0.25*linkM*r*r + linkM*linkL*linkL/3;
linkJcom = 0.25*linkM*r*r + linkM*linkL*linkL/12;
linkMOI = [linkJcom+Jm, linkJcom+Jm, 0.5*linkM*r*r+Jm];


% 
simPara.Jm = Jm;
simPara.Bm = Bm;
simPara.kp = 20;
simPara.kd = 2;
simPara.Kt = Kt;
simPara.linkM = linkM;
simPara.linkJ = linkJ;
simPara.linkL = linkL;
simPara.gravity = [0 0 g];

wn = 1000;
zeta = 1;
num1c = wn*wn;
den1c = [1, 2*zeta*wn, wn*wn];
motorPICloseLoopTF = tf(num1c, den1c);

simData = sim('withLoadmodel.slx');

