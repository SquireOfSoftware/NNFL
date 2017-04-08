R = [0.3, 0.7, 1.0, 0.2];
I = [0.2, 0.4, 0.6, 0.8, 1, 0.1];
N = [0.33, 0.67, 1, 0.15];

P = fuzzify(R', I);
Q = fuzzify(I', N);

T = composition(P, Q);

function output = fuzzify(a, b)
    output = min(a, b);
end

function output = composition(a, b)
    output = min(max(a,[],2),... % read the rows of a
        max(b,[],1)); % read the columns of b
end