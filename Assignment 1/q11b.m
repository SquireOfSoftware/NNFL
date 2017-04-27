clc;
clear;

finalWeight = [0.4886, 0.7749, 0.2812, 0.1329, -0.7129]';

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

[cycleError, patternError] = validation(finalWeight, inputs, outputs);

function [output, patternError] = validation(finalWeight, inputs, outputs)
    % for each weight, calculate error from inputs
    patternError = zeros(1, 10);
    patternIndex = 1;
    sumErrors = 0;
    for inputIndex = 1:6
        currentError = calculateVariation(outputs(:,inputIndex),...
            finalWeight,...
            inputs(:,inputIndex));
        sumErrors = sumErrors + currentError;
        patternError(:, patternIndex) = currentError;
        patternIndex = patternIndex + 1;
        disp(["inputIndex",inputIndex, currentError]);
        disp(inputs(:,inputIndex)');
    end

    output = sumErrors;
end

function error = calculateVariation(expectedOutput, weight, input)
    actualOutput = sign(weight' * input);
    error = 0.5*(expectedOutput - actualOutput)^2;
end