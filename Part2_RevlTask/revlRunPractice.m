function revlRun(sID)
% FUNCTION revlRun(sID)
% 
% This is the main code that runs the reversal task described below and
% will plot and save data to the 'data' subfolder. This code uses the
% PsychToolbox software (psychtoolbox.org): 
%
% sID: a number between 001 and 999. 
%
% TASK DESCRIPTION:
% 2 slot machines were presented on every trial, each associated with a
% certain probability of reward. The payout probabilities for the slot
% machines were coupled. There is always one 'good' option and one 'bad'
% option. The default implementation of the payout probability is 70% for
% the high reward machine and 30% for the low reward machine. 
% At various points during the task the identity of the high and low reward
% machines are reversed. Subjects have to continuously keep track which
% machine is currently best. 
% There are 2 versions of the task: 
% 1. high volatile: reward probability changed often, every 10-20 trials  
% 2. low volatile: reward probability changed  rarely, every 25-35 trials. 
% To counterbalance, the subject number determines which version of the
% task subjects get:
% - odd subject numbers: high volatility (volatile) condition
% - even subject numbers: low volatility (stable) condition.  
% 
% The parameters of the reversal are set in the revlParams.m file, which
% include the block length, feedback probability and total experiment
% length. These can be changed. 
% 
% Hanneke den Ouden 
% Donders Institute for Brain, Cognition and Behaviour
% h.denouden@gmail.com
% 
% version 11-08-2015
%==========================================================================

% Debugging: if turned on, task will not be displayed full screen
debug = 0;
% debug       = input('debug mode? (1 = yes, 0 = no): ');

% A.    Getting started
%--------------------------------------------------------------------------
revlSetPaths; 
% run and load prep file
prep = revlParamsPractice(sID,true);

% Set stuff up (files, variables etc.), start PTB - Screen. 
revlPracticeSetup

% Present instructions. Subject presses key to continue.
revlInstrWin
WaitSecs(1);
%drawfix;

Screen('Flip', wd);
if ~debug
    WaitSecs(2);
end

