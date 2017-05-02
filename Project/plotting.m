%load('volume_down.mat');
%load('

cla;

[dRows, dCols] = size(v);

plotColours = [1 1 0; 0 0 1; 0 1 1; 1 0 0; 0 0 0];

set(gca, 'ColorOrder', plotColours, 'NextPlot', 'replacechildren');

%co = get(gca, 'ColorOrder');
%disp(co);

for index = 1:dCols
    for pointableIndex = 1:5
        fingerPosition = ((pointableIndex-1)*9)+1;
        % disp([v(fingerPosition, index), v(fingerPosition + 1, index), v(fingerPosition + 2, index)]);
       
        plot3(v(fingerPosition, index), v(fingerPosition + 2, index), v(fingerPosition + 1, index), '.', 'MarkerSize', 50);
        
        grid on;
        hold on;
    end
    %sleep(1);
end

% sleep for t seconds
function sleep(t)
    tic;
    while (toc<t)
    end
end