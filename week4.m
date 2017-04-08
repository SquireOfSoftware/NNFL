
weight = [1; -1; 0; 0.5];
input = [1; -2; 0; -1];
learningConstant = 0.1;

error = 10;
loops = 5;

while error ~= 0 && loops > 0
    [weight, error] = runOneLoop(learningConstant, input, weight, -1);
    disp(error);
    loops = loops - 1;
end

function [w2, e] = runOneLoop( c, x, w, d)
%EX25 Summary of this function goes here
%   Detailed explanation goes here
    v = w' * x;
    z = (2 / (1 + exp(-v))) - 1;
    e = d - z;
    rate = 0.5*(1 - z^2);
    r = e * rate;
    w2 = w + c * r * x;
end