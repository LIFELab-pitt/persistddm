

screenNum = 0; % select monitor
clrdepth  = 32; % colour settings monitor
tmp = get(0, 'ScreenSize');
wdw = tmp(3);
wdh = tmp(4);


stimulus_distance   = wdh*.75; %Changed value to .75 previously .2; OR 175 distance of the stimuli from the centre
slot_size     = round(wdh/7); %Changes size of slotsF OR 85
coin_size    = round(wdh/17);%Changes size of Coin OR 45
coin_frame    = coin_size+round(0.01*wdh); % 'radius' of the square outside of the pie
window_frame   = 5;
% Colors settings square frame
drawgrey      = [180 180 180];
drawdarkgrey  = [100 100 100];
drawwhite     = [255 255 255];
drawcolFrame  = [200 200 200];
    
% Text details
drawfont      = 'Helvetica';
drawtxtsize   = 28;

pic_path = fullfile(fileparts(fileparts(which('getpictures'))),'psychtoolbox_testing','Pictures'); 
slotsF{1} = fullfile(pic_path,'slot1_up.jpg'); % blue
slotsF{2} = fullfile(pic_path,'slot2_up.jpg'); % orange
slotsF{3} = fullfile(pic_path,'slot1_down.jpg'); % blue
slotsF{4} = fullfile(pic_path,'slot2_down.jpg'); % orange
slotsF{5} = fullfile(pic_path,'slot1_up_brown.jpg'); % brown
slotsF{6} = fullfile(pic_path,'slot2_up_purple.jpg'); % purple
slotsF{7} = fullfile(pic_path,'slot1_down_brown.jpg'); % brown
slotsF{8} = fullfile(pic_path,'slot2_down_purple.jpg'); % purple

coinF{1}    = importdata(fullfile(pic_path,'noeuro.jpg'));  % feedback
coinF{2}    = importdata(fullfile(pic_path,'euro.jpg')); % feedback
coinF{3}    = importdata(fullfile(pic_path, 'red.jpg')); %loss feedback




for t = 1:length(slotsF)
    slots{t}    = importdata(slotsF{t});
end

Screen('Preference', 'Verbosity', 0);
PsychDefaultSetup(2);
wd = Screen('OpenWindow', 0, [0 0 0], []);

Screen(wd,'TextStyle',1); % Bold
Screen(wd,'TextFont',drawfont);
Screen(wd,'TextSize',drawtxtsize);
black       = BlackIndex(wd);
white       = WhiteIndex(wd);


%%%%%%%%%
[wdw, wdh]      = Screen('WindowSize', wd);
centre          = round([wdw/2, wdh/2]);
dist            = stimulus_distance;
loc1            = [centre(1)-dist, centre(2)*.25]; %previously centre(2); centre of pie 1: centre left.
loc2            = [centre(1)+dist, centre(2)*.25]; %previously centre(2); centre of pie 2: centre right.
loc5            = centre; % centre of screen: feedback.

rectStim{1}          = [(loc1(1)-slot_size) (loc1(2)-slot_size) ...
    (loc1(1)+slot_size) (loc1(2)+slot_size)]; %rectangle defining image left
rectStim{2}          = [(loc2(1)-slot_size) (loc2(2)-slot_size) ...
    (loc2(1)+slot_size) (loc2(2)+slot_size)]; %rectangle defining image right
rectStim{5}          = [(loc5(1)-coin_size) (loc5(2)-coin_size) ...
    (loc5(1)+coin_size) (loc5(2)+coin_size)]; %rectangle defining feedback
rectFrame{1}         = [(loc1(1)-coin_frame) (loc1(2)-coin_frame) ...
    (loc1(1)+coin_frame) (loc1(2)+coin_frame)];
rectFrame{2}         = [(loc2(1)-coin_frame) (loc2(2)-coin_frame) ...
    (loc2(1)+coin_frame) (loc2(2)+coin_frame)]; 

