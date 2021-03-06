clc;
clear;

question1 = q1();

question21 = q21();
question22 = q22(question21);

question3 = q3();

function output = q1()
    weight = [0, 1, 0]';
    input = [2, 1, -1; 0, -1, -1]';
    expectedOutput = [-1; 1];
    learningConstant = 1;

    error = 10;
    loops = 5;
    index = 1;
    
    output = weight;

    while error ~= 0 && loops > 0
        [weight, error] = runOneLoop(learningConstant, ...
                                    input(:, index), ...
                                    weight, ...
                                    expectedOutput(index, 1));

        if mod(index, 2) == 0
            index = index - 1;
        else 
            index = index + 1;
        end

        %disp(weight);
        output = horzcat(output, weight);
        loops = loops - 1;
    end

    function [w2, e] = runOneLoop( c, x, w, d)
        v = w' * x;

        z = sign(v);

        e = d - z;
        r = e;
        w2 = w + c * r * x;
    end
end

function output = q21() 
    x10 = [0.1, 0.5, 1, 0.3, 0.1];
    y6 = [0.3, 1, 0.9, 0.2];
    addpath('Assignment 1');
    output = fuzzify(x10', y6);
end

function output = q22(r)
    x9 = [0.5, 1, 0.9, 0.4, 0];
    output = maxmincomposition(x9,r);
    
    function output = maxmincomposition(a, b)
        output = max(min(a,[],2),... % read the rows of a
            min(b,[],1)); % read the columns of b
    end
    % https://www.calvin.edu/~pribeiro/othrlnks/Fuzzy/tutorial1.htm
    % fuzzy tutorial
end

function output = q3() 
    inputs = [1, -0.5, 3, -2; 1, 1, 1, 1];
    outputs = [1, -1, 1, -1];
    lambda = 2;
    initialWeight = [-2.5; 1.75];
    w = initialWeight;
    
    inputIndex = 1;
    
    for index = 1:10
        disp(w);
        w = runOneLoop(lambda, w, inputs(:, inputIndex), outputs(:, inputIndex));
        inputIndex = inputIndex + 1;
        if inputIndex > 4
            inputIndex = 1;
        end
    end
    
    output = w;
    
    function output = runOneLoop(lambda, weight, augmentedInput, expectedValue)
        output = weight + 0.5 * lambda * abs(weight' * augmentedInput) / ...
            (augmentedInput' * augmentedInput) * ...
            (expectedValue - sign(weight' * augmentedInput)) *...
            augmentedInput;
    end
end