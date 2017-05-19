% questions
% how fast should a gesture be?

clc;
clear;

addpath ('/Users/JarvisWalker/Documents/Git/matleap');
addpath ('/Users/JarvisWalker/Documents/Git/nestedSortStruct');

% currently set to 200 milliseconds
[rawRecording, processedRecording] = grab_raw_data(0.2, 20);

save('raw_data.mat', 'rawRecording', 'processedRecording');

function [rawOutput, targettedOutput] = grab_raw_data(timePeriod, samples)
    [version]=matleap_version;
    fprintf('matleap version %d.%d\n',version(1),version(2));
    fprintf("Recording...");
    
    % figure out how to record on first entry
    
    sleep(1);
    disp("...done!");
    
    rawOutput = repmat(struct('id',0,'timestamp',0,'pointables',{},'hands',{}),samples);
    targettedOutput = zeros(15, samples);
    
    outputIndex = 1;
    
    f = matleap_frame;
    
    while isempty(f.pointables)
        f = matleap_frame;
        disp("no data");
    end
    
    startMatleap = tic;
    
    while(toc(startMatleap) < timePeriod)
        f=matleap_frame;
        %rawOutput = [rawOutput; f];
        rawOutput(outputIndex) = f;
        targettedOutput(:, outputIndex) = extractHandData(f);
        
        outputIndex = outputIndex + 1;
        sleep(timePeriod/samples);
    end
end

function sleep(t)
    tic;
    while (toc<t)
    end
end

function handData = extractHandData(frame)
    handData = zeros(15, 1);
    if isempty(frame.pointables)
        disp("Empty frame recording");
    else
        hand = nestedSortStruct(frame.pointables, 'id');
        for i=1:(length(hand))
            % 1, 2, 3 = 1 + 3 (i - 1) = 1
            % 4, 5, 6 = 1 + 3 (i - 1) = 4
            % 7, 8, 9 = 1 + 3 * 2 = 7

            %k=((i-1)*9)+1;
            k = 1 + 3 * (i - 1);

            handData(k:k+2) = hand(i).position;
            %OutData(k+3:k+5) = hand(i).velocity;
            %OutData(k+6:k+8) = hand(i).direction;
        end
    end
end