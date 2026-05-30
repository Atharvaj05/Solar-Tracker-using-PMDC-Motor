function [PWM_Duty, Dir_A, Dir_B] = tracker_controller(v_ldr1, v_ldr2, deadband, low_light)
% #eml
% Microcontroller control logic block representing Arduino tracking updates

    % Baseline defaults
    PWM_Duty = 0; 
    Dir_A = 0; 
    Dir_B = 0;
    
    % Compute comparative tracking deviation
    error_val = v_ldr1 - v_ldr2;
    
    % Evaluate extreme low-light scenario (Dusk Return Routine)
    if (v_ldr1 < low_light) && (v_ldr2 < low_light)
        PWM_Duty = 75;  % Steady tracking speed back to origin
        Dir_A = 0; 
        Dir_B = 1;      % Polarity initialization towards East
        return;
    end
    
    % Core Closed-Loop Threshold Execution
    if abs(error_val) <= deadband
        % Target aligned within acceptable variance limits
        PWM_Duty = 0;
        Dir_A = 0; 
        Dir_B = 0;
    elseif error_val > deadband
        % Westward alignment adjust required
        PWM_Duty = min(100, abs(error_val) * 45); 
        Dir_A = 1; 
        Dir_B = 0;
    else
        % Eastward alignment adjust required
        PWM_Duty = min(100, abs(error_val) * 45); 
        Dir_A = 0; 
        Dir_B = 1;
    end
end