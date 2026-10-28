clear;
clc;

setenv("FASTDDS_BUILTIN_TRANSPORTS", "UDPv4"); 
% Use UDP-only transport for MATLAB-to-Docker ROS 2 communication.
% This resolved a message-reception issue in my local setup, It can be omitted if communication works with the default transport.

try
    ur5e = ur5_interface();
    pause(2);

    T = 5;

    q1 = ur5e.home;
    q2 = q1 + [pi/6;0;pi/6;0;0;0];
    q3 = q1 + [-pi/6; -pi/12; pi/4; pi/12; 0; 0];
    q4 = q1 + [0; pi/6; pi/3; -pi/6; pi/6; 0];
    
    Q = [q1, q2, q3, q4];
    
    for k = 1:4
        fprintf('Moving to configuration %d of 4\n', k);
        ur5e.move_joints(Q(:,k),T);
        pause(T+1);
    
        qActual = ur5e.get_current_joints();
        maxerror = max(abs(qActual - Q(:,k)));
        fprintf('Maximum error: %.6f rad\n', maxerror);
    
        if maxerror > 0.03
            error("Robot didn't reach");
        end
    end

    clear ur5e
    disp("Task 1 completed.");

catch ME
    clear ur5e
    rethrow(ME);
end





