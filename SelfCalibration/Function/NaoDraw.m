%%%%%%%%%%%%% Function made by Rick on 2-26-2019 %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Visualize Nao %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function NaoDraw(JointPos, FootCorner, EndeffLoc)
%% Draw joints/coordinates
for i = 1:length(JointPos)
    % Draw joint location
    plot3(JointPos(i,1),JointPos(i,2),JointPos(i,3),'bo','MarkerFaceColor','b','MarkerSize',5);hold on
    
end

%% Draw links
for i = 1:length(JointPos)
    if i == 1 % Torso --> Head/RHip45/LHip45
        plot3([JointPos(1,1),JointPos(2,1)],[JointPos(1,2),JointPos(2,2)],[JointPos(1,3),JointPos(2,3)],'k','LineWidth',2);hold on
        plot3([JointPos(1,1),JointPos(9,1)],[JointPos(1,2),JointPos(9,2)],[JointPos(1,3),JointPos(9,3)],'k','LineWidth',2);hold on
        plot3([JointPos(1,1),JointPos(13,1)],[JointPos(1,2),JointPos(13,2)],[JointPos(1,3),JointPos(13,3)],'k','LineWidth',2);hold on
    elseif i == 2 % Head --> RShoulder/LShoulder
        plot3([JointPos(2,1),JointPos(3,1)],[JointPos(2,2),JointPos(3,2)],[JointPos(2,3),JointPos(3,3)],'k','LineWidth',2);hold on
        plot3([JointPos(2,1),JointPos(6,1)],[JointPos(2,2),JointPos(6,2)],[JointPos(2,3),JointPos(6,3)],'k','LineWidth',2);hold on
    elseif i == 3 || i ==6    % Shoulder --> Elbow --> Wrist
        for j = 1:2
            plot3([JointPos(i+j-1,1),JointPos(i+j,1)],[JointPos(i+j-1,2),JointPos(i+j,2)],[JointPos(i+j-1,3),JointPos(i+j,3)],'k','LineWidth',2);hold on
        end
    elseif i == 9 || i == 13  % Hip45 --> Hip --> Knee --> Ankle
        for j = 1:3
            plot3([JointPos(i+j-1,1),JointPos(i+j,1)],[JointPos(i+j-1,2),JointPos(i+j,2)],[JointPos(i+j-1,3),JointPos(i+j,3)],'k','LineWidth',2);hold on
        end
    end
end

% Draw End effector Link: HeadCenter， RHand, LHand, RFoot, LFoot
plot3([JointPos(2,1),EndeffLoc(1,1)],[JointPos(2,2),EndeffLoc(1,2)],[JointPos(2,3),EndeffLoc(1,3)],'k','LineWidth',2);hold on
plot3([JointPos(5,1),EndeffLoc(2,1)],[JointPos(5,2),EndeffLoc(2,2)],[JointPos(5,3),EndeffLoc(2,3)],'k','LineWidth',2);hold on
plot3([JointPos(8,1),EndeffLoc(3,1)],[JointPos(8,2),EndeffLoc(3,2)],[JointPos(8,3),EndeffLoc(3,3)],'k','LineWidth',2);hold on
plot3([JointPos(12,1),EndeffLoc(4,1)],[JointPos(12,2),EndeffLoc(4,2)],[JointPos(12,3),EndeffLoc(4,3)],'k','LineWidth',2);hold on
plot3([JointPos(16,1),EndeffLoc(5,1)],[JointPos(16,2),EndeffLoc(5,2)],[JointPos(16,3),EndeffLoc(5,3)],'k','LineWidth',2);hold on

%% Draw Endeffector
% Draw Head Center
plot3(EndeffLoc(1,1),EndeffLoc(1,2),EndeffLoc(1,3),'ko','MarkerFaceColor','k','MarkerSize',15);hold on
plot3(EndeffLoc(2,1),EndeffLoc(2,2),EndeffLoc(2,3),'ko','MarkerFaceColor','k','MarkerSize',5);hold on
plot3(EndeffLoc(3,1),EndeffLoc(3,2),EndeffLoc(3,3),'ko','MarkerFaceColor','k','MarkerSize',5);hold on
plot3(EndeffLoc(4,1),EndeffLoc(4,2),EndeffLoc(4,3),'ko','MarkerFaceColor','k','MarkerSize',3);hold on
plot3(EndeffLoc(5,1),EndeffLoc(5,2),EndeffLoc(5,3),'ko','MarkerFaceColor','k','MarkerSize',3);hold on

% Draw Foot
FootCorner(5,:,1) = FootCorner(1,:,1);
FootCorner(5,:,2) = FootCorner(1,:,2);
for i = 1:2
    plot3(FootCorner(:,1,i),FootCorner(:,2,i),FootCorner(:,3,i),'k-'); hold on;
end


%% Adjust other settings
set(gcf,'color','w');
set(gca,'FontSize',15);
axis equal;box on;
% xlim([-500,500]);ylim([-500,500]);zlim([-120,700]);
xlabel('x (mm)'); ylabel('y (mm)'); zlabel('z (mm)');
% view([-251,16])
%view([1,1,1]);
end
