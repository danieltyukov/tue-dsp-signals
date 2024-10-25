close all;
clear all;

% Number of samples for each random process
num_samples = 1000;

% Number of random processes (i = 1, 2, ..., 10)
N_values = [1, 2, 10];

% Initialize random processes for i = 1, 2, ..., 10
x = cell(1, 10);
for i = 1:10
    % Generate random samples for xi[n] with mean 0 and variance i
    x{i} = normrnd(0, sqrt(i), [1, num_samples]);
end

% Compute u_N[n] for N = 1, 2, 10
u_N = cell(1, 3);
for k = 1:3
    N = N_values(k);
    u_N{k} = zeros(1, num_samples);
    for n = 1:N
        u_N{k} = u_N{k} + x{n};
    end
    u_N{k} = u_N{k} / N;
end

% Plot the results
f = figure;
for k = 1:3
    subplot(1, 3, k);
    plot(u_N{k});
    title(['u_{N}[n] for N = ', num2str(N_values(k))]);
    xlabel('n');
    ylabel(['u_{N}[n]']);
end

% Adjust the y-axis for better comparison
subplot(1, 3, 1);
axis([0, num_samples, -5, 5]);
subplot(1, 3, 2);
axis([0, num_samples, -5, 5]);
subplot(1, 3, 3);
axis([0, num_samples, -5, 5]);


saveas(f, sprintf('1b.png'))
