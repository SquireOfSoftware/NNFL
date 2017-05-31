
clc;
clear;

overallTrainingData = zeros(300, 400);
overallValidationData = zeros(300, 400);
overallTestingData = zeros(300, 400);

files = ["capturedData/combined_swipe_left_data.mat", "capturedData/combined_swipe_right_data.mat", "capturedData/combined_swipe_up_data.mat", "capturedData/combined_swipe_down_data.mat"];

expectedOutputs = generateExpectedOutputs();

for index = 1:4
    [trainingData, validationData, testingData] = loadFile(files(:, index));

    % 1, 1 - 100
    % 2, 101 - 200
    % 3, 201 - 300
    % 4, 301 - 400
    startingIndex = 1 + (index - 1) * 100;
    endingIndex = index * 100;
    
    overallTrainingData(:, startingIndex:endingIndex) = trainingData;
    overallValidationData(:, startingIndex:endingIndex) = validationData;
    overallTestingData(:, startingIndex:endingIndex) = testingData;
    
end

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs');

function [trainingData, validationData, testingData] = loadFile(file)
    load(file);
    
    trainingData = processedPatternCollection(:, 1:100);
    validationData = processedPatternCollection(:, 101:200);
    testingData = processedPatternCollection(:, 201:300);
end

function expectedOutputs = generateExpectedOutputs()
    expectedLeft = [1, -1, -1, -1]';
    expectedRight = [-1, 1, -1, -1]';
    expectedUp = [-1, -1, 1, -1]';
    expectedDown = [-1, -1, -1, 1]';
    
    expectedOutputs = [expectedLeft, expectedRight, expectedUp, expectedDown];
end