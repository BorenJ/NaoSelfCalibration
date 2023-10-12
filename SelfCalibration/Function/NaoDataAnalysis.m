clear; clc; close all;

%% Load data
load('/home/rick/Desktop/Posture_20deg.mat');

%% Analyze convexity
StableCOM = find(COMComb(:,4) == 1);
UnStableCOM = find(COMComb(:,4) == 0);
StableJoint = JointComb(StableCOM,:);
UnStableJoint = JointComb(UnStableCOM,:);
%% Plot data
plot3(StableJoint(:,7),StableJoint(:,8),StableJoint(:,9),'ro', 'MarkerSize',10);hold on
plot3(UnStableJoint(:,7),UnStableJoint(:,8),UnStableJoint(:,9),'bo', 'MarkerSize',3);hold on

%% Plot all COM
plot(COMComb(:,1),COMComb(:,2),'.');hold on
plot(ConvexC(:,1),ConvexC(:,2),'-')