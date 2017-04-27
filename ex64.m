% this is in relation to defuzzification
clc;
clear;

% e = 1.5
e = [0.25, 0.75];

% ce = -0.05
ce = [0.1, 0.9];

uMOM = calculateMOMValue(calculateMOMVector(e, ce), [1, 2, 2, 3]);

uCOA = calculateCOAVector(e, ce);

function output = calculateMOMVector(e, ce)
    [~, dCols] = size(e);
    output = zeros(1, 4);
    outputIndex = 1;
    for eIndex = 1:dCols
        for ceIndex = 1:dCols
            output(:,outputIndex) = e(:,eIndex) * ce(:, ceIndex);
            outputIndex = outputIndex + 1;
        end
    end
end

function output = calculateMOMValue(vector, indexes)
    numerator = 0;
    for index = 1:4
        numerator = numerator + vector(:,index) * ...
            givenOutputMOMFunction(vector(:,index), indexes(:,index));
        
        %disp(givenOutputMOMFunction(vector(:,index), indexes(:,index)));
    end
    
    denominator = 0;
    for index = 1:4
        denominator = denominator + vector(:,index);
    end
    
    output = numerator / denominator;
    disp(output);
end

function output = givenOutputMOMFunction(vector, index)
    output = 0;
    if index == 1 % NS
        if vector < 0 && vector >= -4
            output = -0.25 * vector;
        elseif vector < -4
            output = 1;
        else
            output = 0;
        end
    elseif index == 2 % ZE
        if vector < 0 && vector >= -4
            output = 0.25 * vector + 1;
        elseif vector >= 0 && vector <= 4
            output = -0.25 * vector + 1;
        elseif vector > 4
            output = 0;
        elseif vector < -4
            output = 0;
        else
            output = 1;
        end
    else
        if vector >= 0 && vector <= 4
            output = 0.25 * vector;
        elseif vector < 0
            output = 0;
        else 
            output = 1;
        end
    end
    disp([index, vector, output]);
end

function output = calculateCOAVector(e, ce)
    [~, dCols] = size(e);
    output = zeros(1, 4);
    outputIndex = 1;
    for eIndex = 1:dCols
        for ceIndex = 1:dCols
            output(:,outputIndex) = min(e(:,eIndex), ce(:, ceIndex));
            outputIndex = outputIndex + 1;
        end
    end
    disp(["COA", output]);
end