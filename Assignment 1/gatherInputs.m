%for index = 1:100
%    f = gcf;
%    disp(f);    
%end

%f = figure;
%w = waitforbuttonpress; 
% this literally blocks the execution of more code 
% until something is registered
%if w == 0
%    disp('Button click')
%else
%    disp('Key press')
%end

clear;

escape = 0;

escapeFig = figure('Name', 'Random title', 'KeyPressFcn', @keyPressed, "something", false);

%loop();

function loop()
    index = 0;
    key = waitforbuttonpress;
    while index < 10000000000
        %escape = window('KeyPressFcn', @keyPressed);
        %if escape > 0
            %disp(get(window, 'Key));
        %end
        %disp(get(window, 'KeyPressFcn'));
        %get(window, 'KeyPressFcn');
        if get(escapeFig, 'something')
            break;
        end
        index = index + 1;
    end
end

function keyPressed(src, event) 
    disp(["Hello Friend Stay Awhile and Listen", src.CurrentCharacter]);
    %something = true;
    set
end