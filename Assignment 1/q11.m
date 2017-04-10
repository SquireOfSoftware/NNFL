% Dichotomiser - Neural Networks
% 1.1 plot the error curve for 10 cycles
clc;
clear;

% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

y = [x1; x2; x3; x4; x5; x6]';
d = [1, -1, 1, -1 , 1, -1];
lambda = 1.5;
cycles = 10;

w = [0.2309, 0.5839, 0.8436, 0.4764, -0.6475]';
inputCounter = 1;
[dRows, dCols] = size(x1');

output = zeros(dRows, cycles);

for index = 1:cycles
    w = variablecorrection(w, lambda, y(:, inputCounter), d(:, inputCounter));
    inputCounter = inputCounter + 1;
    if inputCounter > size(d)
        inputCounter = 1;
    end
    disp(index);
    output(:, index) = w;
end

disp(output);

% 1.2 get error curve, how do w7 and w301 classify the entire training set?
