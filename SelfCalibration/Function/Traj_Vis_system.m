function Traj_Vis_system(Traj, opt)
f = figure;
set(f,'Position',[10,10,1400,600])
NaoInitial;
% CoM Attractive and Repulsive Cost

for ii = 1:size(Traj,1)
    %q_temp = Traj(ii,9:end);
    q_temp = Traj(ii,:);
    JointAngle = JointAngleAssignLeg(q_temp);
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematicsFullBody(JointPos0, JointAngle, FootCorner0);
    [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    [~, ~, ConvexC] = NaoStaticStable(FootCorner, Com);
    [CollisionFlag, ~, CollisionPoint] = NaoCollision(CollisionPair,JointPos,LinkRadians,EndeffLoc);
    NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 1, 1, 0, 0, 1);
    
    view([110,35]);title(ii); axis equal;
    drawnow;  hold off
    
    if opt == 1
        pause;
    end
end
end