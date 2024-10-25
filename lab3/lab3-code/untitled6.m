% MATLAB Code to generate IID samples and plot scatter plots

% Number of samples
N_samples = 1000;

% Generate IID samples for x1[n] and x2[n] from uniform distribution
x1 = rand(N_samples, 1);  % Uniform distribution in [0, 1]
x2 = rand(N_samples, 1);  % Uniform distribution in [0, 1]

% Values of N to be evaluated
N_values = [1, 2, 5, 100];

% Create a figure for subplots
figure;

% Loop through each value of N and compute yN[n]
for p = 1:length(N_values)
    N = N_values(p);
    
    % Calculate yN[n] based on the given equation
    yN = ((1 - N) .* x1 + x2) / N;
    
    % Create scatter plot for (x1[n], yN[n])
    subplot(2, 2, p); % Create 2x2 subplots
    plot(x1, yN, '.', 'MarkerSize', 10); % Scatter plot
    title(['Scatter Plot for N = ' num2str(N)]); % Title for each subplot
    xlabel('x1[n]'); % Label for x1[n]
    ylabel('yN[n]'); % Label for yN[n]
    grid on; % Add grid for better visualization
end

% Adjust layout
sgtitle('Scatter Plots of (x1[n], yN[n]) for Different N Values'); % Overall title
