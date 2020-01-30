sID=input('Subject''s ID? (Please enter 4 numbers (ex 0999)):  ');
%if exist(sprintf('data/tutorialRevLearn_low_s%d_data.mat', sID)) || exist(sprintf('data/tutorialRevLearn_high_s%d_data.mat', sID))
 %   disp('There is already data, please either enter a new subject number or run Main_Continue')
 %   return;
%end

if length(sID ~= 4)
	sID=input('ID is not 4 digits, please re-enter the ID with the correct length (ex. 0999): ');

end

revlRunPractice(sID)
clearvars -except sID;
%skip = "no";
revlRun(sID)
