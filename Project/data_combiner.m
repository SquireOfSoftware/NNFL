load('capturedData/[400-train-400-valid-400-test-daniel]split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

oldOverallTrainingData = overallTrainingData;
oldOverallValidationData = overallValidationData;
oldOverallTestingData = overallTestingData;

load('capturedData/[1000-train-200-valid-200-test-joseph-jack]split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

newOverallTrainingData = [overallTrainingData, oldOverallTrainingData];
newOverallValidationData = [overallValidationData, oldOverallValidationData];
newOverallTestingData = [overallTestingData, oldOverallTestingData];

overallTrainingData = newOverallTrainingData;
overallValidationData = newOverallValidationData;
overallTestingData = newOverallValidationData;

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');
