%%%%%%%%%%%%%%%%% Code made by Rick Han on 5-10-2019 %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Update Joint Position by Robot foward kinematics %%%%%%%%%%%%%%%%%
%%%%%%%%%%% Output: configuration wrt. the torso frame %%%%%%%%%%%%%%%%%%%%

function [R,JointPos,FootCorner,EndeffLoc] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0)

% Initialize the output matrix
JointPos = zeros(size(JointPos0));
R = zeros(3,3,length(JointPos0));
FootCorner = zeros(size(FootCorner0));
EndeffLoc = zeros(5,3);

%% Forward kinematics wrt. the initial torso frame
% Torso --> Head
JointPos(1,:) = JointPos0(1,:);
R(:,:,1) = eye(3,3);
JointPos(2,:) = JointPos(1,:) + (R(:,:,1)*(JointPos0(2,:)-JointPos0(1,:))')';
R(:,:,2) = R(:,:,1)*rotz(JointAngle(2,1))*roty(JointAngle(2,2));

% RShoulder --> RElbow --> RWrist
R(:,:,3) = roty(JointAngle(3,2))*rotz(JointAngle(3,1));
R(:,:,4) = R(:,:,3)*rotx(JointAngle(4,3))*rotz(JointAngle(4,1));
R(:,:,5) = R(:,:,4)*rotx(JointAngle(5,3));
JointPos(3,:) = JointPos0(3,:);
JointPos(4,:) = JointPos(3,:) + (R(:,:,3)*(JointPos0(4,:)-JointPos0(3,:))')';
JointPos(5,:) = JointPos(4,:) + (R(:,:,4)*(JointPos0(5,:)-JointPos0(4,:))')';

% LShoulder --> LElbow --> LWrist
R(:,:,6) = roty(JointAngle(6,2))*rotz(JointAngle(6,1));
R(:,:,7) = R(:,:,6)*rotx(JointAngle(7,3))*rotz(JointAngle(7,1));
R(:,:,8) = R(:,:,7)*rotx(JointAngle(8,3));
JointPos(6,:) = JointPos0(6,:);
JointPos(7,:) = JointPos(6,:) + (R(:,:,6)*(JointPos0(7,:)-JointPos0(6,:))')';
JointPos(8,:) = JointPos(7,:) + (R(:,:,7)*(JointPos0(8,:)-JointPos0(7,:))')';

% RHip45 --> RHip --> RKnee --> RAnkle
R(:,:,9) = eye(3,3);
R(:,:,10) = R(:,:,9)*rotx(JointAngle(10,3))*roty(JointAngle(10,2));
R(:,:,11) = R(:,:,10)*roty(JointAngle(11,2));
R(:,:,12) = R(:,:,11)*roty(JointAngle(12,2))*rotx(JointAngle(12,3));
JointPos(9,:) = JointPos0(9,:);
JointPos(10,:) = JointPos(9,:) + (R(:,:,9)*(JointPos0(10,:)-JointPos0(9,:))')';
JointPos(11,:) = JointPos(10,:) + (R(:,:,10)*(JointPos0(11,:)-JointPos0(10,:))')';
JointPos(12,:) = JointPos(11,:) + (R(:,:,11)*(JointPos0(12,:)-JointPos0(11,:))')';

% LHip45 --> LHip --> LKnee --> LAnkle
R(:,:,13) = eye(3,3);
R(:,:,14) = R(:,:,13)*rotx(JointAngle(14,3))*roty(JointAngle(14,2));
R(:,:,15) = R(:,:,14)*roty(JointAngle(15,2));
R(:,:,16) = R(:,:,15)*roty(JointAngle(16,2))*rotx(JointAngle(16,3));
JointPos(13,:) = JointPos0(13,:);
JointPos(14,:) = JointPos(13,:) + (R(:,:,13)*(JointPos0(14,:)-JointPos0(13,:))')';
JointPos(15,:) = JointPos(14,:) + (R(:,:,14)*(JointPos0(15,:)-JointPos0(14,:))')';
JointPos(16,:) = JointPos(15,:) + (R(:,:,15)*(JointPos0(16,:)-JointPos0(15,:))')';

%% Whole body rotation and translation to the left foot center frame
% Get the rotation matrix defining the left foot body frame, which = the
% frame of the LAnkle
LfootR_temp = R(:,:,16);

% Rotate all the rotation matrix
for i = 1:length(R)
    R(:,:,i) = LfootR_temp\R(:,:,i);
end

% Rotate all the joints to the new LFoot frame
JointPos = (LfootR_temp\JointPos')';

% Get the translation between the torso and the center of the left foot
T = JointPos(16,:) + (R(:,:,16)*[0,0,-45.19]')'-JointPos(1,:);

% Translate all the joint location according to the above translation
JointPos = JointPos - repmat(T,length(JointPos),1);

%% Get the updated endeffector location (Note head center is only for drawing)
EndeffLoc(1,:) = JointPos(2,:)+(R(:,:,2)*[0, 0,  57.2050]')';     % Head  Center (Whole Height - NeckPos)/2
EndeffLoc(2,:) = JointPos(5,:)+(R(:,:,5)*[57.75, 0,  -12.31]')';   % RHand Center (Thumb1)
EndeffLoc(3,:) = JointPos(8,:)+(R(:,:,8)*[57.75, 0,  -12.31]')';   % LHand Center (Thumb1)
EndeffLoc(4,:) = JointPos(12,:)+(R(:,:,12)*[0,0,-45.19]')';       % RFoot Center
EndeffLoc(5,:) = JointPos(16,:)+(R(:,:,16)*[0,0,-45.19]')';       % LFoot Center

%% Construct the feet polygons
% Get the translation between right foot center to the left foot center
RFootT = EndeffLoc(4,:);
FootCorner(:,:,1) = (R(:,:,12)*FootCorner0')' + repmat(RFootT,length(FootCorner0),1);
FootCorner(:,:,2) = (R(:,:,16)*FootCorner0')';
end
