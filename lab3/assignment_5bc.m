%% Assignment 5b
% Parameters
sigma_x2 = 1;
M = 1000;
L = 11;
lags = -(L-1):(L-1);
N_fft = 100;

% Generate white noise signal x[n]
x = sqrt(sigma_x2) * randn(1, M);

% Estimate autocorrelation of x[n]
r_x_hat = zeros(1, length(lags));
for idx = 1:length(lags)
    l = lags(idx);
    r_x_hat(idx) = crosscor(x, x, l);
end

% Prepare autocorrelation sequence for FFT
R_x_hat = [r_x_hat(L:end), zeros(1, N_fft - 2*L + 2), r_x_hat(L-1:-1:1)];

% Compute estimated PSD
P_x_hat = real(fft(R_x_hat));
omega = linspace(0, pi, N_fft/2 + 1);
P_x_hat = P_x_hat(1:length(omega));  % Retain positive frequencies

% Theoretical PSD
P_x_theoretical = sigma_x2 * ones(size(omega));

% Plot
figure;
plot(omega, P_x_theoretical, 'LineWidth', 2);
hold on;
stem(omega, P_x_hat, 'r', 'filled');
xlabel('\omega');
ylabel('PSD');
title('Estimated vs Theoretical PSD of x[n]');
legend('Theoretical PSD', 'Estimated PSD');
grid on;

%% Assignment 5c
% Compute y[n]
x_shifted = [0, x(1:end-1)];  % x[n-1] with zero padding
y = 0.5 * (x + x_shifted);

% Estimate autocorrelation of y[n]
r_y_hat = zeros(1, length(lags));
for idx = 1:length(lags)
    l = lags(idx);
    r_y_hat(idx) = crosscor(y, y, l);
end

% Prepare autocorrelation sequence for FFT
R_y_hat = [r_y_hat(L:end), zeros(1, N_fft - 2*L + 2), r_y_hat(L-1:-1:1)];

% Compute estimated PSD
P_y_hat = real(fft(R_y_hat));
P_y_hat = P_y_hat(1:length(omega));

% Theoretical PSD
P_y_theoretical = (sigma_x2 / 2) * (1 + cos(omega));

% Plot
figure;
plot(omega, P_y_theoretical, 'LineWidth', 2);
hold on;
stem(omega, P_y_hat, 'r', 'filled');
xlabel('\omega');
ylabel('PSD');
title('Estimated vs Theoretical PSD of y[n]');
legend('Theoretical PSD', 'Estimated PSD');
grid on;
