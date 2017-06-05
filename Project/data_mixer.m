% mix the inputs up, so it is left, right, up then down and repeat this 100
% times
clc;
clear;

load('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');
%overallTrainingData = ['hello', 'world', 'this', 'is', 'a', 'test'];
%overallTestingData = ['dizzy', 'the', 'dog!', 'The', 'enemy encountered', 'mammal'];

% assuming there is 400 entries, with 100 of each gesture
% also assumes that there is the correct number of inputs

% 1, 5, 9, 13, 17
% 2, 6, 10, 14, 18
% 3, 7, 11, 15, 19
% 4, 8, 12, 16, 20

[dRows, dCols] = size(overallTrainingData);

cleanedUpTrainingData = zeros(dRows, dCols);
cleanedUpTestingData = zeros(dRows, dCols);
cleanedUpValidationData = zeros(dRows, dCols);

inputCounter = 1;
% select column, for first 100, separate out into groups of 4
for index = 1:100
    % try this, for every entry, enter it sideways?
    cleanedUPTrainingData(:, inputCounter) = overallTrainingData(:, index);
    cleanedUpTestingData(:, inputCounter) = overallTestingData(:, index);
    cleanedUpValidationData(:, inputCounter) = overallValidationData(:, index);
    
    inputCounter = inputCounter + gestureCount;
end

inputCounter = 2;
if inputCounter <= gestureCount
    for index = 101:200
        cleanedUPTrainingData(:, inputCounter) = overallTrainingData(:, index);
        cleanedUpTestingData(:, inputCounter) = overallTestingData(:, index);
        cleanedUpValidationData(:, inputCounter) = overallValidationData(:, index);

        inputCounter = inputCounter + gestureCount;
    end
end

inputCounter = 3;
if inputCounter <= gestureCount
    for index = 201:300
        cleanedUPTrainingData(:, inputCounter) = overallTrainingData(:, index);
        cleanedUpTestingData(:, inputCounter) = overallTestingData(:, index);
        cleanedUpValidationData(:, inputCounter) = overallValidationData(:, index);

        inputCounter = inputCounter + gestureCount;
    end
end

inputCounter = 4;
if inputCounter <= gestureCount
    for index = 301:400
        cleanedUPTrainingData(:, inputCounter) = overallTrainingData(:, index);
        cleanedUpTestingData(:, inputCounter) = overallTestingData(:, index);
        cleanedUpValidationData(:, inputCounter) = overallValidationData(:, index);

        inputCounter = inputCounter + gestureCount;
    end
end

overallTrainingData = cleanedUPTrainingData;
overallValidationData = cleanedUpValidationData;
overallTestingData = cleanedUpTestingData;

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');
