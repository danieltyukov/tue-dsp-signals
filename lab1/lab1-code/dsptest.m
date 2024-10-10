clear all;
close all;
clc;

x = [1,-0.5,1,-0.5,1];
h = [1/2,1,3/2];

y = conv(x,h);

stem(-4:1:4, [0,y,0], 'filled');
title('Assignment 3B. Causal Convolution');
xlabel('n');
ylabel('y[n]');
ylim([0,2])
grid on;

s = tf('s');
G = s;
