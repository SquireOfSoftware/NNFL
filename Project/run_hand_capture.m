% code to run both the capture and plotting process

while(1)
    capture_raw_data;

    plot_hand_data;

    savePrompt = 'Save this data (y/n)? ';
    key = input(savePrompt, 's');
    if key == 'y'
        % this is to append the data into a preconfigured result called
        % "processedPatternCollection", this is a 300 by 300 array

        combine_data;
    end
    
    quitPrompt = 'Do another recording (y/n)? ';
    quitResult = input(quitPrompt, 's');
    if quitResult == 'n'
        break;
    end
end
