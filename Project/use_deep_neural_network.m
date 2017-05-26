function output = use_deep_neural_network(X)
    if exist('current_weight.mat', 'file')
        load('current_weight.mat', 'w', 'wBar');
        bias = -1;
        
        X(301,:) = bias;

        activationVector1 = wBar * X; % X is input

        layer1 = arrayfun(@bipolarLogisticFunction, activationVector1);
        [v1Row, ~] = size(activationVector1);

        layer1(v1Row + 1, :) = bias;

        activationVector2 = w * layer1;

        layer2 = arrayfun(@bipolarLogisticFunction, activationVector2);

        disp("Classification is: ");
        disp(layer2);

    else
        disp("Please build the neural network first");

    end

    function output = bipolarLogisticFunction(v)
        output = (2 / (1 + exp(-v))) - 1;
    end
end