clear all;
close all;

K = 2;

% Read the original audio file
[y, fsin] = audioread('scale.wav');

% First Output: Original signal
audiowrite('out_down_1.wav', y, fsin);

% Second Output: Downsampled by factor K without filtering
out_down_2 = downsample(y, K);
Fs2 = fsin / K;
audiowrite('out_down_2.wav', out_down_2, Fs2);

% Third Output: Lowpass filter then downsample
fc = fsin / (2*K);
filtered_y = lowpass(y, fc, fsin);

out_down_3 = downsample(filtered_y, K);
audiowrite('out_down_3.wav', out_down_3, Fs2);

% Plotting the FFTs

% First Output FFT
N1 = length(y);
Y1 = fftshift(fft(y));
f1 = linspace(-fsin/2, fsin/2, N1);
figure;
subplot(3,1,1);
plot(f1, abs(Y1));
title('FFT of Original Signal');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

% Second Output FFT
N2 = length(out_down_2);
Y2 = fftshift(fft(out_down_2));
f2 = linspace(-Fs2/2, Fs2/2, N2);
subplot(3,1,2);
plot(f2, abs(Y2));
title('FFT of Downsampled Signal without Filtering');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

% Third Output FFT
Y3 = fftshift(fft(out_down_3));
subplot(3,1,3);
plot(f2, abs(Y3));
title('FFT of Filtered and Downsampled Signal');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
