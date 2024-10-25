% Initialize the problem parameters
N_max = 100;  % Maximum value of N
num_samples = 1000;  % Number of samples
mu_x1 = 0;  % Mean of x1[n]
sigma_x1 = 1;  % Standard deviation of x1[n]
mu_x2 = 0;  % Mean of x2[n]
sigma_x2 = 1;  % Standard deviation of x2[n]
highlight_N = [1, 2, 5, 100];  % Specific N values to highlight

% Generate random samples for x1[n] and x2[n] using normrnd
x1 = normrnd(mu_x1, sigma_x1, [1, num_samples]);  % x1[n] with N(0, 1)
x2 = normrnd(mu_x2, sigma_x2, [1, num_samples]);  % x2[n] with N(0, 1)



% Preallocate array to store rho_hat values for N = 1 to 100
rho_hat_values = zeros(1, N_max);

% Loop over different values of N
for N = 1:N_max
    % Generate yN[n] based on the formula: yN[n] = ((1-N)*x1[n] + x2[n])/N
    yN = ((1 - N) * x1 + x2) / N;
    
    % Compute the empirical normalized cross-covariance coefficient
    rho_hat_values(N) = compute_rho_hat(x1, yN);
end

% Plot the results
figure;
plot(1:N_max, rho_hat_values, '-b', 'LineWidth', 1.5);  % Plot rho_hat for N = 1:100
hold on;

% Highlight specific points at N = 1, 2, 5, 100
for i = 1:length(highlight_N)
    N = highlight_N(i);
    plot(N, rho_hat_values(N), 'ro', 'MarkerSize', 4, 'MarkerFaceColor', 'r');  % Highlight points
end

% Add labels and title
xlabel('N', 'FontSize', 12);
ylabel('\rho_{x_1,y_N}[0]', 'FontSize', 12);
title('Empirical Normalized Cross-Covariance Coefficient \rho_{x_1,y_N}[0]', 'FontSize', 14);

% Add grid and legend
grid on;
legend('Empirical \rho_{x_1, y_N}[0]', 'Highlighted Points (N = 1, 2, 5, 100)', 'Location', 'best');

hold off;

% Function to compute the normalized cross-covariance coefficient
function rho_hat = compute_rho_hat(x1, yN)
    mu_x1 = mean(x1);
    mu_yN = mean(yN);
    
    % Compute the numerator of the normalized cross-covariance
    numerator = sum((x1 - mu_x1) .* (yN - mu_yN));
    
    % Compute the denominator (square root of the product of variances)
    denominator = sqrt(sum((x1 - mu_x1).^2) * sum((yN - mu_yN).^2));
    
    % Compute the normalized cross-covariance coefficient
    rho_hat = numerator / denominator;
end
