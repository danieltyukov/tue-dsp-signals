clear all;
close all;
theta=[-pi:0.001:pi];

A=1;
K1=3.5;
K2=0.5;
K3=0;

X=sin(K1*theta)./sin(K2*theta);

K = 7;
R = 9;
i = K/(K+R);
theta_fundamental = 2*pi/ (K + R) * [0:16];

plot(theta,abs(X));
xlabel("\theta [rad]")
ylabel("|X(e^{j\theta})|")
hold on

Xk = fftshift(fft(X,K+R));
plot(1: 16, abs(Xk));
