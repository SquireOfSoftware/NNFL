clc;
clear;

load('current_weight.mat', 'currentWeight');

load('capturedData/[jack]combined_swipe_right_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = ones(noOfInputs, 1);
processedPatternCollection = [processedPatternCollection; bias'];

for index = 1:50
    classification = assessOutput(currentWeight, processedPatternCollection(:, index));
    disp(classification);
end

function actualOutput = assessOutput(weight, input)
    %disp(input);
    actualOutput = (2 / (1 + exp(-(weight' * input)))) - 1;
end