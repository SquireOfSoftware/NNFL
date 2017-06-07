% adjust the weights and scale everything down
clc;
clear;

load('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');

% scale factor
scale = 300;
axisConstraints = 75;

% x = 1:20, 61:80, 121:140, 181:200, 241:260, 301:320
% z = 21:40, 81:100, 141:160, 201:220, 261:280, 321:340, 381:
% y = 41:60, 101:120, 161:180, 221:240, 281:300, 361:380

for index = 21:60:261
    %disp([index, index + 19]);
    overallTrainingData(index:index + 19, :) = overallTrainingData(index:index + 19, :) - scale;
    overallValidationData(index:index + 19, :) = overallValidationData(index:index + 19, :) - scale;
    overallTestingData(index:index + 19, :) = overallTestingData(index:index + 19, :) - scale;
end

overallTrainingData = overallTrainingData / axisConstraints;
overallValidationData = overallValidationData / axisConstraints;
overallTestingData = overallTestingData / axisConstraints;

save('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount', 'totalSize');