clc;
clear;

load('current_weight.mat', 'currentWeight');
load('capturedData/[jack]combined_hand_down_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = ones(noOfInputs, 1);
processedPatternCollection = [processedPatternCollection; bias'];

expectedOutputs = repmat(1, 1, noOfInputs);

evolutionOfErrors = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

plot(evolutionOfErrors);

function [recordedErrors] = run_neural_network(inputs, expectedOutputs, weight, loops)
    recordedErrors = zeros(1, loops);

    for index = 1:loops
        recordedErrors(1, index) = measureAccuracy(weight, inputs(:,index), expectedOutputs(:,index));
    end
end

function [loopError] = measureAccuracy(weight, input, expectedOutput)
    % run this through a bipolar function
    actualOutput = (2 / (1 + exp(-(weight' * input)))) - 1;
    %disp(["actualOutput", actualOutput]);
    loopError = expectedOutput - actualOutput;
end