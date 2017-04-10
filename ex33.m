x1 = 1;
x2 = -0.5;
x3 = 3;
x4 = -2;

d1 = 1;
d2 = -1;
d3 = 1;
d4 = -1;

d = [1; -1; 1; -1];

y1 = [1; 1];
y2 = [-0.5; 1];
y3 = [3; 1];
y4 = [-2; 1];

y = [1,1; -0.5, 1; 3, 1; -2, 1]';

w1 = [-2.5; 1.75];
w = w1;
learningConstant = 1;
expectedOutputIndex = 1;

for index = 1:15
    hold on
    plot(w);
    w = correction(learningConstant, d(expectedOutputIndex,:), w, y(:, expectedOutputIndex));
    expectedOutputIndex = expectedOutputIndex + 1;
    if expectedOutputIndex > 4
        expectedOutputIndex = 1;
    end
    disp(index);
    disp(w);
end

function output = correction(c, d, w, y)
    output = w + 0.5*c*(d - sign(w'*y))*y;
end