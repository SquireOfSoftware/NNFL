% borrowed from this site: https://au.mathworks.com/matlabcentral/answers/102663-how-do-i-send-keystrokes-from-matlab-to-another-application-that-was-invoked-using-the-bang-opera

h = actxserver('WScript.Shell');
%h.Run('C:\Program Files (x86)\VideoLAN\VLC\vlc.exe'); %this does not work
%pause(3); %Waits for the application to load.
h.AppActivate('VLC media player'); %Brings notepad to focus
% note this only works if VLC is already open
h.SendKeys('^o'); %Sends keystrokes
%h.SendKeys('^s'); % save file
pause(3);
%h.SendKeys('test.txt~'); % save as 'test.txt' and return
disp("script is done");
%h.SendKeys('%{F4}'); % close Notepad Alt+F4