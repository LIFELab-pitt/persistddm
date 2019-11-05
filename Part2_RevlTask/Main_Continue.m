clearvars
Y = 'Y';
y= 'Y';
Yes = 'Y';
No = 'N';
N = 'N';
n= 'N';
skip = 'no';


sID=input('Subject''s ID? (Please enter 3 numbers (ex 099)):  ');
if exist(sprintf('data/tutorialRevLearn_low_s%d_data.mat', sID)) || exist(sprintf('data/tutorialRevLearn_high_s%d_data.mat', sID))
    cont = input('Would you like to continue where you left off?(Y/N)');
    if strcmp(cont, 'Y')
        skip ='yes';
        disp('Starting from where you left off');
    else
        disp('Please enter a new subject number')
        return;
    end       
else
    disp('Starting the task');
end
if ~strcmp(skip, 'yes')
    revlRunPractice(sID)
    clearvars -except sID skip;
end
revlRun(sID, skip)