% adding extra data

clc;
clear;

files = ["capturedData/[jack-50]combined_swipe_left_data.mat",...
    "capturedData/[jack-50]combined_swipe_right_data.mat",...
    "capturedData/[jack-50]combined_swipe_up_data.mat",...
    "capturedData/[jack-50]combined_swipe_down_data.mat"];
%];
[fRows, fCols] = size(files);

load('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

[~, tCols] = size(overallTrainingData);

for fileCount = 1:fCols
    switch fileCount
        case 1
            tDataCount = tCols + 1;
        case 2
            tDataCount = tCols + 2;
        case 3
            tDataCount = tCols + 3;
        case 4
            tDataCount = tCols + 4;
    end
    
    load(files(:, fileCount));
    disp(files(:, fileCount));
    
    for index = 1:50
        overallTrainingData(:, tDataCount) = processedPatternCollection(:, index);
        tDataCount = tDataCount + 4;
    end
end

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');
