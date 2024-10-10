[y,fs] = audioread('audio_sin.wav');

dft = fft(y, 5*length(y));
dft = fftshift(abs(dft));

x = Hd6(y);

dftx = fft(x, 5*length(x));
dftx = fftshift(abs(dftx));

figure
plot(linspace(-fs/2, fs/2, length(y)*5), dft, 'r', 'DisplayName', 'Unfiltered');
hold on;
plot(linspace(-fs/2, fs/2, length(x)*5), dftx, 'b', 'DisplayName', 'Filtered');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend;

player1 = audioplayer(y, fs);
play(player1);
pause(5);
player2 = audioplayer(x, fs);
play(player2);

audiowrite('audio_no_sin.wav', x, fs);
