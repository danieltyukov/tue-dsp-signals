clear all;
close all;
clc;

x = -pi:0.001:pi;
H = exp(1).^(-i*x).*(1 - cos(x));
mag_H = abs(H);
phase_H = angle(H);

figure;
subplot(2,1,1);
plot(x,mag_H);
ylim([-0, 2]);
xlim([-pi, pi]);
title("Assignment 5B Magnitude");
xlabel("\Theta [rad/s]");
ylabel("|H(e^{i\Theta})|");

subplot(2,1,2);
plot(x, phase_H);
ylim([-pi, pi]);
xlim([-pi, pi]);
title("Assignment 5B Phase");
xlabel("\Theta [rad/s]");
ylabel("\angle(H(e^{i\Theta}))");

exportgraphics(gcf, 'C:\Users\20221153\Documents\dsp pics/Assignment5B_Figure.png', 'Resolution', 300);


