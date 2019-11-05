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
txt{1}    = {'Welcome to the arcade game!'};
txt{2}    = {'Your mission in this game is to select machines that you want to play in order to collect as many coins as possible',...
    'The more coins you collect during the game, the more real money you will win when the game is over.'...
    'So always try your best!'};
txt{3}    = {'On each round of the game you will need to choose a machine to play.',...
    'There are two types of levels in this game:,'...
    'A win level and a lose level',...
    'In the win level, you can win coins by selecting one of the machines',...
    'In the lose level, you can lose coins by selecting one of the machines'};
txt{4} = {'First, let''s review what happens in the win levels', ... 
    'On each round of the win level, you will see a blue machine and an orange machine,',...
    'To play the game use the mouse to click on the machine you want to play.',...
    'Like this '};
txt{5}= {'When the machines appear on the screen for you to play, you will only have 4 SECONDS to choose'}; 
txt{6}= {'After playing the machine in the win level, there are two possible outcomes:',...
    'You could WIN a coin or you could win NOTHING'};
txt{7} = {'It is important to pay attention to the color of the machine that WINS more coins,',...
    'But sometimes the machine that wins more coins may change during the level',...
    'Try to always pick the machine that WINS the most',...
    'It is important to realize that ONLY THE COLOR of the machine matters, NOT the location of the machine'};
txt{8} = {'Before we start, let''s quickly review the rules of the win level'};
txt{9} = {'Great job!',...
    'Let''s play a practice round of the win level'};
HideCursor;
% display the texts; changed WaitSecs(2) to (.5)
rescale= [20 20 -20 -20];
for i  = 1:numel(txt)-1
    if i==1
        Screen('TextSize', wd, 45);
        disptxt(txt{i},wd,wdw,wdh,0,0,white,0,1);
        WaitSecs(.1);
        Screen('TextSize', wd, 28);
        pressbutton;
    elseif i==4
        ShowCursor('Hand')
        Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(1)
        Screen('DrawTexture',wd,img.select{1},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});   
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        Screen('Flip', wd)
        WaitSecs(1)
        Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        no_break=0;
        while no_break==0
            [x,y,buttons] = GetMouse;
            keyboard_pressed = KbCheck;
            if (buttons(1) ==1 && (IsInRect(x,y, [15,0,285,270]) || IsInRect(x,y, [1635,0,1905,270])))
                if (IsInRect(x,y, [15,0,285,270]) && buttons(1)==1)
                    Screen('DrawTexture',wd,img.select{1},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});   
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip', wd)
                    WaitSecs(1)
                    Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                elseif (IsInRect(x,y, [1635,0,1905,270]) && buttons(1)==1)
                    Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.select{2},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                    WaitSecs(1)
                    Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
                    Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
                    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
                    Screen('Flip',wd)
                end
            end
            if keyboard_pressed
                no_break=1;
            end
        end
        pressbutton;
    elseif i==5
        HideCursor
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
        WaitSecs(.1);
        pressbutton;
    elseif i ==6
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        Screen('DrawTexture',wd,img.feedback{2},[],prep.draw.rect.stim{1} + rescale);
        Screen('DrawTexture',wd,img.feedback{1},[],prep.draw.rect.stim{2} + rescale);
        WaitSecs(.1);
        pressbutton;
    elseif i==7
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        Screen('DrawTexture',wd,img.stim{1},[],prep.draw.rect.stim{1});
        Screen('DrawTexture',wd,img.stim{2},[],prep.draw.rect.stim{2});
        WaitSecs(.1);
        pressbutton;
    else
        disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
        WaitSecs(.1);
        pressbutton;
    end
    

end

disptxt(txt{end},wd,wdw,wdh,0,0,white,0,1);
WaitSecs(0.2);
KbWait;
blackscreen;
WaitSecs(.1);



