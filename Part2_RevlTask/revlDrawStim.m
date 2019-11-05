function wd = revlDrawStim(wd,prep,cond,data,t,img, win)

%==========================================================================
% Code for drawing the different stimulus events. 
% - cond = 1 draw stimulus
% - cond = 2 draw stimulus + feedback
%
% Hanneke den Ouden 
% Donders Institute for Brain, Cognition and Behaviour
% h.denouden@gmail.com
% 
% version 11-08-2015
%==========================================================================

% draw fixation cross.
%drawfix

% draw stimuli at specified locations.
for iCue = 1:prep.nStim
    location = prep.locs(t,iCue); 
    if win == true
        Screen('DrawTexture',wd,img.stim{iCue},[],prep.draw.rect.stim{location});
    elseif win == false
        Screen('DrawTexture',wd,img.stim{iCue+2},[],prep.draw.rect.stim{location});
    end
end


% draw choice.
if cond > 0 
    choiceLoc = prep.locs(t,data.choice(t));
    if win == true
        Screen('DrawTexture',wd,img.select{data.choice(t)},[],prep.draw.rect.stim{choiceLoc});
    elseif win == false
        Screen('DrawTexture',wd,img.select{data.choice(t)+2},[],prep.draw.rect.stim{choiceLoc});        
    end
end

% draw feedback: for 0, get punish feedback, for 1, get reward feedback
if cond > 1 
    if win == true
        fbimg = img.feedback{data.outcome(t)+1};
    elseif win == false
        if data.outcome(t) ==0 
            fbimg = img.feedback{1};
        elseif data.outcome(t) == -1
            fbimg = img.feedback{3};
        end
    end
    Screen('DrawTexture',wd,fbimg,[],prep.draw.rect.stim{5});
end
