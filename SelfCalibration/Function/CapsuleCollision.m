function [Dist, Flag, PointA, PointB] = CapsuleCollision(CapA1, CapA2, CapB1, CapB2, RA, RB)
    [CA1, CA2] = GetEndPoint(CapA1,CapA2,RA);  % Endpoints of segmentA (with radius of the sphere)
    [CB1, CB2] = GetEndPoint(CapB1,CapB2,RB);  % Endpoints of segmentB (with radius of the sphere)
    [Dist, PointA, PointB] = DistBetween2Segment(CA1, CA2, CB1, CB2);  % Calculate the distance between srgmentA and B
    
        if Dist > RA + RB
            Flag = 0;
        else
            Flag = 1;
        end

    Dist = Dist - (RA + RB);
end

function [C1, C2] = GetEndPoint(Cap1,Cap2,R)
   Norm = (Cap2 - Cap1)./norm(Cap2 - Cap1);  % direction vector of segmentA
    C1 = Cap1 - Norm*R;  % endpoints of segmentA with Radius of the sphere
    C2 = Cap2 + Norm*R;
end