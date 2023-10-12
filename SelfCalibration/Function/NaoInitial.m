%% Initialize Nao configuration
%Information source:
%http://doc.aldebaran.com/2-1/family/nao_h25/links_h25.html?highlight=mass
%http://doc.aldebaran.com/2-1/family/robots/links_robot.html#robot-links

%% Set the name and possible motion of each joint using ZYX convention Euler angle. '0' represents no dof there
% This one gets rid of some of the useless angles for self-calibration
JointEulerName = {
1,    0           ,  0          , 0         ;       % 1 Torso
2,    0           ,  0          , 0         ;       % 2 Head
3,    'RShoulderZ', 'RShoulderY', 0         ;       % 3 RShoulder
4,    'RElbowZ'   ,  0          ,'RElbowX'  ;       % 4 RElbow
5,    0           ,  0          , 0         ;       % 5 RWrist
6,    'LShoulderZ', 'LShoulderY', 0         ;       % 6 LShoulder
7,    'LElbowZ'   ,  0          ,'LElbowX'  ;       % 7 LElbow
8,    0           ,  0          , 0         ;       % 8 LWrist
9,    0           ,  0          , 0         ;       % 9 RHip45
10,   0          , 'RHipY'     ,'RHipX'     ;       % 10 RHip
11,   0          , 'RKneeY'    , 0          ;       % 11 RKnee
12,   0          , 'RAnkleY'   ,'RAnkleX'   ;       % 12 RAnkle
13,   0          ,   0         , 0          ;       % 13 LHip45
14,   0          , 'LHipY'     ,'LHipX'     ;       % 14 LHip
15,   0          , 'LKneeY'    , 0          ;       % 15 LKnee
16,   0          , 'LAnkleY'   ,'LAnkleX'   ;       % 16 LAnkle
};

%% Determine which angles are usable
JointFlag = [
    0           ,  0          , 0         ;       % 1 Torso
    0           ,  0          , 0         ;       % 2 Head
    0           ,  0          , 0         ;       % 3 RShoulder
    0           ,  0          , 0         ;       % 4 RElbow
    0           ,  0          , 0         ;       % 5 RWrist
    0           ,  0          , 0         ;       % 6 LShoulder
    0           ,  0          , 0         ;       % 7 LElbow
    0           ,  0          , 0         ;       % 8 LWrist
    0           ,  0          , 0         ;       % 9 RHip45
    0           ,  1          , 1         ;       % 10 RHip
    0           ,  1          , 0         ;       % 11 RKnee
    0           ,  1          , 1         ;       % 12 RAnkle
    0           ,  0          , 0         ;       % 13 LHip45
    0           ,  1          , 1         ;       % 14 LHip
    0           ,  1          , 0         ;       % 15 LKnee
    0           ,  1          , 1         ;       % 16 LAnkle
    ];

%% The initial position of each joint corresponding to the base (torso) frame. Unit: mm
JointPos0 = [
    0     ,0    , 0    ;     % 1 Torso
    0     ,0    , 126.5;     % 2 Head
    0     ,-98  , 100  ;     % 3 RShoulder
    105   ,-113 , 100  ;     % 4 RElbow
    160.95,-113 , 100  ;     % 5 RWrist
    0     , 98  , 100  ;     % 6 LShoulder
    105   , 113 , 100  ;     % 7 LElbow
    160.95,113  , 100  ;     % 8 LWrist
    0     ,-50  , -85  ;     % 9 RHip45
    0     ,-50  , -85  ;     % 10 RHip
    0     ,-50  , -185 ;     % 11 RKnee
    0     ,-50  ,-287.9;     % 12 RAnkle
    0     , 50  , -85  ;     % 13 LHip45
    0     , 50  , -85  ;     % 14 LHip
    0     , 50  , -185 ;     % 15 LKnee
    0     , 50  ,-287.9;     % 16 LAnkle
    ];

