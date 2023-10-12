function NaoCheckVis(Traj, COM_Lim, COM_Loc, FootCorner0, opt)
NaoInitial;
FootCorner0 = FootCorner_Correct;
% f = figure;
set(gcf,'Position',[10,10,1400,600])
for i = 1:size(Traj,2)
    subplot(1,2,1)
    q_temp = Traj(:,i);
    JointAngle = JointAngleAssign(q_temp);
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0);
    [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    [~, ~, ConvexC] = NaoStaticStable(FootCorner, Com);
    [CollisionFlag, ~, CollisionPoint] = NaoCollision(CollisionPair,JointPos,LinkRadians,EndeffLoc);
    NaoVisualize(JointPos, R, FootCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 1, 1, 0, 0, 1);
%     view([122,26]);title(i)
view([66,35]);title(i)
    drawnow; hold off
    subplot(1,2,2)
    q_temp = Traj(:,i);
    JointAngle = JointAngleAssign(q_temp);
    [R,JointPos,~, ~] = NaoForwardKinematics(JointPos0, JointAngle, FootCorner0);
    [Com,~] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    plot3(FootCorner0(:,1),FootCorner0(:,2),FootCorner0(:,3),'r-'); hold on;
    plot3(FootCorner0(:,1),FootCorner0(:,2)-100,FootCorner0(:,3),'g-'); hold on;
    fill3(FootCorner0(:,1),FootCorner0(:,2),FootCorner0(:,3),'r'); hold on;
    fill3(FootCorner0(:,1),FootCorner0(:,2)-100,FootCorner0(:,3),'g'); hold on;
    plot3(Com(1),Com(2),1,'mo','MarkerFaceColor','m','MarkerSize',10);
    for ii = 1:size(COM_Lim,1)
        Bound_xR = [COM_Lim(ii,1,1);COM_Lim(ii,2,1);COM_Lim(ii,2,1);COM_Lim(ii,1,1)];
        Bound_yR = [COM_Lim(ii,2,2);COM_Lim(ii,2,2);COM_Lim(ii,1,2);COM_Lim(ii,1,2)];
        Bound_zR = ones(size(Bound_xR));
        fill3(Bound_xR, Bound_yR, Bound_zR,'y'); hold on
        plot3(COM_Loc(ii,1),COM_Loc(ii,2),1,'mo'); hold on
    end
    
    axis equal; view([-90,90]);
    drawnow; hold off;
    if opt == 1
     pause;
    end
end
end