% training the deep neural network
% questions
% 1. the layout of input data
% 2. number of hidden neurons

cla;
clc;
clear;

hold on;
grid on;

% please make sure you run data_divider and data_mixer first
load('split_data.mat', 'overallTrainingData', 'overallValidationData', 'overallTestingData', 'expectedOutputs', 'gestureCount');

bias = -1;

hiddenNeurons = 30; % trial and error from 10 - 100
outputBits = gestureCount;

wBar = rand(hiddenNeurons, 301);
w = rand(outputBits, hiddenNeurons + 1);

% samples are bunched up into groups of 100
steps = 100;
% should always be multiples of 400

inputCounter = 1;
outputCounter = 1;

n = 0.1;

%disp("overallTrainingData");
%disp(overallTrainingData);


[~, dCols] = size(expectedOutputs);
[~, wCols] = size(w);

[finalW, finalWBar, validationErrors, cycleErrors] = runTraining(w, wBar, bias, steps, inputCounter, outputCounter, n, overallTrainingData, overallValidationData, expectedOutputs, dCols, wCols, outputBits);

function [finalW, finalWBar, validationErrors, cycleErrors] = runTraining(w, wBar, bias, steps, inputCounter, outputCounter, n, overallTrainingData, overallValidationData, expectedOutputs, dCols, wCols, outputBits)
    [iRows, iCols] = size(overallTrainingData);
    overallTrainingData(iRows + 1, :) = bias;
    patternErrors = zeros(outputBits, steps);
    cycleCount = 1;
    if mod(steps, iCols) == 0
        validationErrors = zeros(1, steps/iCols);
        cycleErrors = zeros(outputBits, steps/iCols);
    else
        validationErrors = zeros(1, steps);
        cycleErrors = zeros(outputBits, steps);
    end
    for index = 1:2000
        % start feedforward
        disp(index);
        %disp([size(wBar),size(overallTrainingData(:, inputCounter))]);
        activationVector1 = wBar * overallTrainingData(:, inputCounter);
        %disp(activationVector1);
        layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);
        [v1Row, ~] = size(activationVector1);

        layer1(v1Row + 1, :) = bias;
        %layer1 = [layer1; bias];
        %disp("layer1");
        %disp(layer1);
        %disp([size(w),size(layer1)]);
        activationVector2 = w * layer1;
        
        disp("activationVector2");
        disp(activationVector2);

        layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);
        %classifications(:, index) = layer2;
        %disp(expectedOutputs(:, outputCounter));
        
        disp("layer2");
        disp(layer2);
        
        %disp(size(layer2));
        %{
        disp("expected output");
        disp(expectedOutputs(:, outputCounter));
        %}
        %disp(size(expectedOutputs(:, outputCounter)));
        % feedfoward has finished, start back propagation
        patternError = expectedOutputs(:, outputCounter) - layer2;
        %disp("pattern");
        %disp(patternError);
        patternErrors(:, index) = patternError;
        cycleErrors(:, cycleCount) = cycleErrors(:, cycleCount) + patternError.^2;
        layer2Delta = patternError .* arrayfun(@bipolarDifferentialFunction, activationVector2);
        % make sure you multiply each element by their respective differential
        % values

        layer1Differentials = arrayfun(@bipolarDifferentialFunction, activationVector1);

        layer1Delta = zeros(wCols - 1, 1);
        for rowCounter = 1:wCols - 1 % do not include the bias weight
            layer1Delta(rowCounter,1) = layer2Delta(:,1)'*w(:,rowCounter);
        end
        layer1Delta = layer1Differentials .* layer1Delta;

        % update the weights
        uw = w + n * layer2Delta * layer1';
        uwBar = wBar + n * layer1Delta * overallTrainingData(:,inputCounter)'; % this is correct

        %disp(uw - w);
        oldUW = w;
        oldUWBar = wBar;

        w = uw;
        wBar = uwBar;

        inputCounter = inputCounter + 1;

        % it has reached the end of a cycle
        if inputCounter > iCols
            inputCounter = 1;
            % run validation code here
            % compare w, wBar with validation data
            validationErrors(:, cycleCount) = runValidationData(w, wBar, overallValidationData, expectedOutputs, bias, outputBits);
            
            %{
            if (cycleCount > 1) && (validationErrors(:, cycleCount) > validationErrors(:, cycleCount - 1))
                disp(["breaking loop at:", cycleCount]);
                w = oldUW;
                wBar = oldUWBar;
                break;
            end
            %}
            
            cycleCount = cycleCount + 1;
        end
        outputCounter = outputCounter + 1;
        if outputCounter > dCols
            outputCounter = 1;
        end
        
