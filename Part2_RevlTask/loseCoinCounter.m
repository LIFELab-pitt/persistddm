[screenXpixels, screenYpixels] = Screen('WindowSize', wd);
im = imread('pics/piggybank.png');
oneHandle = Screen('MakeTexture', wd, im);
Screen('DrawTexture', wd, oneHandle, [], [], 0);
Screen('TextSize', wd, 45);
Current_Coins= Coin_Count - Coins_Lost;

DrawFormattedText(wd, ['Great job!\n You lost ', num2str(Coins_Lost), ' coins \n You still have ', num2str(Current_Coins), ' coins in your piggy bank!'], 'center',...
    screenYpixels * 0.10, [255 255 255]);
Screen('Flip', wd);

KbStrokeWait;