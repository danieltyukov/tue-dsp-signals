% Assignment 6: Frequency plots of LPF
N_values = [7, 15, 111];

for idx = 1:length(N_values)
    N = N_values(idx);
    n = -(N-1)/2 : (N-1)/2;
    h = 0.5 * sinc(n / 2);
    w = ones(1, N);
    h_windowed = h .* w;
    
    % The filter is made causal by considering h[n] for n = 0 to N-1
    h_causal = h_windowed;
    
    figure;
    freqz(h_causal, 1, 1024);
    title(['Frequency Response for N = ', num2str(N)]);
end
