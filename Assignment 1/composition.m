function output = composition(a, b)
    output = min(max(a,[],2),... % read the rows of a
        max(b,[],1)); % read the columns of b
end