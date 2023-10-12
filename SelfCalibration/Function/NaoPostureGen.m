%%%%%%%%%%%%%%%%%%%% Code made by Rick Han on 5/10/2019 %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Generate Posture %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

%% Initialize Nao configuration and sweep parameters
NaoInitial;                                            % Initialize the Nao parameters
[JointLim0, JointLim1] = JointAngleLimGeneration(5);   % Initialize the Nao jointlim
s = 15;                                                % Sweep using 20 deg increment
SampleNum = 1000;
countNum = 200;
%% Set up video option
MakeVideo = 1; %1 save video to the default directory

if MakeVideo == 1
    f = figure;
    set(f,'Position',[0,0,1800,700]);
    vidObj = VideoWriter('/home/rick/Dropbox/Nao Quasi-static/Data/6-20-2019/Posture_25deg_safe.avi');
    vidObj.FrameRate = 10;
    open(vidObj);
end

%% Find the joint movable
JointLim = JointLim0 + JointLim1;   % Add two matrix together to get which joint angle are related
Joint_Count = find(JointLim~=0)';    % Get the workable joint angles
Vec = cell(length(Joint_Count),1);  % Construct the vector for later usage

for i = 1:length(Joint_Count)
    Vec{i} = JointLim0(Joint_Count(i)):s:JointLim1(Joint_Count(i));
end

JointComb0 = combvec(Vec{1},Vec{2},Vec{3},Vec{4},Vec{5},Vec{6},Vec{7},Vec{8},Vec{9},Vec{10},Vec{11}); % All combination: need manual input
JointComb = zeros(size(JointComb0,1),countNum);                   % JointComb Saving Matrix
COMComb = zeros(3,countNum);                                      % COM save matrix

Samples = randi(size(JointComb0,2),[1,SampleNum]);

count = 0;
for i = Samples
    % Assign each case to this JointAngle
    JointAngle = JointAngle0;
    JointAngle(Joint_Count) = JointComb0(:,i);
    
    JointAngle(30:32) =  JointAngle(26:28);  % Two legs pitch are symmetric
    
    % For each obtained joint angle option, check the stability
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0);
    Collision = NaoCollisionCheck(JointPos, EndeffLoc, FootCorner(:,:,2));
    
    if Collision ~= 0 %% Only save the postures satisfy collision checking
        continue
    else
        [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
        [StableFlag, FootFlag, ConvexC] = NaoStaticStable(FootCorner, Com);
        
        if StableFlag == 1 && Com(1)<85 && Com(1)>20
            count = count + 1;
            disp(count);
            
            if count > countNum
                break
            end
            
            COMComb(:,count)   = Com; 
            JointComb(:,count) = JointComb0(:,i);   
            
            % Make video if needed
            if MakeVideo == 1
                subplot(1,2,1)
                NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, 0, 1, 0, StableFlag)
                title(['Posture',' ',num2str(count)]);view([124,24]);hold off
                subplot(1,2,2)
                NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, 0, 1, 0, StableFlag)
                title(['Posture',' ',num2str(count)]);view([90,42]);
                drawnow;currFrame = getframe(f); writeVideo(vidObj, currFrame);hold off;
            end
        end
    end
end

COMComb = COMComb';
COMComb(:,2) = COMComb(:,2)+50; 
JointComb = JointComb';
JointComb = [JointComb(:,1:9),JointComb(:,7:9),JointComb(:,10:11)];

if MakeVideo == 1
    close(vidObj);close all
end

% save('/home/rick/Dropbox/Nao Quasi-static/Data/6-20-2019/Posture_15deg.mat','COMComb','JointComb','-v7.3');
% csvwrite('/home/rick/Dropbox/Nao Quasi-static/Data/6-20-2019/posture.csv',JointComb);
% csvwrite('/home/rick/Dropbox/Nao Quasi-static/Data/6-20-2019/COM.csv',COMComb);