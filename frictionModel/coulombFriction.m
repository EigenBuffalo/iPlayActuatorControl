function [part1, part2, friTorque] = coulombFriction(qdot)
fc = 0.5;vs = 0.05;mu = 0.36;
if (qdot >= vs)
    k = 1;
elseif (qdot <= -vs)
    k = -1;
else
    k = -1 + 2*((qdot + vs)/(2*vs))^2 * (2 - qdot/vs);
end
part1 = fc * k;part2 = mu * qdot;
friTorque = part1 + part2;
end

