% assume data is loaded before, this code takes about 2 minutes to run
clc;
clear;
generate_swipe_left_data;

% inputs 

% expected weights for each neuron
% this is the thing that is learning
% should be 301 input neurons with 3 hidden neurons then 4 output neurons

load_current_weight_data;

bias = -1;
steps = 300;

%w(:, 5) = bias;
%wBar(:, 301) = bias;

% learning constant
n = 0.8;

% combined inputs with bias
X = processedPatternCollection;

% combined outputs
D = expectedOutput;
classifications = zeros(4, steps);
inputCounter = 1;

lastStepError = zeros(4, 1);

for index = 1:steps
    % start feedforward
    activationVector1 = wBar * X(:, inputCounter);

    layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);
    [v1Row, ~] = size(activationVector1);

    layer1(v1Row + 1, :) = bias;

    activationVector2 = w * layer1;

    layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);
    classifications(:, index) = layer2;

    % feedfoward has finished, start back propagation
    patternError = D - layer2;
    layer2Delta = patternError .* arrayfun(@bipolarDifferentialFunction, activationVector2);
    % make sure you multiply each element by their respective differential
    % values

    layer1Differentials = arrayfun(@bipolarDifferentialFunction, activationVector1);

    [~, wCols] = size(w);

    layer1Delta = zeros(wCols - 1, 1);
    for rowCounter = 1:wCols - 1 % do not include the bias weight
        layer1Delta(rowCounter,1) = layer2Delta(:,1)'*w(:,rowCounter);
    end
    layer1Delta = layer1Differentials .* layer1Delta;

    % update the weights
    uw = w + n * layer2Delta * layer1';
    uwBar = wBar + n * layer1Delta * X(:,inputCounter)'; % this is correct
%{
    [stepError] = validate_with_external_data(uw, uwBar, 'capturedData/[jack-50]combined_swipe_left_data.mat', 50);
    
    %disp(["stepError", "lastStepError"; stepError, lastStepError]);

    if (stepError > lastStepError)
        break; % break the loop
    end
    
    lastStepError = stepError;
%}
    w = uw;
    wBar = uwBar;

    inputCounter = inputCounter + 1;

    [~, dCols] = size(D);

    if inputCounter > dCols
        inputCounter = 1;
    end
end

save_current_weight_data;

function output = bipolarLogisticFunction(v)
    output = (2 / (1 + exp(-v))) - 1;
end

function output = bipolarDifferentialFunction(v)
    output = 0.5 * (1 - (bipolarLogisticFunction(v))^2);
end
