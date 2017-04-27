clc;
clear;

allWeights = [0.230900000000000,0.308704210526316,0.214990815418829,0.392280039358605,0.389201861254868,0.389201861254868,0.389201861254868,0.488622034833465,0.488622034833465,0.488622034833465;0.583900000000000,0.632527631578947,0.585670934025204,0.723562552645030,0.712788929281949,0.712788929281949,0.712788929281949,0.774926537768572,0.774926537768572,0.774926537768572;0.843600000000000,0.843600000000000,0.234462931801334,0.293559339781260,0.281246627366310,0.281246627366310,0.281246627366310,0.281246627366310,0.281246627366310,0.281246627366310;0.476400000000000,0.486125526315790,0.0644152483320978,0.123511656312023,0.120433478208286,0.120433478208286,0.120433478208286,0.132860999905611,0.132860999905611,0.132860999905611;-0.647500000000000,-0.550244736842105,-1.01881171237954,-0.821823685779789,-0.837214576298476,-0.837214576298476,-0.837214576298476,-0.712939359325229,-0.712939359325229,-0.712939359325229];

% copied from q11
% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

% each of the augmented vectors are placed into a single vector to churn
% through
inputs = [x1; x2; x3; x4; x5; x6]';  

% associated outputs
outputs = [1, -1, 1, -1, 1, -1];

[cycleError, patternError] = validation(allWeights, inputs, outputs);

function [output, patternError] = validation(weights, inputs, outputs)
    % for each weight, calculate error from inputs
    output = zeros(1, 10);
    weightedIndex = 1;
    patternError = zeros(1, 60);
    patternIndex = 1;
    for weightIndex = 1:10
        sumErrors = 0;
        if weightIndex == 11
            weightedIndex = 1;
        end
        for inputIndex = 1:6
            currentError = calculateVariation(outputs(:,inputIndex),...
                weights(:,weightedIndex),...
                inputs(:,inputIndex));
            sumErrors = sumErrors + currentError;
            patternError(:, patternIndex) = currentError;
            patternIndex = patternIndex + 1;
            disp(["inputIndex",inputIndex, currentError]);
            disp(inputs(:,inputIndex)');
        end
        weightedIndex = weightedIndex + 1;
        
        output(:,weightIndex) = sumErrors;
    end
end

function error = calculateVariation(expectedOutput, weight, input)
    actualOutput = sign(weight' * input);
    error = 0.5*(expectedOutput - actualOutput)^2;
end