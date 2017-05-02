
test = clean_up_raw_data();

function output = clean_up_raw_data()
    load('raw_data.mat');
    [~, dCols] = size(oneSecondRecording);
    for index = 1:dCols
        fingersOnHand = oneSecondRecording(index);
        if isempty(fingersOnHand.pointables)
            disp("Empty HAND");
        else
            output = fingersOnHand;
            [~, dCols] = size(fingersOnHand.pointables);
            % hand = zeros();
            for fingerIndex = 1:dCols
                disp(fingersOnHand.pointables(fingerIndex).id);
                % gotta extract the data out of structs into vectors
                %hand = [hand, fingersOnHand.pointables(fingerIndex)];
            end
            %output = [output; hand];
        end
        
        %disp(fingersOnHand);
    end
    %output = fingersOnHand;
end