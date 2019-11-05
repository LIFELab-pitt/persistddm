

[screenXpixels, screenYpixels] = Screen('WindowSize', wd);
im = imread('pics/piggybank.png');
oneHandle = Screen('MakeTexture', wd, im);
Screen('DrawTexture', wd, oneHandle, [], [], 0);
Screen('TextSize', wd, 45);
DrawFormattedText(wd, ['Great job!\n You won ', num2str(Coin_Count), ' coins'], 'center',...
    screenYpixels * 0.10, [255 255 255]);
Screen('Flip', wd);

KbStrokeWait;
Screen('TextSize', wd, 28);
