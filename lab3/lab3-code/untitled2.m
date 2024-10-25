clear all;
close all;
% Parameters
num_processes = 50;  % Number of processes i = 1, 2, ..., 50
num_samples = 1000000;  % Number of samples per process
mu_x = 0;            % Mean for all processes

% Initialize variables
xi = zeros(num_processes, num_samples);  % Matrix to store all processes
uN_var = zeros(1, num_processes);        % Store variance of uN[n]
analytical_var = zeros(1, num_processes);% Store analytical variance

% Generate random processes xi[n] with E{xi[n]} = 0 and var = i
for i = 1:num_processes
    sigma_xi = sqrt(i);  % Standard deviation is sqrt(i)
    xi(i, :) = normrnd(mu_x, sigma_xi, 1, num_samples);
end

% Compute uN[n] for N = 1, 2, ..., 50
for N = 1:num_processes
    uN = mean(xi(1:N, :), 1);  % Average of first N processes at each n
    uN_var(N) = var(uN);        % Variance of uN[n]
    
    % Analytical solution: sum of variances divided by N
    analytical_var(N) = (N+1)/(2*N);
end

% Plot the results
figure;
hold on;
plot(1:num_processes, uN_var, 'b-', 'LineWidth', 1);       % Plot variance of uN[n]
plot(1:num_processes, analytical_var, 'r-', 'LineWidth', 1);% Plot analytical variance
xlabel('N');
ylabel('Variance');
legend('Numerical Variance', 'Analytical Solution');
title('Variance of IID Gaussian noise for i = 1,2,...,50 for 1M samples');
grid on;
hold off;