%% Nao Joint COM location and value (unit m, N.m. xyz withrespect to zero)
JointMassLocOffset0 = [
    -0.00413,         0,           0.04342;   % 1 Torso
    -0.00112,         0,           0.05258;   % 2 Head
    -0.00165,     0.02663,         0.00014;   % 3 Rshoulder
    -0.02744,         0,          -0.00014;   % 4 RElbow
    0,                0,                 0;   % 5 RWrist
    -0.00165,    -0.02663,         0.00014;   % 6 Lshoulder
    -0.02744,         0,          -0.00014;   % 7 LElbow
    0,                0,                 0;   % 8 LWrist
    0,                0,                 0;   % 9 RHip45
    -0.01549,    -0.00029,        -0.00515;   %10 RHip
    0,                0,                 0;   %11 Rknee
    0.00045,    -0.00029,          0.00685;   %12 RAnkle
    0,                0,                 0;   %13 LHip45
    -0.01549,     0.00029,        -0.00515;   %14 LHip
    0,                0,                 0;   %15 Lknee
    0.00045,      0.00029,         0.00685;   %16 LAnkle
    ];

LinkMassLocOffset0 = [
    0,                0,                0;   % 1 TorLink -> Torso
    -1e-5   ,         0,         -0.02742;   % 2 Neck    -> Head
    0.02455 ,    -0.00563,         0.0033;   % 3 RBiceps -> RShoulder
    0.02556,     -0.00281,        0.00076;   % 4 RForeArm-> RElbow
    0.03434,      0.00088,        0.00308;   % 5 RHand   -> RWrist
    0.02455 ,     0.00563,         0.0033;   % 6 LBiceps -> LShoulder
    0.02556,      0.00281,        0.00076;   % 7 LForeArm-> LElbow
    0.03434,     -0.00088,        0.00308;   % 8 LHand   -> LWrist
    -0.00781,      0.01114,       0.02661;   % 9 RPelvis -> RHip45
    0.00138,      -0.00221,      -0.05373;   %10 RThigh  -> RHip
    0.00453,      -0.00225,      -0.04936;   %11 RTibia  -> Rknee
    0.02542,       -0.0033,      -0.03239;   %12 RFoot   -> RAnkle
    -0.00781,     -0.01114,       0.02661;   %13 LPelvis -> LHip45
    0.00138,       0.00221,      -0.05373;   %14 LThigh  -> LHip
    0.00453,       0.00225,      -0.04936;   %15 LTibia  -> Lknee
    0.02542,        0.0033,      -0.03239;   %16 LFoot   -> LAnkle
    ];

JointMass = [
    1.0496;    % 1 Torso
    0.60533;   % 2 Head
    0.09304;   % 3 Rshoulder
    0.06483;   % 4 RElbow
    0;         % 5 RWrist
    0.09304;   % 6 Lshoulder
    0.06483;   % 7 LElbow
    0;         % 8 LWrist
    0;         % 9 RHip45
    0.14053;   %10 RHip
    0;         %11 Rknee
    0.13416;   %12 RAnkle
    0;         %13 LHip45
    0.14053;   %14 LHip
    0;         %15 Lknee
    0.13416;   %16 LAnkle
    ];


LinkMass  = [
    0 ;          % 1 TorLink -> Torso
    0.07842;     % 2 Neck    -> Head
    0.15777;     % 3 RBiceps -> RShoulder
    0.07761;     % 4 RForeArm-> RElbow
    0.18533;     % 5 RHand   -> RWrist
    0.15777;     % 6 LBiceps -> LShoulder
    0.07761;     % 7 LForeArm-> LElbow
    0.18533;     % 8 LHand   -> LWrist
    0.06981;     % 9 RPelvis -> RHip45
    0.38968;     %10 RThigh  -> RHip
    0.30142;     %11 RTibia  -> Rknee
    0.17184;     %12 RFoot   -> RAnkle
    0.06981;     %13 LPelvis -> LHip45
    0.38968;     %14 LThigh  -> LHip
    0.30142;     %15 LTibia  -> Lknee
    0.17184;     %16 LFoot   -> LAnkle
    ];

MassLoc0 = zeros(size(JointMassLocOffset0,1),size(JointMassLocOffset0,2),2);
MassLoc0(:,:,1) = JointMassLocOffset0*1000;
MassLoc0(:,:,2) = LinkMassLocOffset0*1000;

Mass = zeros(size(JointMass,1),size(JointMass,2),2);
Mass(:,:,1) = JointMass;
Mass(:,:,2) = LinkMass;
% clear MassLinkLoc MassJointLoc LinkMass JointMass

