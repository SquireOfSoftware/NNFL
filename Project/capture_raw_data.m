clc;
clear;

addpath ('/Users/JarvisWalker/Documents/Git/matleap');

[oneSecondRecording, fingerPositions] = grab_raw_data(5);

save('raw_data.mat', 'oneSecondRecording');

function [output, fingerPositions] = grab_raw_data(timePeriod)
    [version]=matleap_version;
    fprintf('matleap version %d.%d\n',version(1),version(2));
    sleep(1);
    startMatleap = tic;
    output = [];
    while(toc(startMatleap) < timePeriod)
        f=matleap_frame;
        output = [output, f];
        sleep(0.5);
    end
    fingerPositions = 0;
end

function sleep(t)
    tic;
    while (toc<t)
    end
end

function fingerPositions = extractFingerPositions(frame)
    
end