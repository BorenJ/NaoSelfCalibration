function [StableFlag, FootFlag, Convex] = NaoStaticStable(FootCorner, Com)
%% Check whether two feet are both on the ground
isRFootNearGround = min(FootCorner(:,3,1))>=-0.5;  % if Rfoot is near to ground 
isTwoFeetClose = abs(mean(FootCorner(:,3,1))-mean(FootCorner(:,3,2)))<2;  % if two feet near to each other z direction < threshold
if isRFootNearGround && isTwoFeetClose 
    FootFlag = 2;   % double foot contact
    FootCornerXY = [FootCorner(:,1:2,2);FootCorner(:,1:2,1)];
    convexIndex = convhull(FootCornerXY);
    Convex = [FootCornerXY(convexIndex,1),FootCornerXY(convexIndex,2)];
else
    FootFlag = 1;   % single foot contact
    Convex = [FootCorner(:,1,2),FootCorner(:,2,2)];
end

%% Whether COM projection is inside the polygon. (If so: stable or not stable)
StableFlag = inpolygon(Com(1),Com(2),Convex(:,1),Convex(:,2));

end