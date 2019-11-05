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
txt{1}    = {'WELCOME TO THE ARCADE GAME!'};
txt{2}    = {'On each round, you will see two machines of different colors,',...
    'one on each side of the screen.',...
    'Use the mouse to click on the machine that you want to play.'...
    'After clicking on the machine, it will either give you a coin or nothing'};
txt{3}    = {'One machine wins more coins than the other one.',...
    'The goal of the game is to collect the most coins!'};
txt{4} = {'Sometimes, the machine that wins more coins,', ... 
    'might change during the game.',...
    'BUT your job is to always try to collect the most coins.'};
txt{5}= {'It is important to realize that ONLY THE COLOR', ... 
    'of the machine matters',...
    'NOT the location of the machine, or your previous choices.'};
txt{6}= {'Lets review the rules of the game!'};
txt{7} = {'Great job!',...
    ' ','Good luck!',...
    ' ','Press any key to start the game.'};
HideCursor;
% display the texts; changed WaitSecs(2) to (.5)
for i  = 6:numel(txt)-1
    disptxt(txt{i},wd,wdw,wdh,1,0,white,0,1);
    WaitSecs(.1);
    pressbutton;
end

disptxt(txt{end},wd,wdw,wdh,0,0,white,0,1);
WaitSecs(0.2);
KbWait;
blackscreen;
WaitSecs(.1);


