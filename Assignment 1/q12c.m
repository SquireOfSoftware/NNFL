clc;
clear;

% augmented input vectors
x1 = [0.8, 0.5, 0, 0.1, 1];
x2 = [0.2, 0.1, 1.3, 0.9, 1];
x3 = [0.9, 0.7, 0.3, 0.3, 1];
x4 = [0.2, 0.7, 0.8, 0.2, 1];
x5 = [1, 0.8, 0.5, 0.7, 1];
x6 = [0, 0.2, 0.3, 0.6, 1];

% each of the augmented vectors are placed into a single vector to churn
% through
y = [x1; x2; x3; x4; x5; x6]';  

% associated outputs
d = [1, -1, 1, -1, 1, -1];

% given learning constant
learningConstant = 0.25;

% given cycles
cycles = 49;