function [part1, part2, part3, friTorque] = stribeckFriction(qdot)
%STRIBECKFRICTION Summary of this function goes here
%   computing the friction torque using stribeck friction model
scale = 1;
fc = 2.789 * scale;
fv = 4.326 * scale;
k = 0.08324;
fs = 0.5869 * scale;
w = 0.1992;
part1 = fc * sign(qdot);
part2 = fv * tanh(k * qdot);
part3 = fs * exp(-(qdot/w)^2) * sign(qdot);

friTorque = part1 + part2 + part3;
end

