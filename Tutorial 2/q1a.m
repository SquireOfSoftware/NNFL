% borrowed from example 3.10 with tutorial reference
clc;
clear;

x1 = [1, 1, 1, 1, 1, -1, -1, 1, 1, 1, 1, 1, 1, -1, -1, 1]';
x2 = [-1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1]';
x3 = [1, 1, 1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, 1, 1, 1]';

d1 = [1, -1, -1]';
d2 = [-1, 1, -1]';
d3 = [-1, -1, 1]';

w = [-0.312400000000000,0.658500000000000,0.286000000000000,-0.466800000000000;0.0834000000000000,-0.970100000000000,0.0923000000000000,0.940200000000000;0.0456000000000000,-0.451600000000000,0.835700000000000,-0.506500000000000];
wBar = [0.688000000000000,0.634200000000000,0.413900000000000,0.164800000000000,0.391400000000000,-0.657600000000000,-0.840200000000000,0.566000000000000,-0.987300000000000,-0.866300000000000,-0.568300000000000,0.318100000000000,-0.439400000000000,0.372200000000000,-0.792400000000000,-0.558600000000000,-0.679500000000000;0.388000000000000,-0.955800000000000,0.415700000000000,0.503400000000000,-0.441000000000000,-0.991500000000000,-0.673800000000000,0.493400000000000,0.169600000000000,0.0880000000000000,-0.228500000000000,0.418600000000000,0.631900000000000,-0.379700000000000,0.0419000000000000,-0.889400000000000,0.447500000000000;-0.0885000000000000,-0.678500000000000,-0.126700000000000,0.983100000000000,0.507700000000000,-0.00860000000000000,0.806600000000000,-0.127100000000000,0.0370000000000000,-0.220500000000000,0.253700000000000,0.0773000000000000,-0.256200000000000,-0.981300000000000,0.551800000000000,-0.858700000000000,-0.406000000000000];

bias = -1;
steps = 1;
inputCounter = 1;

n = 0.8;

X = [x1, x2, x3];
X(17, :) = bias;

D = [d1, d2, d3];

for index = 1:steps
    % start feedforward
    activationVector1 = wBar * X(:, inputCounter);
    
    layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);
    [v1Row, ~] = size(activationVector1);
    
    layer1(v1Row + 1, :) = bias;
    
    activationVector2 = w * layer1;
    
    layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);
    disp(layer2);
    % feedfoward has finished, start back propagation
    patternError = (D(:, inputCounter) - layer2);
    layer2Differentials = arrayfun(@bipolarDifferentialFunction, activationVector2);
    layer2Delta = patternError .* arrayfun(@bipolarDifferentialFunction, activationVector2);
    % make sure you multiply each element by their respective differential
    % values
    
    layer1Differentials = arrayfun(@bipolarDifferentialFunction, activationVector1);
    
    [~, wCols] = size(w);
    
    layer1Delta = zeros(wCols - 1, 1);
    for rowCounter = 1:wCols - 1 % do not include the bias weight
        layer1Delta(rowCounter,1) = layer2Delta(:,1)'*w(:,rowCounter);
    end
    preDifferentialLayer1Delta = layer1Delta;
    layer1Delta = layer1Differentials .* layer1Delta;
    
    % update the weights
    %w = w + n * layer2Delta * layer1';
    %wBar = wBar + n * layer1Delta * X(:,inputCounter)'; % this is correct
    
    inputCounter = inputCounter + 1;
    
    [~, dCols] = size(D);
    
    if inputCounter > dCols
        inputCounter = 1;
    end
end

function output = bipolarLogisticFunction(v)
    output = (2 / (1 + exp(-v))) - 1;
end

function output = bipolarDifferentialFunction(v)
    output = 0.5 * (1 - (bipolarLogisticFunction(v))^2);
end