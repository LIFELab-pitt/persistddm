%==========================================================================
% revlInstr
% Script to display the instructions for the Reversal Learning Task
%
% Hanneke den Ouden 
% Donders Institute for Brain, Cognition and Behaviour
% h.denouden@gmail.com
% 
% version 11-08-2015
%==========================================================================


% Set a bunch of parameters for the instruction screen
spacing = 2; % distance between lines, in multiples of textsize
top     = prep.top; % location of the top of the text
wacht   = 1.5;

% SCREEN
% -------------------------------------------------------------------------
txt{1}    = {'Now we will review what happens in the lose level'};
txt{2}    = {'On each round of the lose level, you will see a yellow machine and a pink machine.',...
    'To play the game use the mouse to click on the machine you want to play.',...
    'Like this '};
txt{3}= {'When the machines appear on the screen for you to play, you will only have 4 SECONDS to choose'}; 
txt{4}= {'After playing the machine in the lose level, there are two possible outcomes:',...
    'You could LOSE a coin or you could lose NOTHING'};
txt{5} = {'It is important to pay attention to the color of the machine that LOSES more coins,',...
    'But sometimes the machine that loses more coins may change during the level',...
    'Try to AVOID picking the machine that LOSES the most',...
    'It is important to realize that ONLY THE COLOR of the machine matters, NOT the location of the machine'};
txt{6} = {'Before we start, let''s quickly review the rules of the lose level'};
txt{7}    = {'Great job!',...
            'Let''s play a practice round of the lose level'};
        
        
%Add in a report of how much you lost
         
    

HideCursor;
rescale= [20 20 -20 -20];
% display the texts; changed WaitSecs(2) to (.5)
for i  = 1:7
    if i==2
        ShowCursor('Hand')
        Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(1)
        Screen('DrawTexture',wd,img.select{3},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});   
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        Screen('Flip', wd)
        WaitSecs(1)
        Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        no_break=0;
        while no_break==0
            [x,y,buttons] = GetMouse;
            keyboard_pressed = KbCheck;
            if (buttons(1) ==1 && (IsInRect(x,y, [15,0,285,270]) || IsInRect(x,y, [1635,0,1905,270])))
                if (IsInRect(x,y, [15,0,285,270]) && buttons(1)==1)
                    Screen('DrawTexture',wd,img.select{3},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});   
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip', wd)
                    WaitSecs(1)
                    Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                elseif (IsInRect(x,y, [1635,0,1905,270]) && buttons(1)==1)
                    Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.select{4},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                    WaitSecs(1)
                    Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                end
            end
            if keyboard_pressed
                no_break=1;
            end
        end
        pressbutton;
    elseif i==3
        Screen('DrawTexture',wd,img.stim{3},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{4},[],prep.draw.rect.stim{2});
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(.1);
        pressbutton;

    elseif i ==4
        HideCursor
        Screen('DrawTexture',wd,img.feedback{3},[],prep.draw.rect.stim{1} + rescale);
        Screen('DrawTexture',wd,img.feedback{1},[],prep.draw.rect.stim{2} + rescale);
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(.1);
        pressbutton;
    
    else
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(.1);
        pressbutton;
    end
   
   
end

%disptxt(txt{end},wd,wdw,wdh,0,0,white,0,1);
WaitSecs(0.2);
%KbWait;
blackscreen;
WaitSecs(.1);



