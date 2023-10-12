clear; clc; close all;

%% Load data
load('/home/rick/NaoSelfCalibration/Code/Data/posture.mat');
load('/home/rick/NaoSelfCalibration/Code/Data/WholeTraj.mat');

%% Initialize nao
NaoInitial;

%% Posture Generation 




%% Check the result
writerObj = VideoWriter('/home/rick/NaoSelfCalibration/Code/Data/Self-Calibration.avi','Uncompressed');
writerObj.FrameRate = 4;
open(writerObj);
f = figure; set(f,'Position',[10,10,1200,600],'color','w');
f = figure;
set(f,'Position',[10,10,1400,600])
for i = 1:size(Traj_Full,2)
    q_temp = Traj_Full(:,i);
    JointAngle = JointAngleAssign(q_temp);
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0);
    [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    [StableFlag, StabilityFlag, ConvexC] = NaoStaticStable(FootCorner, Com);
    [CollisionFlag, Dist, CollisionPoint] = NaoCollision(CollisionPair,JointPos,LinkRadians,EndeffLoc);
    subplot(1,2,1)
    NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 0, 1, 1, 0, 0);
    title('Link/Joint Mass and COM location')
    view([122,26]); drawnow; hold off
    subplot(1,2,2)
    NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 0, 1, 0, 0, 1);
    title('Self-collision/Ground-collision avoidance')
    view([122,26]); drawnow; hold off
    currFrame = getframe(f);
    writeVideo(writerObj, currFrame);
end
close(writerObj);

