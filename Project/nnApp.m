% for the matlab neural network app

load('[1000-train-1000-valid-600-test-joseph-jack-daniel]split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount');

inputs = [overallTrainingData, overallValidationData, overallTestingData];

[~, iCols] = size(inputs);

outputs = zeros(4, iCols);

for index = 1:4:iCols - 4
    outputs(:, index:index + 3) = expectedOutputs(:, :);
end

save('nnAppData.mat', 'inputs', 'outputs');