% A. Loop over all trials.
%--------------------------------------------------------------------------
aborted = false;
Coin_Count=0;
Coins_Lost=0;
for t = 1:20
    % C.2.1     Start of t: draw the stimuli according to t. This draws a
    % fixation cross with a stimulus on both sides:
    %MOUSETRACKING GOES HERE?
    if(t==11)
        winCoinCounter
        revlInstrLose
    end
 
    if (t>0 && t < 11)
        win = true;
    else
        win = false;
    end

    
    wd = revlDrawStim(wd, prep, 0, [],t,img, win);
    tm.stim(t) = Screen(wd, 'Flip');
    ShowCursor('Hand')
    import java.awt.Robot;
    mouse = Robot;
    mouse.mouseMove(centre(1), 1000);
    % Choice: wait until one has been selected or trial aborted, then draw
    % the stim again, but this time with the frame around the selected one
    %CHANGE FOLLOWING CODE TO USE MOUSE INPUT AS LOGIC CONTROL
    nobreak = 0;
    startTime = GetSecs;
    while nobreak == 0
        %escape button code is not working properly. Please fix later
        %[keyIsDown] = KbCheck;
        %if keyIsDown ==1
        %    [keyCode] =KbWait;
        %    a=find(keyCode);
        %    if length(a) ==1
        %        if(a== prep.abort)
        %            tm.choice(t) = GetSecs;
        %            nobreak=1;
        %        end
        %    else
        %        continue;
        %    end
        %[keyCode]  = KbWait; (This doesn't work due to the function
        %waiting until a key is pressed)
        %[keyCode] = KbCheck;
        %a = find(keyCode);
        %if length(a)==1
        %    if(a == prep.abort)
        %        tm.choice(t)  = GetSecs;
        %        nobreak = 1;
        %    end
        %end
        [x,y,buttons] = GetMouse;
        tooLong = (GetSecs -startTime) > 4; 
        if (buttons(1) ==1 && (IsInRect(x,y, [15,0,285,270]) || IsInRect(x,y, [1635,0,1905,270])) || tooLong==true)
            tm.choice(t) =GetSecs;
            if (IsInRect(x,y, [15,0,285,270]) && buttons(1)==1)
                nobreak=1;
                data.choice(t) = find(prep.locs(t,:) == 1);
            elseif (IsInRect(x,y, [1635,0,1905,270]) && buttons(1)==1)
                nobreak=1;
                data.choice(t) = find(prep.locs(t,:) ==2);
            else
                nobreak=1;
                data.choice(t) = nan;
                win = nan;
            end
        end
    end
    
    %if a == prep.abort
    %    abd = 'You have aborted the game';
    %    [wt] = Screen('TextBounds',wd,abd);
    %    xpos = round(wdw/2-wt(3)/2);
    %    ypos = round(wdh/2-wt(4)/2);
    %    Screen('Drawtext',wd,abd,xpos,ypos,prep.draw.white);
    %    Screen('flip', wd,[]);
    %    WaitSecs(1);
    %    % break out of trial-loop.
    %    break
    %end
    if win== true
        data.outcome(t) =  prep.feedback(t,data.choice(t));
        Coin_Count = Coin_Count + data.outcome(t);
    elseif win == false
        data.outcome(t) = - prep.feedback(t, data.choice(t));
        Coins_Lost = Coins_Lost - data.outcome(t);
    else 
        data.outcome(t)= nan;
    end
    % check if valid response (within boxes).
    % -----------------------------------------------------------------
    % determine feedback.
    if ~isnan(win)
        wd = revlDrawStim(wd,prep,1,data,t,img, win);
        Screen(wd, 'Flip');
    end
    
    % Prepare the outcome.
    if ~isnan(win)
        wd = revlDrawStim(wd,prep,2,data,t,img, win);
    end
    
    % Wait for cue-outcome interval time, then present the outcome.
    WaitSecs('UntilTime', tm.choice(t) + prep.time.coi);
    if ~isnan(win)
        tm.outcome(t) = Screen(wd, 'Flip');
    end
    
    % Make screen to black before switching to the next t. Record when
    % the screen flips to black. Note that the outcome is always onscreen
    % for the duration prep.time.iti, so that it's not shown longer for
    % the juice ts.
    %If desired post-trial draw fix duration can be extended.
    %drawfix;
    if ~isnan(win)
        WaitSecs('UntilTime',tm.outcome(t) + prep.time.iti-prep.time.black);
        Screen(wd, 'Flip');
    else
        WaitSecs('UntilTime',GetSecs + prep.time.iti);
        Screen(wd, 'Flip');
    end
    data.RT=tm.choice-tm.stim;
    if ~isnan(win)
        data.totalReward = nansum(data.outcome);
    end
    data.trialnum = t;
    
    % wait for start of new trial.
    if ~isnan(win)
        WaitSecs('UntilTime',tm.outcome(t) + prep.time.iti);
    else
        WaitSecs('UntilTime',GetSecs + prep.time.iti)
    end
    
end % end of trial loop.
%data.RT=tm.choice-tm.stim;
%data.totalReward = nansum(data.outcome);

loseCoinCounter


% D   Save and wrap things up.
%--------------------------------------------------------------------------
Screen('FillRect',wd,prep.draw.black);
Screen(wd,'Flip');
HideCursor;
WaitSecs(1);
%data.today = today;
%data.tm = tm;
%data.prep = prep;

% save data. If dataFile already exists, create unique dataFile. 
%if exist(dataFile,'file') % subject exists already
    %randAttach = round(rand*10000);
    %dataFile = sprintf('Practice_%s_%04.0f.mat',dataFile(1:end-4),randAttach);
%end
%save(dataFile,'data');

% give feedback .
text =  sprintf('Congratulations, you have completed the tutorial!');
[wt] = Screen('TextBounds',wd,text);
xpos = round(wdw/2-wt(3)/2);
ypos = round(wdh/2-wt(4)/2);
Screen('Drawtext',wd,text,xpos,ypos,prep.draw.white);
Screen('flip', wd,[]);
WaitSecs(2)

% Thank subjects.
text =  'Thank you for participating';
[wt] = Screen('TextBounds',wd,text);
xpos = round(wdw/2-wt(3)/2);
ypos = round(wdh/2-wt(4)/2);
Screen('Drawtext',wd,text,xpos,ypos,prep.draw.white);
Screen('flip', wd,[]);

WaitSecs(1);
Screen('CloseAll');
clear Screen

% plot data
end

