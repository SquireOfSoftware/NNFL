load('capturedData/combined_swipe_down_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = repmat(-1, 1, noOfInputs);
processedPatternCollection = [processedPatternCollection; bias];

expectedOutputs = repmat(-1, 1, noOfInputs);
% swipe down is 1