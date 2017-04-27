
clc;
clear;

seventhWeight = [0.442131840727600;0.636597872834342;0.575441294301345;0.344346399188018;-0.750222787022720];
finalWeight = [1.73253526080533;1.02953015227645;-0.645882485236181;-0.106634592428199;-0.932766308404683];

% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

% each of the augmented vectors are placed into a single vector to churn
% through
y = [x1; x2; x3; x4; x5; x6]';  

% associated outputs
d = [1, -1, 1, -1, 1, -1];

[yRows, yCols] = size(y);

seventhWeightErrors = zeros(1, yCols);
finalWeightErrors = zeros(1, yCols);

for index = 1:yCols
    finalWeightErrors(:, index) = validation(finalWeight, y(:,index), d(:, index));
    seventhWeightErrors(:, index) = validation(seventhWeight, y(:,index), d(:, index));
end

disp(finalWeightErrors);
disp(seventhWeightErrors);

function error = validation(weight, input, expectedValue)
    v = weight' * input;
    z = (2 / (1 + exp(-v))) - 1;
    disp([expectedValue, z]);
    error = expectedValue - z;
end