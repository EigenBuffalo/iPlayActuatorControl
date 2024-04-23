# Simulink Actuator Control

## frictionModel/
Two types of actuator friction models and their functions are provided.

## posControl/
- **Position controlled** actuators simulinks
- Bandwidth measurement, transfer function, state space form, etc.
- Position-Torque transform verification models 


## velControl/
- **Velocity controlled** actuators simulinks
- Continuous system, discrete system, open loop, closed loop transfer function verification
- Velocity-Torque transform verification models 

## currentControl/
- **Current controlled** actuators simulinks
- noLoadmodel: noload current control model, feedforward + feedback + friction compensation 
- withLoadmodel: with link load current control model, feedforward + feedback + friction compensation + gravity compensation + simscape visualization