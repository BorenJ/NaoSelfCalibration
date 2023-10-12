function NaoCheckVisTestSimple(Traj, JointPos0, FootCorner0, Mass, MassLoc0, CollisionPair, LinkRadians, opt)
for i = 1:size(Traj,2)
    q_temp = Traj(:,i);
    JointAngle = JointAngleAssign(q_temp);
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0);
    [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    [~, ~, ConvexC] = NaoStaticStable(FootCorner, Com);
    [CollisionFlag, ~, CollisionPoint] = NaoCollision(CollisionPair,JointPos,LinkRadians,EndeffLoc);
    NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 1, 1, 0, 0, 1);
%     view([83,27]);title(i)
%     view([113,25]);
    view([90,-90]);
    title(i);
    drawnow; hold off
    
    if opt == 1
        pause;
    end
end
end