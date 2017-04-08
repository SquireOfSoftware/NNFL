% Fuzzy logic
% 2.1.1 Find R = M X A
M = [0, 0.25, 0.75, 1, 0.75, 0.25, 0];
A = [0, 0.3, 0.6, 1, 0.6, 0.3, 0];

R = fuzzify(M', A);

% 2.1.2 Find A1a = M1 o R
% 2.1.3 Find A1b = M1 o R
% 2.2.1 Use MoM to find output voltage
% 2.2.2 Use CoA to find output voltage