theta = -pi:0.001:pi;
A = 1;
K1 = 3.5;
K2 = 0.5;
K3 = 0;
X=A*exp(-i*K3.*theta).*sin(K1*theta)./sin(K2*theta);

plot(theta, abs(X))
xlim([-pi,pi]);
xlabel("\theta [rad]")
ylabel("|X(e^{j\theta})|")