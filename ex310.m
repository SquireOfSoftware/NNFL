% example 3.10 with tutorial reference
clc;
clear;

x1 = [1, 1, 1, 1, -1, -1, 1, 1, 1]';
x2 = [-1, 1, -1, -1, 1, -1, -1, 1, -1]';
x3 = [1, 1, 1, -1, 1, -1, -1, 1, -1]';

d1 = [1, -1, -1]';
d2 = [-1, 1, -1]';
d3 = [-1, -1, 1]';

w = [0.9081, 0.9485, -0.1513, -0.5108; -0.2862, -0.482, 0.6261, 0.5212; 0.6762, -0.4969, 0.7958, 0.3897];
wBar = [-0.0963000000000000,-0.766900000000000,0.0939000000000000,0.198700000000000,0.374800000000000,-0.752700000000000,-0.839300000000000,0.868100000000000,0.538200000000000,0.343800000000000;-0.472800000000000,-0.580900000000000,-0.987800000000000,-0.136200000000000,-0.249400000000000,0.946700000000000,-0.0115000000000000,-0.499700000000000,-0.000100000000000000,0.363300000000000;0.331000000000000,-0.772600000000000,-0.648100000000000,-0.835000000000000,0.672400000000000,-0.940700000000000,0.538900000000000,-0.280700000000000,0.498500000000000,0.513500000000000];

bias = -1;
cycles = 1;
inputCounter = 1;

n = 0.8;

X = [x1, x2, x3];
X(10, :) = bias;

D = [d1, d2, d3];

for index = 1:cycles
    % start feedforward
    activationVector1 = wBar * X(:, inputCounter);
    
    layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);
    
    layer1(4, :) = bias;
    
    activationVector2 = w * layer1;
    
    layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);
    
    % feedfoward has finished, start back propagation
    layer2Delta = (D(:, inputCounter) - layer2) .* arrayfun(@bipolarDifferentialFunction, activationVector2);
    % make sure you multiply each element by their respective differential
    % values
    
    layer1Differential = arrayfun(@bipolarDifferentialFunction, activationVector1);
    %layer1Differential = arrayfun(@bipolarDifferentialFunction, activationVector2);
    
    %layer1Sum = sumVector(layer2Delta, w);
    %layer1Delta = layer1Differential .* layer1Sum;
    [wRows, wCols] = size(w);
    
    layer1Delta = zeros(wRows, 1);
    for counter = 1:wCols - 1 % do not include the bias
        disp(layer2Delta);
        disp(w(:, counter));
        disp(layer1Differential(counter, :));
        temp = layer2Delta .* w(:, counter) .* layer1Differential;
        layer1Delta(:, 1) = layer1Delta(:, 1) + temp;
    end
    
    inputCounter = inputCounter + 1;
    if inputCounter > 3
        inputCounter = 1;
    end
end

function output = bipolarLogisticFunction(v)
    output = 2 / (1 + exp(-v)) - 1;
end

function output = bipolarDifferentialFunction(v)
    output = 0.5 * (1 - (bipolarLogisticFunction(v))^2);
end

function output = sumVector(delta, weights)
    [wRows, wCols] = size(weights);
    disp([wRows, wCols]);
    output = zeros(wRows, 1);
    
    %for index = 1:wCols
    %    output = output + delta .* weights(:, index);
    %    %disp(output);
    %end
    
    for index = 1:wRows
        %summedRow = sum(weights(index, :));
        %disp(summedRow);
        %output(index, :) = delta(index, :) * summedRow;
        
        for colIndex = 1:wCols
            disp([delta(index, :), weights(index, colIndex),delta(index, :) * weights(index, colIndex)]);
            output(index, :) = output(index, :) + delta(index, :) * weights(index, colIndex);
        end
    end
    disp(output);
end