function JointLim = JointAngleLimGeneration(config)

if config == -1 % Double checked for the legs for 10 dof mission
    % Original Joint Angle Limit (Yaw, Pitch, Roll, ZYX convention)
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        -119.5,  -38.5,       0;        % 2 Head
         -76,      -119.5,    0;        % 3 RShoulder
         2.5,      0,      -110;        % 4 RElbow
        -104.5,      0,  -104.4960;        % 5 RWrist
         -18,      -119.5,    0;        % 6 LShoulder
        -83,      0,    -110;        % 7 LElbow
        -104.5,      0,       0;        % 8 LWrist
        0,           0,      -63;        % 9 RHip45
        0,         -88,   -42;        %10 RHip
        0,         -3,       0;        %11 RKnee
        0,         -65,    -30;        %12 RAnkle: pitch:-67.97 before
        0,           0,      -63;        %13 LHip45?
        0,         -88,   -19;        %14 LHip
        0,        -3,       0;        %15 LKnee
        0,         -65,   -8;        %16 LAnkle: pitch:-67.97 before
        ];
    
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        119.5,    29.5,       0;        % 2 Head
        18,        +119.5,      0;        % 3 RShoulder
        83,       0,     110;          % 4 RElbow
        104.5,       0,  104.4960;        % 5 RWrist
        76,        +119.5,      0;        % 6 LShoulder
        -2.5,       0,     110;            % 7 LElbow
        104.5,       0,       0;        % 8 LWrist
        0,           0,       40;        % 9 RHip45?
        0,          26,      19;        % 10 RHip
        0,         119,       0;        % 11 RKnee: 121.47 before
        0,        51,         8;        % 12 RAnkle
        0,           0,       40;        % 13 LHip45
        0,          26,    42;        % 14 LHip
        0,         119,       0;        % 15 LKnee: 121.47 before
        0,        51,       30;        % 16 LAnkle
        ];
    
elseif config == 0
    % Original Joint Angle Limit (Yaw, Pitch, Roll, ZYX convention)
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        -119.5,  -38.5,       0;        % 2 Head
         -76,      -30,    0;        % 3 RShoulder
         2.5,      0,    -45;        % 4 RElbow
        -104.5,      0,       0;        % 5 RWrist
         -18,      -30,    0;        % 6 LShoulder
        -30,      0,    -45;        % 7 LElbow
        -104.5,      0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,  -45.29;        %10 RHip
        0,        -5.9,       0;        %11 RKnee
        0,         -70,  -44.06;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,         -88,  -21.74;        %14 LHip
        0,        -5.9,       0;        %15 LKnee
        0,         -70,   -22.8;        %16 LAnkle: pitch:-67.97 before
        ];
    
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        119.5,    29.5,       0;        % 2 Head
        18,        30,      0;        % 3 RShoulder
        83,       0,     45;        % 4 RElbow
        30,       0,       0;        % 5 RWrist
        76,        30,      0;        % 6 LShoulder
        -2.5,       0,     45;            % 7 LElbow
        104.5,       0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,       27.73,   21.74;        % 10 RHip
        0,         135,       0;        % 11 RKnee: 121.47 before
        0,       53.40,    22.8;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,          20,   45.29;        % 14 LHip
        0,         135,       0;        % 15 LKnee: 121.47 before
        0,        53.4,   44.06;        % 16 LAnkle
        ];
    
elseif config == 1
    % 5-12-2019 Modified: 2 legs are symmetrics and all body postures
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,      -209.5,     -76;        % 3 RShoulder
        0,           0,      -2;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,      -209.5,     -18;        % 6 LShoulder
        0,           0,   -88.5;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,       0;        %10 RHip
        0,        -5.9,       0;        %11 RKnee
        0,         -70,       0;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,           0,       0;        %14 LHip
        0,           0,       0;        %15 LKnee
        0,           0,       0;        %16 LAnkle: pitch:-67.97 before
        ];
    
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,        29.5,      18;        % 3 RShoulder
        0,           0,    88.5;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,        29.5,      76;        % 6 LShoulder
        0,           0,       2;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,       27.73,       0;        % 10 RHip
        0,         135,       0;        % 11 RKnee: 121.47 before
        0,       53.40,       0;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,           0,       0;        % 14 LHip
        0,           0,       0;        % 15 LKnee: 121.47 before
        0,           0,       0;        % 16 LAnkle
        ];
    
