% Get paths
taskPath = fileparts(which('revlRun'));
dataPath = fullfile(taskPath,'data'); % where our data is stored
rootdir = taskPath(1:end); % directory in which you put RL_tutorial_main
addpath(fullfile(rootdir,'util')); % some helper functions