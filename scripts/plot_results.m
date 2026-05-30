% plot_results.m
% Visual output analysis script for tracking trajectory validation

if ~exist('out', 'var')
    error('Please execute the Simulink model simulation execution before parsing performance plots.');
end

figure('Name', 'Closed-Loop System Tracking Profile', 'Color', 'w');
subplot(2,1,1);
plot(out.tout, out.Sun_Angle, 'r--', 'LineWidth', 2); hold on;
plot(out.tout, out.Panel_Angle, 'b-', 'LineWidth', 1.5);
grid on; grid minor;
title('Solar Tracking Real-Time Trajectory Optimization');
xlabel('Simulation Runtime Timeline (s)');
ylabel('Position Coordinate Angle (Degrees)');
legend('Reference Target Trajectory (Sun)', 'Actual Structural Alignment (Panel)', 'Location', 'best');

subplot(2,1,2);
plot(out.tout, out.Motor_Voltage, 'k-', 'LineWidth', 1.2);
grid on;
title('H-Bridge Regulated Armature Drive Profile');
xlabel('Simulation Runtime Timeline (s)');
ylabel('Average Armature Input EMF Value (V)');