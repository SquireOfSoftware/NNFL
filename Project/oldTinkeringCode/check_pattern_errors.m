cycleErrors = zeros(1, 300);
patternCount = 300;
[~, pMax] = size(patternErrors); 

for index = 1:400 % how many cycles
    %1 - 6, 7 - 12, 13 - 18
    % 1 + 6*(i - 1)
    stepStarter = 1 + patternCount*(index - 1);
    stepEnder = patternCount*(index);
    
    if stepEnder > pMax
        break;
    end
    %disp([index, stepStarter, stepEnder]);
    rawCycle = patternErrors(:, stepStarter: stepEnder);
    cycleError = 0.5 * sumPatternErrors(rawCycle);
    cycleErrors(:, index) = sum(cycleError);
end

plot(cycleErrors, '-');

function output = sumPatternErrors(patternErrors)
    output = zeros(4, 1);
    [~, steps] = size(patternErrors);
    
    for index = 1:steps
        output = output + patternErrors(:, index).^2;
    end
end