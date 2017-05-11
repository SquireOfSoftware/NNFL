function [resultingWeight, weightEvolution, recordedErrors] = run_neural_network(inputs, expectedOutputs, weight, loops)
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
    plot(recordedErrors(2, :));
    resultingWeight = weight;
end

function [outputWeight, loopError] = runOneLoop(inputWeight, lambda, input, expectedOutput)
    loopError = measureAccuracy(inputWeight, input, expectedOutput);
    correctionIncrement = abs(inputWeight' * input) / (input' * input);
    outputWeight = inputWeight + 0.5 * lambda * correctionIncrement * loopError * input;
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