
weight = [0, 1, 0]';
input = [2, 1, -1; 0, -1, -1]';
expectedOutput = [-1; 1];
learningConstant = 1;

error = 10;
loops = 2;
index = 1;

%disp([input]);

while error ~= 0 && loops > 0
    [weight, error] = runOneLoop(learningConstant, input(:, index), weight, expectedOutput(index, 1));
    if mod(index, 2) == 0
        index = index - 1;
    else 
        index = index + 1;
    end
    disp([loops, index, error]);
    disp(weight);
    loops = loops - 1;
end

function [w2, e] = runOneLoop( c, x, w, d)
%EX25 Summary of this function goes here
%   Detailed explanation goes here
    disp(["x", size(x), "w", size(w')]);
    v = w' * x;
    z = (2 / (1 + exp(-v))) - 1;
    e = d - z;
    rate = 0.5*(1 - z^2);
    r = e * rate;
    w2 = w + c * r * x;
end