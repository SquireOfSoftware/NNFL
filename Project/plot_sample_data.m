clc;
clear;
cla;

addpath ('/Users/JarvisWalker/Documents/Git/leap-source-code/Data');

load('Alldata2.mat');

[dRows, dCols] = size(Alldata2);

plotColours = [1 1 0; 0 0 1; 0 1 1; 1 0 0; 0 0 0];

set(gca, 'ColorOrder', plotColours, 'NextPlot', 'replacechildren');

% for index = 1:dCols
%     for pointableIndex = 1:5
%         fingerPosition = ((pointableIndex-1)*9)+1;
%         % disp([v(fingerPosition, index), v(fingerPosition + 1, index), v(fingerPosition + 2, index)]);
%        
%         plot3(v(fingerPosition, index), v(fingerPosition + 2, index), v(fingerPosition + 1, index), '.', 'MarkerSize', 50);
%         
%         grid on;
%         hold on;
%     end
%     %sleep(1);
%end
plot3(Alldata2(:,1),Alldata2(:,2),Alldata2(:,3),'.', 'MarkerSize', 50);
hold on;
plot3(Alldata2(:,10),Alldata2(:,11),Alldata2(:,12),'.', 'MarkerSize', 50);
hold on;
plot3(Alldata2(:,20),Alldata2(:,21),Alldata2(:,22),'.', 'MarkerSize', 50);
hold on;
plot3(Alldata2(:,30),Alldata2(:,31),Alldata2(:,32),'.', 'MarkerSize', 50);
grid on;

plot3(Alldata2(:,2020), Alldata2(:,2021), Alldata2(:,2022), '.');
hold on;

% sleep for t secondspl
function sleep(t)
    tic;
    while (toc<t)
    end
end
