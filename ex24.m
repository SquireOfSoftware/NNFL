% ex24

function ex24(c, x, w, d)
    v = w'*x;
    z = sign(v);
    e = d-z;
    r = e;
    w = w + c*r*x;
    disp(w);
end