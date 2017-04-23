finalWeight = [0.464350117283198;0.689974826342637;0.184158957165242;0.108589082355343;-0.834298947076565];

% copied from q11
inputs = [0.800000000000000,0.200000000000000,0.900000000000000,0.200000000000000,1,0;0.500000000000000,0.100000000000000,0.700000000000000,0.700000000000000,0.800000000000000,0.200000000000000;0,1.30000000000000,0.300000000000000,0.800000000000000,0.500000000000000,0.300000000000000;0.100000000000000,0.900000000000000,0.300000000000000,0.200000000000000,0.700000000000000,0.600000000000000;1,1,1,1,1,1];

% associated outputs
outputs = [1, -1, 1, -1, 1, -1];

[iRows, iCols] = size(inputs);

patternErrors = zeros(1, iCols);

validation(inputs, outputs, finalWeight)

disp(patternErrors);

function validation(inputs, outputs, weight)
    [iRows, iCols] = size(inputs);
    for index = 1:iCols
        error = calculateVariation(outputs(:, index), weight, inputs(:, index));
        patternErrors(:, index) = error;
    end
end

function error = calculateVariation(expectedOutput, weight, input)
    actualOutput = sign(weight' * input);
    disp([expectedOutput, actualOutput]);
    
    error = (expectedOutput - actualOutput);
end