%% Draw foot
% function DrawFoot(JointPos0, FootCorner0, JointAngle)
% [~,~,FootCorner, ~] = NaoForwardKinematicsFullBody(JointPos0, JointAngle, FootCorner0);
% FootCorner(5,:,1) = FootCorner(1,:,1);
% FootCorner(5,:,2) = FootCorner(1,:,2);
% plot3(FootCorner(:,1,1),FootCorner(:,2,1),FootCorner(:,3,1),'b-','LineWidth',3); hold on;
% plot3(FootCorner(:,1,2),FootCorner(:,2,2),FootCorner(:,3,2),'b-','LineWidth',3); hold on;
% view([90,90]); axis equal; xlabel('x (mm)'); ylabel('y (mm)');box on;
% xlim([-100,150]);ylim([-150,50]);zlim([-5,5]);set(gca,'FontSize',10);
% end
%% Draw foot
function DrawFoot(JointPos0, FootCorner0, JointAngle)
[~,~,FootCorner, ~] = NaoForwardKinematicsFullBody(JointPos0, JointAngle, FootCorner0);
plot3(FootCorner(:,1,1),FootCorner(:,2,1),FootCorner(:,3,1),'b-','LineWidth',3); hold on;
plot3(FootCorner(:,1,2),FootCorner(:,2,2),FootCorner(:,3,2),'b-','LineWidth',3); hold on;
%view([90,90]); axis equal; xlabel('x (mm)'); ylabel('y (mm)');box on;
%xlim([-100,150]);ylim([-150,50]);zlim([-5,5]);set(gca,'FontSize',10);
end