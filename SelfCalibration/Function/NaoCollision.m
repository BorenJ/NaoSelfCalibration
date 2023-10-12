%%%%%%%%%%%%%%%%%%  Collision Detection for Nao %%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initialize Nao robot pararmeters
function [Flag, Dist, Point] = NaoCollision(CollisionPair, JointPos, LinkRadians, EndeffLoc)
%%
    numCollisionPairs = size(CollisionPair, 1);  % number of collision pairs
    Flag = zeros(size(CollisionPair,1),1);
    Dist = zeros(size(CollisionPair,1),1);  
    Point = zeros(size(CollisionPair,1),3,2);

    for i = 1:numCollisionPairs
        CapA1 = JointPos(CollisionPair(i,1),:);  % first endpoint of segmentA
        CapB1 = JointPos(CollisionPair(i,2),:);  % first endpoint of segmentB
        CapA2 = GetSecondEndPoint(CollisionPair(i,1), JointPos, EndeffLoc);  % second endpoint of segmentA
        CapB2 = GetSecondEndPoint(CollisionPair(i,2), JointPos, EndeffLoc);  % second endpoint of segmentB
        [Dist(i), Flag(i), Point(i,:,1), Point(i,:,2)] = CapsuleCollision(CapA1, CapA2, CapB1, CapB2, LinkRadians(CollisionPair(i,1)), LinkRadians(CollisionPair(i,2)));
    end
    %%
end

function Cap2 = GetSecondEndPoint(CollisionPairIndex, JointPos, EndeffLoc)
    isRElbow = CollisionPairIndex == 4;
    isLElbow = CollisionPairIndex == 7;
    if isRElbow 
        Cap2 = EndeffLoc(2,:);
    elseif isLElbow
        Cap2 = EndeffLoc(3,:);
    else  % isRHip || RKnee
        Cap2 = JointPos(CollisionPairIndex+1,:);
    end
end