% divide the data up appropriately
% need to figure out how to normalise the z axis
% 1. locate z axis positions

clc;
clear;

totalSize = 100;

overallTrainingData = zeros(300, 4*totalSize);
overallValidationData = zeros(300, 4*totalSize);
overallTestingData = zeros(300, 4*totalSize);

files = ["capturedData/[joseph-300]combined_swipe_left_data.mat",...
    "capturedData/[joseph-300]combined_swipe_right_data.mat",...
    "capturedData/[joseph-300]combined_swipe_up_data.mat",...
    "capturedData/[joseph-300]combined_swipe_down_data.mat"];
%];
[fRows, fCols] = size(files);

expectedOutputs = generateExpectedOutputs();

for index = 1:fCols
    [trainingData, validationData, testingData] = loadFile(files(:, index));

    % 1, 1 - 100
    % 2, 101 - 200
    % 3, 201 - 300
    % 4, 301 - 400
    startingIndex = 1 + (index - 1) * totalSize;
    endingIndex = index * totalSize;
    
    overallTrainingData(:, startingIndex:endingIndex) = trainingData;
    overallValidationData(:, startingIndex:endingIndex) = validationData;
    overallTestingData(:, startingIndex:endingIndex) = testingData;
    
end

gestureCount = fCols;

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

data_adder;
data_mixer;
data_adjuster;

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
    
    %{
    expectedLeft = [1, 1]';
    expectedRight = [1, -1]';    
    expectedUp = [-1, 1]';
    expectedDown = [-1, -1]';
%}
    
    expectedOutputs = [expectedLeft, expectedRight, expectedUp, expectedDown];
    %expectedOutputs = [expectedLeft, expectedRight];
end