% exercise 3.2
% look at this for a helpful guide

% steps
% 1. run foward as normal, calculate inputs into first layer
% 2. use first layer as "inputs" for second layer + bias value
% 3. continue until you hit the end
% 4. then go backwards to adjust weights using outputs as inputs to last
% layer
% 5. keep going until you reach the first layer

clc;
clear;

x1 = [0; 0];
x2 = [0; 1];
x3 = [1; 1];
x4 = [1; 0];

d = [-1, 1, -1, 1];

bias = -1;

y = [x1, x2, x3, x4];
y(3, :) = bias;

% w is the weights for the outputs
w = [-0.8568, 0.3998, -1.0702];
% wBar is the weights for the inputs
wBar = [-6.9938, 6.6736, 1.555; -4.2812, 3.9127, 3.6233];

% nuConstant
n = 0.1;

inputIndex = 1;
for index = 1:250
    % inputs multiplied weight bars
    activationVector1 =  wBar * y(:, inputIndex);

    % activation outputs from the activation functions per element
    layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);

    % then run layer 1 as inputs to the next layer
    % add bias to layer 1
    layer1(3, :) = bias;

    activationVector2 = w * layer1;

    layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);

    % AKA delta
    layer2Delta = (d(:, inputIndex) - layer2) * ...
        bipolarDifferentialFunction(activationVector2);

    % AKA deltaBar
    disp(size(arrayfun(@bipolarDifferentialFunction, activationVector1)));
    disp(size(layer2Delta * w));
    layer1Differentials = arrayfun(@bipolarDifferentialFunction, activationVector1);
    layer1Delta = zeros(2, 1);
    for counter = 1:2
        % using previous layer's weights and discarding the last weight
        % for the bias
        layer1Delta(counter, :) = layer2Delta * w(:, counter) * layer1Differentials(counter, :);
    end
    
    disp("layer1Delta");
    disp(layer1Delta);
    
    w = w + n * layer2Delta * layer1';

    wBar = wBar + n * layer1Delta * y(:, inputIndex)';
    
    disp("w");
    disp(w);
    disp("wBar");
    disp(wBar);

    inputIndex = inputIndex + 1;
    if inputIndex > 4
        inputIndex = 1;
    end
end

function output = bipolarLogisticFunction(v)
    output = 2 / (1 + exp(-v)) - 1;
    %output = (1 - exp(-v)) / (1 + exp(-v));
end

function output = bipolarDifferentialFunction(v)
    output = 0.5 * (1 - (bipolarLogisticFunction(v))^2);
end