%% Inertial Property Identification
JointMassLocOffset_u = JointMassLocOffset0;
LinkMassLocOffset_u = LinkMassLocOffset0;
JointMass_u = JointMass;
LinkMass_u = LinkMass;
JointMassLocOffset_u(1,:) = [1.9943, 0, 70.9804]/1000;
JointMassLocOffset_u(2:8,:) = zeros(7,3);
LinkMassLocOffset_u(1:8,:) = zeros(8,3);
JointMass_u(2:8,:) = 0;
JointMass_u(1,:) = 2.8905;
LinkMass_u(1:8,:) = 0;

MassLoc0_u = zeros(size(JointMassLocOffset_u,1),size(JointMassLocOffset_u,2),2);
MassLoc0_u(:,:,1) = JointMassLocOffset_u*1000;
MassLoc0_u(:,:,2) = LinkMassLocOffset_u*1000;

Mass_u = zeros(size(JointMass_u,1),size(JointMass_u,2),2);
Mass_u(:,:,1) = JointMass_u*1000;
Mass_u(:,:,2) = LinkMass_u*1000;

Mass_u_combine = [Mass_u(:,:,1); Mass_u(:,:,2)];
MassLoc0_u_combine = [MassLoc0_u(:,:,1); MassLoc0_u(:,:,2)];

%% The initial Joint angle, unit: deg
JointAngle0 = zeros(length(JointPos0),3);

%% Generate Joint angle limit
JointLim = JointAngleLimGeneration(-1);
JointLim = deg2rad(JointLim);

%% Collision Detection
LinkRadians  = [
    70;     % 1 TorLink -> Torso
    0 ;     % 2 Neck    -> Head
    0 ;     % 3 RBiceps -> RShoulder
    70/2;   % 4 RForeArm-> RElbow
    0 ;     % 5 RHand   -> RWrist
    0 ;     % 6 LBiceps -> LShoulder
    70/2;   % 7 LForeArm-> LElbow
    0 ;     % 8 LHand   -> LWrist
    0 ;     % 9 RPelvis -> RHip45
    75/2;   %10 RThigh  -> RHip
    75/2;   %11 RTibia  -> Rknee
    0;      %12 RFoot   -> RAnkle
    0;      %13 LPelvis -> LHip45
    75/2;   %14 LThigh  -> LHip
    75/2;   %15 LTibia  -> Lknee
    0;      %16 LFoot   -> LAnkle
    ];

CollisionPair = ...
    [
    4, 10;   %Lsmall_arm -> L_Thigh
    7, 14    %Rsmall_arm -> R_Thigh
    10,14;   %Right thigh  -> Left thigh
    11,15    %Right tibia  -> Left tebia
    ];

%% foot contour
d_com = 15;

%% Foot countour 
% FootCorner0(:,:,1) = [+70.25, +23.1, 0;
%                       +70.25, -29.9, 0;
%                       -30.25, -29.9, 0;
%                       -29.65, +19.1, 0;
%                       ]; %Right Foot
%                   
% FootCorner0(:,:,2) = [+70.25, +29.9, 0; 
%                       +70.25, -23.1, 0;
%                       -29.65, -19.1, 0;
%                       -30.25, +29.9, 0;
%                       ]; %Left Foot

FootCorner0(:,:,1) = [+70.25, +23.1, 0;
                      +70.25, -29.9, 0;
                      -30.25, -29.9, 0;
                      -29.65, +23.1, 0;
                      ]; %Right Foot
                  
FootCorner0(:,:,2) = [+70.25, +29.9, 0; 
                      +70.25, -23.1, 0;
                      -29.65, -23.1, 0;
                      -30.25, +29.9, 0;
                      ]; %Left Foot
                  
%% Shoe Corner
ShoeCorner_mid = [85, 49, 0; -85, 49, 0; -85, -49, 0; 85, -49, 0];
OffsetL = [0.02397, +0.00676, 0]*1000;
OffsetR = [0.02397, -0.00676, 0]*1000;
ShoeCorner0(:,:,2) = ShoeCorner_mid + repmat(OffsetL, size(ShoeCorner_mid,1),1);
ShoeCorner0(:,:,1) = ShoeCorner_mid + repmat(OffsetR, size(ShoeCorner_mid,1),1);
                  
                  