drawloc{1}    = loc1;
drawloc{2}    = loc2;
drawloc{5}    = loc5;
drawrectStim{1}   = rectStim{1};
drawrectStim{2}   = rectStim{2};
drawrectStim{5}   = rectStim{5};
drawrectFrame{1}   = rectFrame{1};
drawrectFrame{2}   = rectFrame{2};
drawblack     = black;
drawwhite     = white;
drawwdw       = wdw;
drawwdh       = wdh;
drawx0        = round(wdw/2);
drawy0        = round(wdh/2);
top                 = round(wdh/12); % location of the top of the text
preptop            = top;

% make the textures for the feedback
imgfeedback{1}   = Screen('MakeTexture',wd,coinF{1});
imgfeedback{2}   = Screen('MakeTexture',wd,coinF{2});
imgfeedback{3}   = Screen('MakeTexture', wd, coinF{3});

% make the textures for the stimuli
for j = 1:2
    imgstim{j}   = Screen('MakeTexture',wd,slots{j});
    imgselect{j}      = Screen('MakeTexture',wd,slots{j+2});
end
for k = 3:4
    imgstim{k}   = Screen('MakeTexture',wd,slots{k+2});
    imgselect{k}      = Screen('MakeTexture',wd,slots{k+4});
end
% present black screen for 1 sec before starting
Screen('FillRect',wd,black);
Screen('Flip', wd);
%%%%%%%%



txt{1}    = {'Welcome to the arcade game!'};
txt{2}    = {'Your mission is to collect as many coins as you can',...
    'The more coins you collect during the game, the more money you will win when the game is over.'...
    'So always try your best!'};
txt{3}    = {'There are many levels to the game.',...
    'In some levels you can win coins and in some levels you can lose coins,'...
    'so pay close attention to which level you are in'};
txt{4} = {'First, let''s review what happens in the win levels', ... 
    'On each round, you will see two machines of different colors,',...
    'one on each side on the screen.'};
txt{5}= {'Use the mouse to click on the machine that you want to play', ... 
    'After clicking the machine, you will either win a coin or nothing',...
    'One machine wins more coins than the other one'};
txt{6}= {'The goal of the win levels is to win as many coins as you can',...
    'Sometimes, the machine that wins more coins may change during the level'...
    'BUT your job is to always try to win the most coins'};
txt{7} = {'It is important to realize that ONLY THE COLOR of the machine matters,',...
    'NOT the location of the machine or your previous choices'};
txt{8} = {'You will only have 4 seconds to choose a machine',...
    'So choose one quickly!'};
txt{9} = {'Let''s review the rules for the win levels!'};
txt{10} = {'Great job!',...
    'Let''s play a practice round of the win level'};

for i  = 1:numel(txt)-1
    if i==3
        Screen('DrawTexture',wd,imgstim{1},[],drawrectStim{1});
        Screen('DrawTexture',wd,imgstim{2},[],drawrectStim{2});
    end
    if i==4
        Screen('DrawTexture',wd,imgstim{3},[],drawrectStim{1});
        Screen('DrawTexture',wd,imgstim{4},[],drawrectStim{2});
    end
    if i==5
        Screen('DrawTexture',wd,imgfeedback{1},[],drawrectStim{1});
        Screen('DrawTexture',wd,imgfeedback{3},[],drawrectStim{1});
    end
    if i==6
        Screen('DrawTexture',wd,imgfeedback{3},[],drawrectStim{1});
        Screen('DrawTexture',wd,imgfeedback{3},[],drawrectStim{1}); 
    end
    tekst = 'Press any key to continue';
    [wt]=Screen(wd,'TextBounds',tekst);
    Screen('Drawtext',wd,tekst,wdw*0.38,wdh-(top+2*drawtxtsize),white);
    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
    WaitSecs(0.2)
    while true % using keyboard.
        [~,keyCode,~]= KbWait;
        break
    end
    WaitSecs(.1);
end

while(nobreak ==0)
[x,y]=GetMouse
WaitSecs(.4);
end


