function [COM_Lim, COM_Loc, Center, COM_Lim_All] = COM_Divider_doubleV2(FootCorner0, d)

FCL = FootCorner0(1:4,:);   % Left foot corner
FCR = FCL;
FCR(:,2) =  FCL(:,2) - 100; % right foot corner

FCr = zeros(size(FCR));
FCl = zeros(size(FCL));

FCr([1,4],1) = FCR([1,4],1)+d+5;
FCr([2,3],1) = FCR([2,3],1)-d;
FCr([1,2],2) = FCR([1,2],2)-d;
FCr([3,4],2) = FCR([3,4],2)+d;

FCl([1,4],1) = FCL([1,4],1)+d;
FCl([2,3],1) = FCL([2,3],1)-d;
FCl([1,2],2) = FCL([1,2],2)-d;
FCl([3,4],2) = FCL([3,4],2)+d;

dx = (max(FCl(:,1))-min(FCl(:,1)))/2;
dy = (max(FCl(:,2))-min(FCr(:,2)))/3;

COM_Lim = zeros(6,2,2);

%2%1%5
%3%4%6

MiddleX = (max(FCl(:,1)) + min(FCr(:,1)))/2;
COM_Lim(1,:,1) = [MiddleX, MiddleX+dx];
COM_Lim(2,:,1) = [MiddleX, MiddleX+dx];
COM_Lim(3,:,1) = [MiddleX-dx, MiddleX];
COM_Lim(4,:,1) = [MiddleX-dx, MiddleX];
COM_Lim(5,:,1) = [MiddleX-dx, MiddleX];
COM_Lim(6,:,1) = [MiddleX, MiddleX+dx];


MiddleY = (max(FCl(:,2)) + min(FCr(:,2)))/2;
COM_Lim(1,:,2) = [MiddleY-dy/2,MiddleY+dy/2];
COM_Lim(2,:,2) = [MiddleY+dy/2,MiddleY+3*dy/2];
COM_Lim(3,:,2) = [MiddleY+dy/2,MiddleY+3*dy/2];
COM_Lim(4,:,2) = [MiddleY-dy/2,MiddleY+dy/2];
COM_Lim(5,:,2) = [MiddleY-3*dy/2,MiddleY-dy/2];
COM_Lim(6,:,2) = [MiddleY-3*dy/2,MiddleY-dy/2];

COM_Loc = zeros(6,2);

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