clear; clc; close all;

%% Add path directory
addpath('/home/boren/Desktop/SelfCalibration/Function');
load('/home/boren/Desktop/SelfCalibration/data/training/q_init_1.mat')

%% Initialize Nao Robot
NaoInitial;

%% trajectory parameter
q_dof = 11;          % Degree of joint state
w_dof = 11;          % Degree of control
s_dof = 22;
trajSize = 4;       % Trajectory size of joint state and control, respectively

%% visualize result
JointAngle = JointAngleAssignLeg(q_init);
[R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematicsFullBody(JointPos0, JointAngle, FootCorner0);
[com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
[~, ~, Convex] = NaoStaticStable(FootCorner, com);
[CollisionFlag, ~, CollisionPoint] = NaoCollision(CollisionPair,JointPos,LinkRadians,EndeffLoc);
NaoVisualize(JointPos, R, FootCorner, EndeffLoc, Convex,  com, MassLoc, LinkRadians, CollisionPoint, CollisionFlag, 1, 1, 0, 0, 1);
%% Calculate translation
[RFootTrans,RFootRot] = AUTOGEN_RFoot(q_init);  % [EndeffLoc(4,:) R(:,:,12)] [RFoot Center, RFoot Rotation]
[comX,comY,~] = AUTOGEN_COM3(q_init);  % Com of the robot
com = [comX,comY, 0];

%% CoM Path Generation
RFootMid = (RFootRot*[20;-3.5;0] + RFootTrans')';  % center of the RShoe in left foot coordinate
LFootMid = [20,3.5,0];  % center of the LShoe in left foot coordinate
% four target points of com path
LF1 = LFootMid + [+50/2, 0, 0];
LF2 = LFootMid + [-50/2, 0, 0];      
RF1 = RFootMid + (RFootRot*[50/2, 0, 0]')';
RF2 = RFootMid + (RFootRot*[-50/2, 0, 0]')';
Path = [RF1; LF1; LF2; RF2; RF1]; % the default path starts at RF_1 moves clockwise

% find the mid point between consecutive of two target points 
midPoint = [];
dist = [];
for i = 1:size(Path,1)-1
    midPointTemp = (Path(i,:)+Path(i+1,:))/2;
    midPoint = [midPoint; midPointTemp];
    dist = [dist; norm(com - midPointTemp)];
end

% find the closest point to the CoM
[~,idx] = min(dist);
if idx == 1
    Path = [midPoint(idx,:);Path(idx+1:end,:);midPoint(idx,:); com];
else
    Path = [midPoint(idx,:);Path(idx+1:end,:); Path(2:idx,:); midPoint(idx,:); com];
end
for j = 1:size(Path,1)-1
    plot(Path(j,1),Path(j,2),'bo','MarkerFaceColor','b'); hold on
end

%% Joint Limit for MPC each optimization trajectory
% Obtain state q joint limit
qLowerBond = qAssignLeg(JointLim(:,:,1));
qUpperBond = qAssignLeg(JointLim(:,:,2));

% Obtain angular velocity limit
wLoweBond = -ones(w_dof,1)*deg2rad(0.5);
wUpperBond = +ones(w_dof,1)*deg2rad(0.5);

% Assemble limit into trajectory
lowerBond = [];
upperBond = [];
for i = 1:trajSize
    if i == 1 % There is no angular velocity initially
        lowerBond = [lowerBond; [zeros(w_dof,1); qLowerBond]];
        upperBond = [upperBond; [zeros(w_dof,1); qUpperBond]];
    else
        lowerBond = [lowerBond; [wLoweBond ; qLowerBond]];
        upperBond = [upperBond; [wUpperBond ; qUpperBond]];
    end
end

%% output variables
trajFull = [];
optimizationFlag = [];

%% flag to start and stop MPC
mpcFlag = 1;
pathIdx = 1;

%% Start simulation
% calculate initial CoM location
[comX0, comY0] = AUTOGEN_COM3(q_init); 
com0 = [comX0, comY0, 0];
count = 0;

while(mpcFlag == 1)
    % Obtain Initial Guess
   
    qGuess = InitialGuess(q_init, s_dof, trajSize);
    comTrajGoal = Path(pathIdx,:);
    
    % Set up optimization
    fun = @(vars)cost(vars, comTrajGoal , s_dof, trajSize);
    cons = @(vars)constraint(vars, qGuess, s_dof, trajSize, RFootTrans, RFootRot);
    options = optimoptions('fmincon','Display','iter','Algorithm','sqp','ConstraintTolerance',1e-4,'MaxFunctionEvaluations', 50000, 'MaxIterations',50000, 'StepTolerance',1e-6);
    [q_solution,~,exitflag,~] = fmincon(fun,qGuess,[],[],[],[],lowerBond,upperBond,cons,options);
    optimizationFlag = [optimizationFlag;exitflag];
    
    [comX, comY] = AUTOGEN_COM3(q_solution(78:88,:));
    com = [comX, comY, 0];
    
    dd  = norm(com - comTrajGoal);
    dd0 = norm(com - com0);
    
    if dd < 30 || dd0 < 2
        if pathIdx == size(Path,1)
            mpcFlag = 0;
        else
            pathIdx = pathIdx + 1;
            q_init = q_solution(78:88,:);
        end
    else
        q_init = q_solution(78:88,:);
    end
    
    trajFull = [trajFull, q_solution];
    com0 = com;
    
end

%% generate trajectory
close all;
traj = traj_generation(s_dof, trajSize, trajFull);
comTrajectory = [];
for ii = 1:size(traj,1)
    qTemp = traj(ii,9:end);
    JointAngle = JointAngleAssignLeg(qTemp);
    [R,JointPos,FootCorner, EndeffLoc] = NaoForwardKinematicsFullBody(JointPos0, JointAngle, FootCorner0);
    [com,MassLoc] = NaoCOMLoc(Mass, MassLoc0,JointPos, R);
    comTrajectory = [comTrajectory com];
end

DrawFoot(JointPos0,FootCorner0,JointAngle);view([-90,90]);hold on; drawnow 
for j = 1:size(Path,1)-1
    plot3(Path(j,1),Path(j,2),1,'bo','MarkerFaceColor','b'); hold on
end
plot(comTrajectory(1,:),comTrajectory(2,:),'-')

%% Check the result
Traj_Vis_system(traj(:,9:end),  0); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%% MPC Function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Cost function
function J = cost(vars, c_g, s_dof, traj_size)
J = 0;
W = [1,200,20]; % goal cost, deviation cost,
w_dof = s_dof/2;

q_idx0 = (w_dof+1):s_dof;
[c_x, c_y, ~] = AUTOGEN_COM3(vars(q_idx0));
CoP_store = [c_x, c_y];

% CoM Attractive and Repulsive Cost
for i = 1:traj_size-1
    q_idx = (i*s_dof+w_dof+1):(i+1)*s_dof;
    q_select = vars(q_idx);
    [c_x, c_y, ~] = AUTOGEN_COM3(q_select);
    J = J + W(1)*((c_x-c_g(1))^2 + (c_y-c_g(2))^2);
    CoP_store = [CoP_store; c_x, c_y];
end

% CoP continuity
for i = 1:size(CoP_store,1)-2
    dcom1 = norm(CoP_store(i+1,:) - CoP_store(i,:)); 
    dcom2 = norm(CoP_store(i+2,:) - CoP_store(i+1,:)); 
    J = J + W(2)*(dcom1 - dcom2)^2;
end

% Avoid singularity
for i = 1:traj_size-1
    q_idx = (i*s_dof+w_dof+1):(i+1)*s_dof;
    q_select = vars(q_idx);
    J = J + 100*( 1/(q_select(4)^2) + 1/(q_select(9)^2) + 1/((q_select(4) - pi/2)^2) + 1/((q_select(9) - pi/2)^2));
end

% angular Velocity continuity Cost
for i = 1:traj_size-1
    w_idx1 = ((i-1)*s_dof+1):((i-1)*s_dof + w_dof);
    w_idx2 = (    i*s_dof+1):(    i*s_dof  +w_dof);
    w1_select = vars(w_idx1);
    w2_select = vars(w_idx2);
    J = J + W(3)*(sum((w1_select - w2_select).^2));
end

end

%% Constraint for double foot
function [c,ceq] = constraint(vars, q_i, s_dof, traj_size, RF_Tans, RF_RotM)

inequ_idx = 0;
equ_idx = 0;

q_dof = s_dof/2;
w_dof = s_dof/2;

% equality constraint for initial condition
for i = 1:s_dof
    equ_idx = equ_idx+1;
    ceq(equ_idx) = vars(i)-q_i(i);
end

% Assign state q related constraints
for i = 1:traj_size-1
    % Get state idx
    q_idx = (i*s_dof + w_dof + 1):(i+1)*s_dof;
    q_select = vars(q_idx);
    c = [];
    % Collision inequality constraints
    [LKneePos, RKneePos] = AUTOGEN_Knees(q_select);
    inequ_idx = inequ_idx + 1;
    c(inequ_idx) = 5 - (norm(RKneePos - LKneePos) - 2*37.5);
    
    % Foot Equality Constraint
    [RFoot_Trans, RFoot_RotM] = AUTOGEN_RFoot(q_select);    % Z position
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_Trans(1) - RF_Tans(1);
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_Trans(2) - RF_Tans(2);
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_Trans(3) - RF_Tans(3);
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_RotM(3,3) - RF_RotM(3,3);
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_RotM(1,3) - RF_RotM(1,3);
    equ_idx = equ_idx + 1;
    ceq(equ_idx) = RFoot_RotM(2,2) - RF_RotM(2,2);
end

% equality constraint for state transition
for i = 1:traj_size -1
    q_idx1 = ((i-1)*s_dof+1+w_dof):i*s_dof;
    q_idx2 = (i*s_dof+1+w_dof):(i+1)*s_dof;
    w_idx1 = (i*s_dof+1):(i*s_dof+1+w_dof);
    
    q1_select = vars(q_idx1);
    q2_select = vars(q_idx2);
    w1_select = vars(w_idx1);
    
    for j = 1:q_dof
        equ_idx = equ_idx+1;
        ceq(equ_idx) = q1_select(j) + w1_select(j) - q2_select(j);
    end
end

end

%% Design initial and goal position and step size
function q_guess = InitialGuess(q_init, s_dof, traj_size)
q_guess = [];
w_dof = s_dof/2;
for i = 1:1:traj_size
    q_guess = [q_guess; [zeros(w_dof,1); q_init]];
end
end

%% 
function Traj = traj_generation(s_dof, traj_size, Traj_Full)
arm_angle = [-0.523598775598299,1.91986217719376,1.50098315671512,1.57079632679490,0.523598775598299,1.91986217719376,-1.50098315671512,-1.57079632679490];
Traj= [];
w_dof = s_dof/2;
for ii = 1:size(Traj_Full, 2)
    for i = 1:traj_size-1
        q_idx = (i*s_dof+w_dof+1):(i+1)*s_dof;
        q_temp = Traj_Full(q_idx, ii);
        Traj = [Traj;[arm_angle,q_temp']];
    end
end
% Add the first section
q_idx0 = (w_dof+1):s_dof;
q_temp0 = Traj_Full(q_idx0, 1);
Traj = [[arm_angle,q_temp0']; Traj];
end
