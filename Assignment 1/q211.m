% Fuzzy logic
% 2.1.1 Find R = M X A
M = [0, 0.25, 0.75, 1, 0.75, 0.25, 0];
A = [0, 0.3, 0.6, 1, 0.6, 0.3, 0];

R = getRelation(M', A);

disp(R);

function output = getRelation(a, b)
    output = min(a, b);
end
