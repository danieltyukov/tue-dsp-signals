function r = crosscor(x, y, l)
    M = length(x);
    if length(y) ~= M
        error('Input signals x and y must have the same length.');
    end

    if l >= 0
        r = sum(x(1:M - l) .* y(1 + l:M)) / M;
    else
        l = abs(l);
        r = sum(x(1 + l:M) .* y(1:M - l)) / M;
    end
end