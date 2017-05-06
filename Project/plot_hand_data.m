% code to plot the processed data
cla;

load('raw_data.mat');
%load('capturedData/hand_down.mat');

plotData(processedRecording);

function plotData(handData)
    [~, dCols] = size(handData);

    plotColours = [1 1 0; 0 0 1; 0 1 1; 1 0 0; 0 0 0];

    set(gca, 'ColorOrder', plotColours, 'NextPlot', 'replacechildren');
    axis([-100 300 -300 300]);

    for index = 1:dCols
        for pointableIndex = 1:5
            fingerPosition = 1 + 3 * (pointableIndex - 1);

            plot3(handData(fingerPosition, index), ...
                handData(fingerPosition + 2, index), ...
                handData(fingerPosition + 1, index), ...
                '.', 'MarkerSize', 50);
            
            drawnow;

            grid on;
            hold on;
        end
    end
end