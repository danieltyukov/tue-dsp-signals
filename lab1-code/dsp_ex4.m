clear all;
close all;
clc;

x = -pi:0.001:pi;
H = (1 - cos(x));
mag_H = abs(H);
phase_H = angle(H);

figure;
subplot(2,1,1);
plot(x, mag_H);
ylim([-0, 2]);
xlim([-pi, pi]);
title("Assignment 4B Magnitude");
xlabel("\Theta [rad/s]");
ylabel("|H(e^{i\Theta})|");

subplot(2,1,2);
plot(x, phase_H);
ylim([-pi, pi]);
xlim([-pi, pi]);
title("Assignment 4B Phase");
xlabel("\Theta [rad/s]");
ylabel("\angle(H(e^{i\Theta}))");

% Save the figure as a PNG image
exportgraphics(gcf, 'C:\Users\20221153\Documents\dsp pics/Assignment4_Figure.png', 'Resolution', 300);

% Alternative way to save using saveas
% saveas(gcf, 'Assignment4B_Figure.png');

