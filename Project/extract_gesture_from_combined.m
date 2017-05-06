% this code is to extract the frame from a list of gestures

function [processedFrame, rawFrame] = extract_gesture_from_combined(frameNumber)
    % frameNumber is a number from 1 to 300
    clc;
    %clear;
    
    load('combined_data.mat', 'processedPatternCollection', 'rawPatternCollection');
    
    referenceNumber = 1 + 20 * (frameNumber - 1);
    
    processedFrame = separate_out_processed_frame(processedPatternCollection(:, frameNumber));
    
    rawFrame = rawPatternCollection(referenceNumber: referenceNumber + 20 - 1);
    
     function outputFrame = separate_out_processed_frame(gesturePattern)
         % groups of 15
         % 1 - 15
         % 16 - 30
         disp(size(gesturePattern));
         outputFrame = zeros(15, 20);
         %for index = 1:20
         %    outputFrame(:, index) = gesturePattern(index + 14 * (index - 1): index + 14 * (index));
         %end
         
         for index = 1:15
             outputFrame(index, :) = gesturePattern(index + 19 * (index - 1): index + 19 * (index));
         end
     end
end