clear all;
close all;
f1=10;
f2=11;
fs=80;
N = 80;
n=[0:1:N-1];

theta1=2*pi*f1/fs;
theta2=2*pi*f2/fs;

x1=sin(theta1*n);
x2=sin(theta2*n);

Xk1=fftshift(fft(x1,N));
Xk2=fftshift(fft(x2,N));

theta_fundamental = 2*pi/ N * n;

% Create two subplots for the two signals
figure(1);
stem(n, abs(Xk1));
title('Magnitude of x1');
xlabel('k');
ylabel('|x1[k]|');

figure(2);
stem(n, abs(Xk2));
title('Magnitude of x2');
xlabel('k');
ylabel('|x2[k]|');

