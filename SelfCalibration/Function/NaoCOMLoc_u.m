function [Com,MassLoc] = NaoCOMLoc_u(Mass, MassLoc0, JointPos, R)

MassLoc = zeros(size(MassLoc0));
% Calculate the joint and link COM for each joint 

for i = 1:size(MassLoc0,1)
    MassLoc(i,:) = (R(:,:,i)*MassLoc0(i,:)'+JointPos(i,:)')';
end

% Calculate the whole body COM
Com = (MassLoc'* Mass)./sum(Mass);
end
