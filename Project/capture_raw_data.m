clc;
clear;

addpath ('/Users/JarvisWalker/Documents/Git/matleap');
addpath ('/Users/JarvisWalker/Documents/Git/NNFL/Project/nestedSortStruct');

[rawRecording, processedRecording] = grab_raw_data(1, 0.05);

save('raw_data.mat', 'rawRecording', 'processedRecording');

function [rawOutput, targettedOutput] = grab_raw_data(timePeriod, samplingTime)
    [version]=matleap_version;
    fprintf('matleap version %d.%d\n',version(1),version(2));
    fprintf("Recording...");
    sleep(1);
    disp("...done!");
    startMatleap = tic;
    %rawOutput = [];
    rawOutput = repmat(struct('id',0,'timestamp',0,'pointables',{},'hands',{}),20);
    targettedOutput = zeros(15, timePeriod/samplingTime);
    
    outputIndex = 1;
    while(toc(startMatleap) < timePeriod)
        f=matleap_frame;
        %rawOutput = [rawOutput; f];
        rawOutput(outputIndex) = f;
        targettedOutput(:, outputIndex) = extractHandData(f);
        
        outputIndex = outputIndex + 1;
        sleep(samplingTime);
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