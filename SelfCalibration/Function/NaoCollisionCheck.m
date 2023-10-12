function Collision = NaoCollisionCheck(JointPos, EndeffLoc, RFootCorner)
    if isempty(find(JointPos(:,3) < -0.01, 1)) && isempty(find(EndeffLoc(:,3) < -0.01, 1)) && isempty(find(RFootCorner(:,3) < -0.01, 1))
        Collision = 0;
    else
        Collision = 1;
    end
end