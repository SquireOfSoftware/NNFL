% @file test_matleap.m
% @brief test matleap functionality
% @author Jeff Perry <jeffsp@gmail.com>
% @version 1.0
% @date 2013-09-12
% Heavily modified from matleap and group 14

function x= run_matleap
    % remove matleap mex-file from memory
    clear functions
    % set debug on
    %matleap_debug
    % show version
    [version]=matleap_version;
    fprintf('matleap version %d.%d\n',version(1),version(2));
    disp("Running matleap modifications");
    % pause to let the hardware wake up
    sleep(1)
    % get some frames
    startMatleap = tic;
    frame_id=-1;
    frames=0;
    bFoundData=0; %Flag when data returned 
    bFinishLoop = 1; %Flag when to finish loop
    i =0;
    OutStore=zeros(45,1);
    disp('Scanning...');
    while(bFinishLoop && toc(startMatleap) < 1)
        % get a frame
        f=matleap_frame;
        % only count it if it has a different id
        disp(frame_id);
        if f.id~=frame_id
            frame_id=f.id;
            i=i+1;
            if isempty(f.pointables)
                %display(['Empty']);
                if bFoundData==1
                   bFinishLoop = 0;
                end
            else
                bFoundData=1;
                
                % extract the pointable ids, use this to mark everything
                % against each other, will need to use maps
                % see matlab maps
                
                A=extractLeapData(f);
                OutStore=[OutStore A];
                %print(f);
            end     
            frames=frames+1;
            disp(toc(startMatleap));
        end
        sleep(0.05);
    end

    % display performance
    %fprintf('%d frames\n',frames);
    %fprintf('%f seconds\n',s);
    %fprintf('%f fps\n',frames/s);
  x =OutStore(:,2:end);
end

% sleep for t seconds
function sleep(t)
    tic;
    while (toc<t)
    end
end

% print the contents of a leap frame
function OutData = extractLeapData(f)

OutData = zeros(45,1);

    for i=1:(length(f.pointables))
        k=((i-1)*9)+1;
        
        OutData(k:k+2) = f.pointables(i).position;
        OutData(k+3:k+5) = [f.pointables(i).id, 0, 0];%f.pointables(i).velocity;
        OutData(k+6:k+8) = f.pointables(i).direction;

        %fprintf(' %f',f.pointables(i).position);
        %fprintf(' %f',f.pointables(i).velocity);
        %fprintf(' %f',f.pointables(i).direction);
        disp([i, f.pointables(i).id, k]);
    end
end

function print(f)
    fprintf('frame id %d\n',f.id);
    fprintf('frame timestamp %d\n',f.timestamp);
    fprintf('frame pointables %d\n',length(f.pointables));
    for i=1:length(f.pointables)
        fprintf('pointable %d\n',i);
        fprintf('\tid ');
        fprintf('%d',f.pointables(i).id);
        fprintf('\n');
        fprintf('\tposition ');
        fprintf(' %f',f.pointables(i).position);
        fprintf('\n');
        fprintf('\tvelocity ');
        fprintf(' %f',f.pointables(i).velocity);
        fprintf('\n');
        fprintf('\tdirection '); 
        fprintf(' %f',f.pointables(i).direction);
        fprintf('\n');
    end
  end
