if exist('current_weight.mat', 'file')
    load('current_weight.mat', 'currentWeight');
    oldCurrentWeight = currentWeight;
else
    % interestingly all ones do nothing
    %weight1 = zeros(noOfInputs + 1, 1);
    currentWeight = processedPatternCollection(1, :)';
    currentWeight = [currentWeight; 1];
    
    % define w and wBar
end