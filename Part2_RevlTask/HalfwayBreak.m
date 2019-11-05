Screen('TextSize', wd, 45);
line1 = 'You are halfway done. Great Job!';
line2 = '\n Please press the green button now and someone will be with you shortly';
DrawFormattedText(wd, [line1, line2], ...
    'center', 'center', white);

Screen('Flip', wd);

cont=1;
while cont==1
     [ignore_1,ignore_2, my_codes] = KbCheck;
    if my_codes(78) && my_codes(69) && my_codes(88) && my_codes(84)
        cont=2;
    end
end