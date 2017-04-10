function output = variablecorrection(w, lambda, y, d)
    output = w + 0.5 * (lambda * abs(w' * y) / (y' * y))...
        * (d - sign(w' * y)) * y;
end