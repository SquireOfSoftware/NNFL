% goal is to divide the data up unevenly to provide more training data

clc;
clear;

load('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

ratio = 0.5;

[trainRows, trainCols] = size(overallTrainingData);
%[validRows, validCols] = size(overallValidationData);
[testRows, testCols] = size(overallTestingData);

%newOverallTrainingData = zeros(trainRows, trainCols + ratio * validCols, 

%newOverallTrainingData = [overallTrainingData, overallValidationData(:, validCols * ratio + 1:validCols), overallTestingData(:, testCols * ratio + 1:testCols)];
newOverallTrainingData = [overallTrainingData, overallTestingData(:, testCols * ratio + 1:testCols)];

%newOverallValidationData = overallValidationData(:, 1:validCols * ratio);
newOverallTestingData = overallTestingData(:, 1:testCols * ratio);

overallTrainingData = newOverallTrainingData;
%overallValidationData = newOverallValidationData;
overallTestingData = newOverallTestingData;

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');
