% exercise 3.2

clc;
clear;

x1 = [0; 0];
x2 = [0; 1];
x3 = [1; 0];
x4 = [1; 1];

d = [-1, 1, -1, 1];

y = [x1, x2, x3, x4];
y(3, :) = -1;

w = [-0.8568, 0.3998, -1.0702];

wBar = [-6.9938, 6.6736, 1.555; -4.2812, 3.9127, 3.6233];

runDeepLearning(y, d, 0.1, w, wBar, 5);

function output = runDeepLearning(augmentedInputs, expectedOutputs, nuConstant, weight, weightBar, cycles)
    inputCounter = 1;

    for index = 1:cycles
        disp(size(weight));
        disp(size(augmentedInputs));
        activationVector =  weight * augmentedInputs; %augmentedInputs(:, inputCounter) * weight;
        delta = calculateDelta(expectedOutputs(:, inputCounter), bipolarLogistic(activationVector), bipolarLogisticDifferential(activationVector));
        disp(["delta", delta]);
        
        deltaBar = calculateDeltaBar(bipolarLogisticDifferential(activationVector), delta, weight);
        disp(["deltaBar", deltaBar]);
        
        weight = weight + nuConstant * delta * augmentedInputs';
        weightBar = weightBar + nuConstant * deltaBar * augmentedInputs';
        inputCounter = inputCounter + 1;
        
        if (inputCounter > 4)
            inputCounter = 1;
        end
    end
end

function output = calculateDelta(expectedOutput, activationValue, activationDifferential)
    output = (expectedOutput - activationValue) * activationDifferential;
end

function output = calculateDeltaBar(activationDifferential, delta, weights)
    
    output = activationDifferential * delta * weights;
end

function output = bipolarLogistic(v)
    v = sum(v);
    output = (2/(1 + exp(-v)) - 1);
end

function output = bipolarLogisticDifferential(v)
    output = 0.5 * (1 - ((2/(1 + exp(-v)) - 1)^2));
end