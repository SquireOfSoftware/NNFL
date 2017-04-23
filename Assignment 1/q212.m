% 2.1.2 Find A1a = M1 o R using max-min

M1 = [0, 0.5, 0.8, 1, 0.6, 0.2, 0];
A1a = maxMinComposition(M1', R);

function output = maxMinComposition(a, b)
    output = max(min(a,[],2),... % read the rows of a
        max(b,[],1)); % read the columns of b
end