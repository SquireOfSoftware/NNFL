
function [cycleError] = validate_with_external_data(w, wBar, file, loops)
    load(file, 'processedPatternCollection', 'rawPatternCollection');

    [noOfInputs, ~] = size(processedPatternCollection);
    bias = ones(noOfInputs, 1);
    processedPatternCollection = [processedPatternCollection; bias'];
    
    expectedOutput = [-1, 1, -1, -1]';

    recordedErrors = zeros(4, loops); % you want to sum this up right?
    
    cycleError = zeros(4, 1);

    for index = 1:loops
        recordedErrors(:, index) = measureAccuracy(w, wBar, processedPatternCollection(:,index), expectedOutput);
        cycleError = cycleError + recordedErrors(:, index);
    end
    
    cycleError = cycleError / 50;
end

function [loopError] = measureAccuracy(w, wBar, input, expectedOutput)
    % run this through a bipolar function
    bias = -1;
    %disp([size(wBar), size(input)]);
    actualOutput = (2 / (1 + exp(-(wBar * input)))) - 1;
    %disp(actualOutput);
    actualOutput(:, 5) = bias;
    %disp([size(w), size(actualOutput)]);
    %disp(w * actualOutput');
    finalOutput = (2 / (1 + exp(-(w * actualOutput')))) - 1;
    %disp(finalOutput');
    loopError = expectedOutput - finalOutput';
    %disp(loopError);
end