%{
        if mod(inputCounter, 100) == 0
            outputCounter = outputCounter + 1;
            if outputCounter > dCols
                outputCounter = 1;
            end
            disp(["output counter", outputCounter]);
        end
        %}
    end

    fullCycleErrors = generateCycleError(patternErrors, steps, iCols);
    plot(validationErrors, 'r');
    plot(fullCycleErrors, 'b');
    legend("validationErrors", "cycleErrors");
    %disp(validationErrors);
    xlabel("Cycles");
    ylabel("Errors");
    
    finalW = w;
    finalWBar = wBar;
end

function output = bipolarLogisticFunction(v)
    output = (2 / (1 + exp(-v))) - 1;
end

function output = bipolarDifferentialFunction(v)
    output = 0.5 * (1 - (bipolarLogisticFunction(v))^2);
end

function output = runValidationData(w, wBar, overallValidationData, expectedOutputs, bias, outputBits)
    [vRows, vCols] = size(overallValidationData);
    [~, oCols] = size(expectedOutputs);

    overallValidationData(vRows + 1, :) = bias;

    outputValidationCounter = 1;
    validationCycleCount = 1;

    validationPatternErrors = zeros(outputBits, vCols);
    validationCycleErrors = zeros(outputBits, 1);

    for loop = 1:vCols
        activationValidationVector1 = wBar * overallValidationData(:, loop);
        validationLayer1 = arrayfun(@bipolarLogisticFunction, activationValidationVector1);
        [vv1Row, ~] = size(activationValidationVector1);

        validationLayer1(vv1Row + 1, :) = bias;
        activationValidationVector2 = w * validationLayer1;
        validationLayer2 = arrayfun(@bipolarLogisticFunction, activationValidationVector2);

        validationPatternError = expectedOutputs(:, outputValidationCounter) - validationLayer2;

        validationPatternErrors(:, loop) = validationPatternError;
        validationCycleErrors(:, validationCycleCount) = validationCycleErrors(:, validationCycleCount) + (validationPatternError).^2;
        if mod(loop, 100)
            outputValidationCounter = outputValidationCounter + 1;
            if outputValidationCounter > oCols
                outputValidationCounter = 1;
            end
        end
    end
    validationCycleErrors(:, validationCycleCount) = 0.5 * validationCycleErrors(:, validationCycleCount);

    output = sum(validationCycleErrors);
end

function cycleErrors = generateCycleError(patternErrors, steps, inputCount)
    if mod(steps, inputCount) == 0
        disp(["divides evenly", steps/inputCount]);
        cycleErrors = zeros(1, steps/inputCount);
    else
        cycleErrors = zeros(1, steps);
    end
    patternCount = steps;

    for loops = 1:(steps / inputCount)
        %1 - 6, 7 - 12, 13 - 18
        % 1 + 6*(i - 1)
        stepStarter = 1 + patternCount / (steps / inputCount)*(loops - 1);
        stepEnder = patternCount / (steps / inputCount)*(loops);
        rawCycle = patternErrors(:, stepStarter: stepEnder);
        cycleError = 0.5 * sumPatternErrors(rawCycle, patternCount / (steps / inputCount));
        cycleErrors(:, loops) = sum(cycleError);
    end

    function output = sumPatternErrors(patternErrors, patternCount)
        output = zeros(outputBits, 1);
        for patternCounter = 1:patternCount
            output = output + patternErrors(:, patternCounter).^2;
        end
    end
end
