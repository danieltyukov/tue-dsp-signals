clear all;

theta=[-pi:0.001:pi];

A=1;
K1=3.5;
K2=0.5;
K3=0;

X=sin(K1*theta)./sin(K2*theta);

N = 16;

theta_fundamental = 2*pi/ N * [-3:3];

plot(theta,abs(X));
xlabel("\theta [rad]")
ylabel("|X(e^{j\theta})|")
hold on

Xk=fftshift(fft(X,N));
stem(theta_fundamental, abs(Xk));
