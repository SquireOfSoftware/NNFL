clc;
clear;

finalWeight = [0.4886, 0.7749, 0.2812, 0.1329, -0.7129];

% copied from q11
% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

% each of the augmented vectors are placed into a single vector to churn
% through
inputs = [x1; x2; x3; x4; x5; x6]';  

% associated outputs
outputs = [1, -1, 1, -1, 1, -1];

patternErrors = validation(inputs, outputs, finalWeight);

disp(patternErrors);

function validation(inputs, outputs, weight)
    [~, iCols] = size(inputs);
    patternErrors = zeros(1, iCols);
    for index = 1:iCols
        error = calculateVariation(outputs(:, index), weight, inputs(:, index));
        patternErrors(:, index) = error;
    end
end

function error = calculateVariation(expectedOutput, weight, input)
    actualOutput = sign(weight * input);
    
    error = (expectedOutput - actualOutput);
end