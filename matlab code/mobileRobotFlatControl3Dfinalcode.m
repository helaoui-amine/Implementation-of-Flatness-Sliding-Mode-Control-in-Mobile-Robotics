function mobileRobotFlatControl3D()
% Control gains
k1 = 1;
k2 = 1;

% Desired trajectory parameters
t_end = 3.5;
dt =0.05;
t = 0:dt:t_end;

% Desired trajectory (Circular path)
    radius = 5;
    angular_velocity = 2;
    f1_desired = radius * cos(angular_velocity * t);
    f2_desired = radius * sin(angular_velocity * t);
    f1_dot_desired = -radius * angular_velocity * sin(angular_velocity * t);
    f2_dot_desired = radius * angular_velocity * cos(angular_velocity * t);
    f1_doubledot_desired = -radius * angular_velocity^2 * cos(angular_velocity * t);
    f2_doubledot_desired = -radius * angular_velocity^2 * sin(angular_velocity * t);
    
   % Initial conditions

  x0 = f1_desired(1);
y0 = f2_desired(1);
theta0 = atan2(f2_dot_desired(1), f1_dot_desired(1));
v1_0 = sqrt(f1_dot_desired(1)^2 + f2_dot_desired(1)^2);

% Initialize state vectors
x = zeros(size(t));
y = zeros(size(t));
z = zeros(size(t));
theta = zeros(size(t));
v1 = zeros(size(t));
angular_velocities = zeros(size(t));
angular_velocity_desired = angular_velocity * ones(size(t)); % Desired Angular Velocity
acceleration = zeros(size(t)); % Linear Acceleration
% Set initial conditions
x(1) = x0;
y(1) = y0;
theta(1) = theta0;
v1(1) = v1_0;

  % Perturbation parameters
    amplitude = 0;  % Amplitude of the disturbance
    frequency = 1;  % Frequency of the disturbance
    
% Simulation loop
for i = 1:length(t)-1
    % Current states
    curr_x = x(i);
    curr_y = y(i);
    curr_z = z(i);
    curr_theta = theta(i);
    curr_v1 = v1(i);
    
    % Flat output and its derivatives
    f1 = curr_x;
    f2 = curr_y;
    f1_dot = curr_v1 * cos(curr_theta);
    f2_dot = curr_v1 * sin(curr_theta);
    
    % Control inputs
    u1 = (f1_dot * f1_doubledot_desired(i) + f2_dot * f2_doubledot_desired(i)) / sqrt(f1_dot^2 + f2_dot^2);
    u2 = (f1_dot * f2_doubledot_desired(i) - f2_dot * f1_doubledot_desired(i)) / (f1_dot^2 + f2_dot^2);
           
    disturbance = amplitude * sin(frequency * t(i));

    % Update states using control inputs
    x(i+1) = curr_x + dt * curr_v1 * cos(curr_theta)+disturbance;
    y(i+1) = curr_y + dt * curr_v1 * sin(curr_theta)+disturbance;
    theta(i+1) = curr_theta + dt * u2;    v1(i+1) = curr_v1 + dt * u1;
    angular_velocities(i+1) = (theta(i+1) - theta(i)) / dt;
    acceleration(i+1) = (v1(i+1) - v1(i)) / dt;
end

% 3D Visualization
figure;
plot3(x, y, z, 'b', 'LineWidth', 2);
hold on;
plot3(f1_desired, f2_desired, zeros(size(f1_desired)), 'r--', 'LineWidth', 1);
hold off;
xlabel('x');
ylabel('y');
zlabel('z');
title('Robot Trajectory in 3D');
legend('trajectoire désirée', 'trajectoire de robot');
view(45, 30);

% Figure 1: Desired f1 vs. Actual x
figure;
plot(t, f1_desired, 'r', t, x, 'b');
legend('trajectoire désirée sur x', 'trajectoire de robot sur x');
xlabel('Time');
ylabel('f1, x');
title('trajectoire désirée et trajectoire de robot sur x');

% Figure 2: Desired f2 vs. Actual y
figure;
plot(t, f2_desired, 'r', t, y, 'b');
legend('trajectoire désirée sur y ', 'trajectoire de robot sur y');
xlabel('Time');
ylabel('f2, y');
title(' trajectoire désirée et trajectoire de robot sur y');

% Figure 3: Robot Trajectory
figure;
plot(x, y, 'b');
hold 
plot3(f1_desired, f2_desired, zeros(size(f1_desired)), 'r--', 'LineWidth', 1);
xlabel('x');
ylabel('y');
title('Robot Trajectory');
legend('trajectoire de robot', 'trajectoire désirée');

% Figure 4: Robot Speed
figure;
plot(t, v1, 'b'); 
xlabel('Time');
ylabel('v1');
title('vitesse lineaire ');

% Figure 5: Angular Velocity
figure;
plot(t, angular_velocities, 'b', t, angular_velocity_desired, 'r--');
xlabel('Time');
ylabel('vitesse angulaire ');
title('vitesse angulaire ');
legend('vitesse angulaire de robot', 'vitesse angulaire désirée');

% Figure 6: Linear Acceleration
figure;
plot(t, acceleration, 'b');
xlabel('Time');
ylabel(' accélération linéaire ');
title(' accélération linéaire');

end
