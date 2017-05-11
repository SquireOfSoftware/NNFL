load('capturedData/combined_swipe_right_data.mat', 'processedPatternCollection', 'rawPatternCollection');

[noOfInputs, pMax] = size(processedPatternCollection);
bias = ones(noOfInputs, 1);
processedPatternCollection = [processedPatternCollection; bias'];

expectedOutputs = repmat(2, 1, noOfInputs);
% swipe right is 2