% code to run both the capture and plotting process

while(1)
    quitPrompt = 'Stop this recording (y/n)? ';
    quitResult = input(quitPrompt, 's');
    if quitResult == 'y'
        break;
    end
    
    capture_raw_data;

    plot_hand_data;

    savePrompt = 'Save this data (y/n)? ';

    key = input(savePrompt, 's');
    
    if key == 'y'
        % this is to append the data into a preconfigured result called
        % "processedPatternCollection", this is a 300 by 300 array

        combine_data;
    end
end
