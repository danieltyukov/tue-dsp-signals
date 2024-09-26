function [x_a, t, n] = sincinterpolation(x, start_ind, T_s)
    t = T_s * ((start_ind - 1):0.001:(start_ind + length(x)));
    
    n = start_ind:(start_ind + length(x) - 1);
    
    x_a = zeros(size(t));
    
    for k = 1:length(x)
        sinc_arg = (t / T_s) - n(k);
        x_a = x_a + x(k) * sinc(sinc_arg);
    end
end
