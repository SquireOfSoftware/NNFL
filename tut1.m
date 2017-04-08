clc;
clear;

question1 = q1();

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

function output = q2() 
    
end