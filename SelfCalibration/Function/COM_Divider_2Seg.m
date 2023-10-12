function [COM_Lim, COM_Loc, Center, COM_Lim_All] = COM_Divider_2Seg(FootCorner0, d)

FCL = FootCorner0(1:4,:);

FCL([1,4],1) = FCL([1,4],1)+2*d-20;
FCL([2,3],1) = FCL([2,3],1)-2*d-20;
FCL([1,2],2) = FCL([1,2],2)-d;
FCL([3,4],2) = FCL([3,4],2)+d;

dx = (max(FCL(:,1))-min(FCL(:,1)))/2;

COM_Lim = zeros(4,2,2);

COM_Lim(1,:,1) = [min(FCL(:,1)) + 0*dx, min(FCL(:,1)) + 1*dx];
COM_Lim(2,:,1) = [min(FCL(:,1)) + 1*dx, min(FCL(:,1)) + 2*dx];
COM_Lim(3,:,1) = [min(FCL(:,1)) + 1*dx, min(FCL(:,1)) + 2*dx];
COM_Lim(4,:,1) = [min(FCL(:,1)) + 0*dx, min(FCL(:,1)) + 1*dx];

COM_Lim(1,:,2) = [min(FCL(:,2)), (min(FCL(:,2)) + max(FCL(:,2)))/2];
COM_Lim(2,:,2) = [min(FCL(:,2)), (min(FCL(:,2)) + max(FCL(:,2)))/2];
COM_Lim(3,:,2) = [(min(FCL(:,2)) + max(FCL(:,2)))/2, max(FCL(:,2))];
COM_Lim(4,:,2) = [(min(FCL(:,2)) + max(FCL(:,2)))/2, max(FCL(:,2))];

COM_Loc = zeros(4,2);

for i = 1:size(COM_Loc,1)
    COM_Loc(i,:) = [(COM_Lim(i,1,1) + COM_Lim(i,2,1))/2, (COM_Lim(i,1,2) + COM_Lim(i,2,2))/2];
end

Center = [mean(COM_Loc(:,1)),mean(COM_Loc(:,2))];

COMX_temp = COM_Lim(:,:,1);
COMY_temp = COM_Lim(:,:,2);
COMX_Lim = [min(COMX_temp(:,1)),max(COMX_temp(:,2))];
COMY_Lim = [min(COMY_temp(:,1)),max(COMY_temp(:,2))];
COM_Lim_All = zeros(size(COM_Lim(1,:,:)));
COM_Lim_All(:,:,1) = COMX_Lim;
COM_Lim_All(:,:,2) = COMY_Lim;
end