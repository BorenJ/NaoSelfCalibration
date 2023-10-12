function [Com,MassLoc] = NaoCOMLoc(Mass, MassLoc0, JointPos, R)

MassLoc = zeros(size(MassLoc0));
% Calculate the joint and link COM for each joint 
for i = 1:size(MassLoc0,3)
    for j = 1:size(MassLoc0,1)
        MassLoc(j,:,i) = (R(:,:,j)*MassLoc0(j,:,i)'+JointPos(j,:)')';
    end
end

% Calculate the whole body COM
MassLocTemp = [MassLoc(:,:,1); MassLoc(:,:,2)];
MassTemp = [Mass(:,:,1); Mass(:,:,2)];
Com = (MassLocTemp'* MassTemp)./sum(MassTemp);
end
