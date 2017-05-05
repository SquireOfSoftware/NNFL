% this files seeks to combine various things together into a single vector
% file
clc;
clear;

%load('raw_data.mat');
load('capturedData/hand_down.mat');

%processedPatternCollection = zeros(300, 300);
%patternIndex = 1;

if exist('combined_data.mat', 'file')
    load('combined_data.mat');
end

if ~exist('processedPatternCollection', 'var')
    processedPatternCollection = zeros(300, 300);
end

cleanedUpRecording = cleanUp(processedRecording);

if exist('patternIndex', 'var')
    [processedPatternCollection, patternIndex] = add(cleanedUpRecording, processedPatternCollection, patternIndex);
else
    [processedPatternCollection, patternIndex] = add(cleanedUpRecording, processedPatternCollection, 1);
end
save('combined_data.mat', 'processedPatternCollection', 'patternIndex');

function [patternCollection, pIndex] = add(recording, patternCollection, pIndex)
    if pIndex <= 300
        patternCollection(:, pIndex) = recording;
        pIndex = pIndex + 1;
    else
        disp('Current file has reached 300 recordings');
    end
end

function output = cleanUp(recording)
    [dRows, dCols] = size(recording);
    output = zeros(dRows * dCols, 1);
    %output = ones(dRows * dCols, 1);
    outputIndex = 1;
    for rowIndex = 1:dRows
        disp([outputIndex, outputIndex + dCols - 1, dRows]);
        output(outputIndex: outputIndex + dCols - 1) = recording(rowIndex, :);
        outputIndex = outputIndex + dCols;
    end
end