import java.awt.Robot;
mouse = Robot;
mouse.mouseMove(centre(1), 1000);

[theX,theY] = GetMouse;
thePoints = [theX theY];
sampleTime = 0.01;
startTime = GetSecs;
nextTime = startTime+sampleTime;
tooLong = false;
   while 1
       [x,y,buttons] = GetMouse;
       if ((buttons(1) && (IsInRect(x,y, [15,0,285,270]) || IsInRect(x,y, [1635,0,1905,270]))) || tooLong ==true)
           break;
       elseif (GetSecs > nextTime)
           thePoints = [thePoints ; x y];
           nextTime = nextTime+sampleTime;
       end
       tooLong = (GetSecs -startTime) > 4;
   end
if exist(sprintf('data/mousetracking/subject%d',sID)) ==0
    mkdir(sprintf('data/mousetracking/subject%d',sID));
end
a=sprintf('data/mousetracking/subject%d/mousetrial%d', sID, t);
csvwrite(a, thePoints);
HideCursor;
   %plot(thePoints(:,1),-thePoints(:,2));
%Add paths in order to save each to the proper subject and trial.