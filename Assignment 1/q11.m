clc;
clear;

% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

% each of the augmented vectors are placed into a single vector to churn
% through
y = [x1; x2; x3; x4; x5; x6]';  

% associated outputs
d = [1, -1, 1, -1, 1, -1];

% given lambda
lambda = 1.5;

% given cycles
cycles = 10;

% starting weight
w = [0.2309, 0.5839, 0.8436, 0.4764, -0.6475]';

% a counter for the cycles to be measure against
inputCounter = 1;

% setting up the output matrix
[dRows, dCols] = size(x1');
output = zeros(dRows, cycles);

cycleErrors = zeros(1, (cycles - mod(cycles, 6))/6 * 2);
cycleErrorIndex = 1;

for index = 1:cycles
    output(:, index) = w;
    %cycleErrors(:, index) = d(:, inputCounter) - sign(w' * y(:, inputCounter));
    [w, cycleError] = variablecorrection(w, lambda, y(:, inputCounter), d(:, inputCounter));
    cycleErrors(:, cycleErrorIndex) = cycleErrors(:, cycleErrorIndex) + (cycleError)^2;
    inputCounter = inputCounter + 1;
    if inputCounter > size(d)
        inputCounter = 1;
        cycleErrorIndex = cycleErrorIndex + 1;
    end
end

disp(output);
disp(cycleErrors);

% weight correction formula given
function [output, error] = variablecorrection(w, lambda, y, d)
    error = (d - sign(w' * y));
    output = w + 0.5 * (lambda * abs(w' * y) / (y' * y))...
        * error * y;
end

