%%%%%%%%%%%%% Function made by Rick on 2-26-2019 %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Visualize Nao %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function NaoVisualizeShoe(JointPos, R, FootCorner, ShoeCorner, EndeffLoc, ConvexC,  Com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, CoordOpt, ConvOpt, COMOpt, StableOpt, CollisionOpt)
%% Draw joints/coordinates
for i = 1:length(JointPos)
    % Plot joint coordinate
    if CoordOpt == 1
        Color = {'r','b','g'}; % Color for 3 axis
        % Draw joint coordinate
        for j = 1:3
            CoordEndPos =  JointPos(i,:) + R(:,j,i)'*30;
            plot3([JointPos(i,1),CoordEndPos(1)],[JointPos(i,2),CoordEndPos(2)],[JointPos(i,3),CoordEndPos(3)], Color{j}, 'LineWidth', 4);hold on
        end
    else
        % Draw joint location
        plot3(JointPos(i,1),JointPos(i,2),JointPos(i,3),'bo','MarkerFaceColor','b','MarkerSize',5);hold on
    end
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
for i = 1:2
    plot3(FootCorner(:,1,i), FootCorner(:,2,i), FootCorner(:,3,i), 'r-'); hold on;
%     plot3(ShoeCorner(:,1,i), ShoeCorner(:,2,i), ShoeCorner(:,3,i), 'ro', 'MarkerSize',3); hold on;
    if ConvOpt == 0
        fill3(FootCorner(:,1,i),FootCorner(:,2,i),FootCorner(:,3,i),'r'); hold on;
    end
end

%% Draw Collision Capsule
if CollisionOpt == 1
    for i = 1:size(LinkRadians,1)
        if LinkRadians(i) ~= 0
            Cap1 = [JointPos(i,1),JointPos(i,2),JointPos(i,3)];
            if i ~= 4 && i ~= 7
                Cap2 = [JointPos(i+1,1),JointPos(i+1,2),JointPos(i+1,3)];
            elseif i == 4
                Cap2 = [EndeffLoc(2,1), EndeffLoc(2,2), EndeffLoc(2,3)];
            elseif i == 7
                Cap2 = [EndeffLoc(3,1), EndeffLoc(3,2), EndeffLoc(3,3)];
            end
            DrawCapsule(Cap1, Cap2, LinkRadians(i)); hold on
        end
    end
    
    for i = 1:size(CollisionPoint,1)
        if CollisionFlag(i) == 0
            plot3([CollisionPoint(i,1,1),CollisionPoint(i,1,2)],[CollisionPoint(i,2,1),CollisionPoint(i,2,2)],[CollisionPoint(i,3,1),CollisionPoint(i,3,2)],'y','LineWidth',3); hold on
        elseif CollisionFlag(i) == 1
            plot3([CollisionPoint(i,1,1),CollisionPoint(i,1,2)],[CollisionPoint(i,2,1),CollisionPoint(i,2,2)],[CollisionPoint(i,3,1),CollisionPoint(i,3,2)],'m','LineWidth',3); hold on
        end
    end
end


%% Draw Convext Hull
if ConvOpt == 1
    if StableOpt == 0
        fill3(ConvexC(:,1) , ConvexC(:,2), zeros(size(ConvexC(:,1))), 'g'); hold on
    elseif StableOpt == 1
        fill3(ConvexC(:,1) , ConvexC(:,2), zeros(size(ConvexC(:,1))), 'm'); hold on
    end
end

%% Draw COM Location
if COMOpt == 1
    plot3(MassLoc(:,1,1),MassLoc(:,2,1),MassLoc(:,3,1),'ro','MarkerFaceColor','r','MarkerSize',5);hold on       % Plot joint COM
    plot3(MassLoc(:,1,2),MassLoc(:,2,2),MassLoc(:,3,2),'go','MarkerFaceColor','g','MarkerSize',5);hold on       % Plot lin COM
    plot3(Com(1),Com(2),Com(3),'rs','MarkerFaceColor','r','MarkerSize',5);% Plot 3-D COM
    plot3(Com(1),Com(2),0.5,'mo','MarkerFaceColor','m','MarkerSize',8,'MarkerEdgeColor','k');   % Plot 2-D COM projection
else
    plot3(Com(1),Com(2),0.5,'mo','MarkerFaceColor','m','MarkerSize',8,'MarkerEdgeColor','k');   % Plot 2-D COM projection
end

%% Adjust other settings
set(gcf,'color','w');
set(gca,'FontSize',15);
axis equal;box on;
xlim([-200,200]);ylim([-300,200]);zlim([-50,500]);
xlabel('x (mm)'); ylabel('y (mm)'); zlabel('z (mm)');
view([81,30])
end
