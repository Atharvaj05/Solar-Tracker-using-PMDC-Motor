% init_tracker_params.m
% Initialization parameters for the PMDC Solar Tracker Simulation

%% Electrical Parameters (12V Nominal PMDC Motor)
V_nom = 12;          % Nominal armature voltage (V)
R_a = 2.5;           % Armature winding resistance (Ohms)
L_a = 0.001;         % Armature winding inductance (H)
K_t = 0.05;          % Motor torque constant (N*m/A)
K_e = 0.05;          % Back-EMF constant (V/(rad/s))

%% Mechanical Parameters
J_m = 0.0001;        % Rotor moment of inertia (kg*m^2)
B_m = 0.00005;       % Viscous damping coefficient (N*m*s/rad)
Gear_Ratio = 100;    % Worm gear assembly reduction ratio
J_panel = 0.5;       % Solar panel structural inertia (kg*m^2)

%% Sensors & Controller Variables
V_in = 5;            % Microcontroller reference voltage (V)
R_F = 10000;         % Voltage divider fixed resistance (Ohms)
Deadband_Tol = 0.15; % Tracking voltage deadband tolerance (V)
Low_Light_Thresh = 0.5; % Low-intensity reset trip point (V)
K_p = 50;            % Proportional gain multiplier for PWM speed scaling