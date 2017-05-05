% code to run both the capture and plotting process

capture_raw_data;

plot_hand_data;

prompt = 'Save this data (y/n)? ';

key = input(prompt, 's');

disp(key);

if key == 'y'
    % this is to append the data into a preconfigured result called
    % "processedPatternCollection", this is a 300 by 300 array

    combine_data;
end
