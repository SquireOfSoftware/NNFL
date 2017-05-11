% neural network code

clc;
clear;

load('capturedData/combined_swipe_down_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = ones(noOfInputs, 1);
processedPatternCollection = [processedPatternCollection; bias'];

expectedOutputs = repmat(1, 1, noOfInputs);
% swipe down is 1

if exist('current_weight.mat', 'file')
    load('current_weight.mat', 'currentWeight');
    oldCurrentWeight = currentWeight;
else
    % interestingly all ones do nothing
    %weight1 = zeros(noOfInputs + 1, 1);
    currentWeight = processedPatternCollection(1, :)';
    currentWeight = [currentWeight; 1];
end

[evolutionOfWeights, evolutionOfErrors] = run_neural_network(processedPatternCollection, expectedOutputs, currentWeight, pMax);

plot(evolutionOfErrors(2, :));
%plot(evolutionOfErrors);

disp(abs(currentWeight - oldCurrentWeight));

save('current_weight.mat', 'currentWeight');

function [weightEvolution, recordedErrors] = run_neural_network(inputs, expectedOutputs, weight, loops)
    lambda = 0.25;
    weightEvolution = zeros(301, loops);
    recordedErrors = zeros(1, loops);

    for index = 1:loops
        weightEvolution(:, index) = weight;
        [weight, growthError] = runOneLoop(weight, lambda, inputs(:,index), expectedOutputs(:,index));
        recordedErrors(1, index) = growthError;
        
        patternErrors = validatePatterns(weight, inputs, expectedOutputs);
        recordedErrors(2, index) = patternErrors / 2;
        
        %recordedErrors(3, index) = (patternErrors ^ 2) / 2;
    end
    
end

function [outputWeight, loopError] = runOneLoop(inputWeight, lambda, input, expectedOutput)
    %v = inputWeight' * input;
    %disp(["v", v]);
    % run this through a bipolar function
    %actualOutput = (2 / (1 + exp(-v))) - 1;
    %disp(["actualOutput", actualOutput]);
    %loopError = expectedOuput - actualOutput;
    
    loopError = measureAccuracy(inputWeight, input, expectedOutput);
    
    %disp(["loopError", loopError]);
    correctionIncrement = abs(inputWeight' * input) / (input' * input);
    %disp(correctionIncrement);
    outputWeight = inputWeight + 0.5 * lambda * correctionIncrement * loopError * input;
    %disp(outputWeight);
end

function [loopError] = measureAccuracy(weight, input, expectedOutput)
    % run this through a bipolar function
    actualOutput = (2 / (1 + exp(-(weight' * input)))) - 1;
    %disp(["actualOutput", actualOutput]);
    loopError = expectedOutput - actualOutput;
end

function patternErrors = validatePatterns(weight, inputs, expectedOutputs)
    % for each recording of a pattern
    [~, iCols] = size(inputs);
    patternErrors = 0;
    
    for index = 1:iCols
        patternErrors = patternErrors + (measureAccuracy(weight, inputs(:, index), expectedOutputs(:, index))) ^ 2;
    end
end