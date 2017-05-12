clc;
clear;

load('current_weight.mat', 'currentWeight');

load('capturedData/[jack]combined_swipe_right_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = ones(noOfInputs, 1);
processedPatternCollection = [processedPatternCollection; bias'];

classification = assessOutput(currentWeight, processedPatternCollection(:, round(50*rand())));

disp(classification);

function actualOutput = assessOutput(weight, input)
    disp(input);
    actualOutput = (2 / (1 + exp(-(weight' * input)))) - 1;
end