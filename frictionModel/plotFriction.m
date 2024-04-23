clc;clear;

Vmax = 5;
stepV = 0.0001;
n = Vmax*2/stepV + 1;
qdot = zeros(n,1);
tau1 = zeros(n,1);
tau2 = zeros(n,1);
p1 = zeros(n,1);
p2 = zeros(n,1);
p3 = zeros(n,1);
for i = 1:n
    qdot(i) = -Vmax + stepV * (i-1);
    [p1(i), p2(i),tau1(i)] = coulombFriction(qdot(i));
%     [p1(i), p2(i), p3(i), tau2(i)] = stribeckFriction(qdot(i));
end
plot(qdot, p1, 'b-', 'LineWidth',2);hold on;
plot(qdot, p2, 'r-', 'LineWidth',2);hold on;
plot(qdot, tau1, 'k-', 'LineWidth',2);hold on;box on; grid on;

% plot(qdot, p1, 'b-', 'LineWidth',2);hold on;
% plot(qdot, p2, 'r-', 'LineWidth',2);hold on;
% plot(qdot, p3, 'g-', 'LineWidth',2);hold on;
% plot(qdot, tau2, 'k-', 'LineWidth',3);hold on;box on; grid on;

xlabel('qdot(rad/s)',FontSize=14);
ylabel('frictionTau(Nm)', FontSize=14);
axis([-2,2,-2,2]);
set(gcf,'color', 'none');set(gca,'color', 'none')

