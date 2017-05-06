% this files seeks to combine various things together into a single vector
% file
clc;
clear;

load('raw_data.mat');
%load('capturedData/hand_down.mat');

disp("Loading up the data");

if exist('combined_data.mat', 'file')
    load('combined_data.mat');
end

if ~exist('processedPatternCollection', 'var')
    processedPatternCollection = zeros(300, 300);
end

if ~exist('rawPatternCollection', 'var')
    rawPatternCollection = repmat(struct('id',0,'timestamp',0,'pointables',{},'hands',{}), 20 * 300);
end

disp("Cleaning the processed data");

cleanedUpRecording = cleanUp(processedRecording);

if ~exist('patternIndex', 'var')
    patternIndex = 1;
end

disp("Combining the data");

rawPatternCollection = addRawPattern(rawRecording, rawPatternCollection, patternIndex);
[processedPatternCollection] = addProcessedPattern(cleanedUpRecording, processedPatternCollection, patternIndex);
patternIndex = patternIndex + 1;

save('combined_data.mat', 'processedPatternCollection', 'rawPatternCollection', 'patternIndex');

disp("Finished combining the data");

function [rawPatternCollection] = addRawPattern(recording, rawPatternCollection, pIndex)
    if pIndex <= 300
        rawPatternCollection = [rawPatternCollection, recording];
    else
        disp('Current file has reached 300 raw recordings');
    end
end

function [patternCollection] = addProcessedPattern(recording, patternCollection, pIndex)
    if pIndex <= 300
        patternCollection(:, pIndex) = recording;
    else
        disp('Current file has reached 300 processed recordings');
    end
end

function output = cleanUp(recording)
    [dRows, dCols] = size(recording);
    output = zeros(dRows * dCols, 1);
    %output = ones(dRows * dCols, 1);
    outputIndex = 1;
    for rowIndex = 1:dRows
        % I have this backwards, but I have the processed data already
        output(outputIndex: outputIndex + dCols - 1) = recording(rowIndex, :);
        % should be
        % output(outputIndex: outputIndex + dCols - 1) = recording(:, rowIndex);
        outputIndex = outputIndex + dCols;
    end
end