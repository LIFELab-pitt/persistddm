sca;
close all;
clearvars;

PsychDefaultSetup(2);

screens =Screen('Screens');

screenNumber = max(screens);


%white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
%grey = white / 2;
%inc = white - grey;

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);
[wdw, wdh]      = Screen('WindowSize', window);
centre          = round([wdw/2, wdh/2]);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
nt=5;
im = imread('pics/piggybank.png');
oneHandle = Screen('MakeTexture', window, im);
Screen('DrawTexture', window, oneHandle, [], [], 0);
Screen('TextSize', window, 45);
DrawFormattedText(window, ['Great job!\n You lost ', num2str(5), ' coins \n You still have ', num2str(10), ' coins in your piggy bank!'], 'center',...
    screenYpixels * 0.10, [255 255 255]);
Screen('Flip', window);

KbStrokeWait;
sca;
