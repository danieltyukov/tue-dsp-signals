clear all;
close all;

K = 2;

% Read the original audio file
[y, fsin] = audioread('scale.wav');

% First Output: Original signal
audiowrite('out_up_1.wav', y, fsin);

% Second Output: Upsampled by factor K without filtering
out_up_2 = upsample(y, K);
Fs2 = fsin * K;
audiowrite('out_up_2.wav', out_up_2, Fs2);

% Third Output: Upsample then lowpass filter
out_up_3 = upsample(y, K);
fc = fsin / 2;
filtered_up3 = lowpass(out_up_3, fc, Fs2);
audiowrite('out_up_3.wav', filtered_up3, Fs2);

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
N2 = length(out_up_2);
Y2 = fftshift(fft(out_up_2));
f2 = linspace(-Fs2/2, Fs2/2, N2);
subplot(3,1,2);
plot(f2, abs(Y2));
title('FFT of Upsampled Signal without Filtering');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');

% Third Output FFT
Y3 = fftshift(fft(filtered_up3));
subplot(3,1,3);
plot(f2, abs(Y3));
title('FFT of Upsampled and Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
