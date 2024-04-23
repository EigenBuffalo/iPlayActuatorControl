disp("simulation is done");
input = simData.chirpInput.Data;
output = simData.chirpOutput.Data;
N = 131072;
fs = 1000;

num1c = [kp];
den1c = [Jm Bm kp];
sys1c = tf(num1c, den1c);
sys1d = c2d(sys1c, 0.001, 'zoh');

wRange = 2*pi*(0:N-1)*fs/N;

[mag3DIdeal,phase3DIdeal] = bode(sys1d,wRange); 
magIdeal = reshape(mag3DIdeal,[1,N]);
phaseIdeal = reshape(phase3DIdeal,[1,N]);

fftout = fft(output,N);
fftin  = fft(input,N);
tf = fftout ./ fftin;

tfAmpdB = 20*log10(abs(tf));
tfPhaseDegree = phase(tf) * 180 / pi;

figure
subplot(2,1,1);
subplot(2,1,1);semilogx(wRange, 20*log10(magIdeal), 'b-', LineWidth=3);
hold on;
semilogx(wRange, tfAmpdB, 'r--', LineWidth=3);
grid on;box on;xlim([0.1 250]);
xlabel('omega（rad/s）','fontsize',13);
ylabel('magnitude（db）','fontsize',13);
title('bode plot, magnitude','fontsize',13);
legend('ideal system', 'chirp-fft result','fontsize',13);
subplot(2,1,2);
subplot(2,1,2);semilogx(wRange, phaseIdeal, 'b-', LineWidth=3);
hold on
semilogx(wRange, tfPhaseDegree, 'r--', LineWidth=3);
grid on;box on;xlim([0.1 250]);
xlabel('omega（rad/s）','fontsize',13);
ylabel('phase（°）','fontsize',13);
title('bode plot, phase','fontsize',13);
legend('ideal system', 'chirp-fft result','fontsize',13);


