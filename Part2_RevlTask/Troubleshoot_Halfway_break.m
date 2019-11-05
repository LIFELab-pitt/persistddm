close all;
clearvars;
sca;

PsychDefaultSetup(2);


% Get the screen numbers
screens = Screen('Screens');

% Select the external screen if it is present, else revert to the native
% screen
screenNumber = max(screens);

% Define black, white and grey
black = BlackIndex(screenNumber);
white = WhiteIndex(screenNumber);
grey = white / 2;

[wd, windowRect] = PsychImaging('OpenWindow', screenNumber, black);


Screen('TextSize', wd, 45);
line1 = 'You are halfway done. Great Job!';
line2 = '\n Please take a short break before continuing';
DrawFormattedText(wd, [line1, line2], ...
    'center', 'center', [1 1 1]);
DrawFormattedText(wd, '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWhen you are ready to continue press the space bar', ...
    'center', 'center' , [1 1 1]);
   nextttttt
Screen('Flip', wd);
cont=1;
while cont==1
     [down,time,my_codes] = KbCheck;
    if my_codes(78) && my_codes(69) && my_codes(88) && my_codes(84)
        cont=2;
    end
end
sca;