sID=input('Subject''s ID? (Please enter 3 numbers (ex 099)):  ');
%if exist(sprintf('data/tutorialRevLearn_low_s%d_data.mat', sID)) || exist(sprintf('data/tutorialRevLearn_high_s%d_data.mat', sID))
 %   disp('There is already data, please either enter a new subject number or run Main_Continue')
 %   return;
%end
revlRunPractice(sID)
clearvars -except sID;
%skip = "no";
revlRun(sID)