load('capturedData/combined_swipe_right_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = repmat(1, 1, noOfInputs);
processedPatternCollection = [processedPatternCollection; bias];

expectedOutputs = repmat(1, 1, noOfInputs);
% swipe right is 2