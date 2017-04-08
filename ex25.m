function output = ex25( learningConstant, input, weight, expectedValue )
%EX25 Summary of this function goes here
%   Detailed explanation goes here
    v = weight' * input;
    z = (2 / (1 + exp(-v))) - 1;
    error = expectedValue - z;
    rate = 0.5*(1 - z^2);
    r = error * rate;
    output = weight + learningConstant * r * input;
    disp(weight);

end

