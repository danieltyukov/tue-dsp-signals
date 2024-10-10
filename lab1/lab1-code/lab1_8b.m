% Given parameters
T_s = 0.1;          % Inter-sample distance
start_ind = -2;     % Starting index

% Student IDs
studentid1 = 1819283;
studentid2 = 1812033;

% Encode the student IDs as vectors
x1 = [1 8 1 9 2 8 3];  % Student ID 1819283
x2 = [1 8 1 2 0 3 3];  % Student ID 1812033

% Perform sinc interpolation for Student ID 1
[x_a1, t1, n1] = sincinterpolation(x1, start_ind, T_s);

% Perform sinc interpolation for Student ID 2
[x_a2, t2, n2] = sincinterpolation(x2, start_ind, T_s);

% Plotting
figure;

% First subplot for Student ID 1
subplot(2,1,1);
plot(t1, x_a1, 'b', 'LineWidth', 1.5);      % Interpolated signal in blue
hold on;
stem(n1 * T_s, x1, 'r', 'filled');          % Discrete samples in red
grid on;
title('Student ID: 1819283');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Interpolated Signal', 'Discrete Samples');
hold off;

% Second subplot for Student ID 2
subplot(2,1,2);
plot(t2, x_a2, 'b', 'LineWidth', 1.5);      % Interpolated signal in blue
hold on;
stem(n2 * T_s, x2, 'r', 'filled');          % Discrete samples in red
grid on;
title('Student ID: 1812033');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Interpolated Signal', 'Discrete Samples');
hold off;
