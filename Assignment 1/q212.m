clc;
clear;

M1 = [0, 0.5, 0.8, 1, 0.6, 0.2, 0];
R = [0,0,0,0,0,0,0;0,0.250000000000000,0.250000000000000,0.250000000000000,0.250000000000000,0.250000000000000,0;0,0.300000000000000,0.600000000000000,0.750000000000000,0.600000000000000,0.300000000000000,0;0,0.300000000000000,0.600000000000000,1,0.600000000000000,0.300000000000000,0;0,0.300000000000000,0.600000000000000,0.750000000000000,0.600000000000000,0.300000000000000,0;0,0.250000000000000,0.250000000000000,0.250000000000000,0.250000000000000,0.250000000000000,0;0,0,0,0,0,0,0];

% 2.1.2 Find A1a = M1 o R using max-min - apply max first then min overall
A1a = maxMinComposition(M1', R);
% 2.1.3 Find A1b = M1 o R using sum-product - sum each row, then multiply
A1b = sumProductComposition(M1', R);

disp(A1a);
disp(A1b);

function output = maxMinComposition(a, b)
    output = min(max(a,[],2),... % read the rows of a
                max(b,[],1)); % read the columns of b
end

function output = sumProductComposition(a, b)
    output = a * sum(b);
end