elseif config == 2
    % 5-13-2019 Modified: 2 arms and legs are symmetric, this is for double
    % hand lifting object.
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,         -90,     -76;        % 3 RShoulder g
        0,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,           0,       0;        % 6 LShoulder
        0,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,       0;        %10 RHip
        0,           0,       0;        %11 RKnee
        0,         -70,       0;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,           0,       0;        %14 LHip
        0,           0,       0;        %15 LKnee
        0,           0,       0;        %16 LAnkle: pitch:-67.97 before
        ];
    
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,           0,       0;        % 3 RShoulder
        0,           0,    88.5;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,           0,       0;        % 6 LShoulder
        0,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,       27.73,       0;        % 10 RHip
        0,         135,       0;        % 11 RKnee: 121.47 before
        0,           0,       0;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,           0,       0;        % 14 LHip
        0,           0,       0;        % 15 LKnee: 121.47 before
        0,           0,       0;        % 16 LAnkle
        ];
elseif config == 3
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,           0,       0;        % 3 RShoulder g
        0,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,           0,       0;        % 6 LShoulder
        0,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,       0;        %10 RHip
        0,           0,       0;        %11 RKnee
        0,         -70,       0;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,           0,       0;        %14 LHip
        0,           0,       0;        %15 LKnee
        0,           0,       0;        %16 LAnkle: pitch:-67.97 before
        ];
    
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
        0,           0,       0;        % 3 RShoulder
        0,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
        0,           0,       0;        % 6 LShoulder
        0,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,       27.73,       0;        % 10 RHip
        0,         135,       0;        % 11 RKnee: 121.47 before
        0,           0,       0;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,           0,       0;        % 14 LHip
        0,           0,       0;        % 15 LKnee: 121.47 before
        0,           0,       0;        % 16 LAnkle
        ];
elseif config == 4
    % 5-31-2019 Modified: for safe moving for carrying and pushing (adjusted all the frames based on the robot model V5 in choregraph)
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
      -45,           0,       0;        % 3 RShoulder
        5,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist11
      -17,           0,       0;        % 6 LShoulder
      -30,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,       0;        %10 RHip
        0,           0,       0;        %11 RKnee
        0,         -67,       0;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,           0,       0;        %14 LHip
        0,           0,       0;        %15 LKnee
        0,           0,       0;        %16 LAnkle: pitch:-67.97 before
        ];
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
       17,          90,       0;        % 3 RShoulder
       30,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
       45,          90,       0;        % 6 LShoulder
       -5,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,          27,       0;        % 10 RHip
        0,         120,       0;        % 11 RKnee: 121.47 before
        0,          53,       0;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,           0,       0;        % 14 LHip
        0,           0,       0;        % 15 LKnee: 121.47 before
        0,           0,       0;        % 16 LAnkle
        ];
elseif config == 5
    % 6-20-2019 Modified: for safe moving for carrying and pushing (Adjusted for sensor correction)
    JointLim0 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
      -75,         -70,       0;        % 3 RShoulder
        0,           0,      -1;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
      -17,         -70,       0;        % 6 LShoulder
      -30,           0,      -1;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,         -88,       0;        %10 RHip
        0,           0,       0;        %11 RKnee
        0,         -67,       0;        %12 RAnkle: pitch:-67.97 before
        0,           0,       0;        %13 LHip45?
        0,           0,       0;        %14 LHip
        0,           0,       0;        %15 LKnee
        0,           0,       0;        %16 LAnkle: pitch:-67.97 before
        ];
    JointLim1 = [
        0,           0,       0;        % 1 Torso
        0,           0,       0;        % 2 Head
       17,          71,       0;        % 3 RShoulder
       30,           0,       0;        % 4 RElbow
        0,           0,       0;        % 5 RWrist
       75,          71,       0;        % 6 LShoulder
        0,           0,       0;        % 7 LElbow
        0,           0,       0;        % 8 LWrist
        0,           0,       0;        % 9 RHip45?
        0,          27,       0;        % 10 RHip
        0,         120,       0;        % 11 RKnee: 121.47 before
        0,          53,       0;        % 12 RAnkle
        0,           0,       0;        % 13 LHip45
        0,           0,       0;        % 14 LHip
        0,           0,       0;        % 15 LKnee: 121.47 before
        0,           0,       0;        % 16 LAnkle
        ];
end

JointLim = zeros(size(JointLim0,1),size(JointLim0,2),2);
JointLim(:,:,1) = JointLim0;
JointLim(:,:,2) = JointLim1;

end
