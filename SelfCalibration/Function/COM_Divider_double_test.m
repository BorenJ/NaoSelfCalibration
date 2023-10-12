function [FCl, FCr, COM_Loc, Center] = COM_Divider_double_test(FootCorner0, d, dx, dy)
FCL = FootCorner0(1:4,:);   % Left foot corner
FCR = FCL;
FCR(:,2) =  FCL(:,2) - 100; % right foot corner

FCr = zeros(size(FCR));
FCl = zeros(size(FCL));

FCr([1,4],1) = FCR([1,4],1) +d + dx;
FCr([2,3],1) = FCR([2,3],1) -d + dx;
FCr([1,2],2) = FCR([1,2],2) -d - dy;
FCr([3,4],2) = FCR([3,4],2) +d - dy;

FCl([1,4],1) = FCL([1,4],1) +d ;
FCl([2,3],1) = FCL([2,3],1) -d ;
FCl([1,2],2) = FCL([1,2],2) -d ;
FCl([3,4],2) = FCL([3,4],2) +d ;

COM_Loc = zeros(2,2);

COM_Loc(1,:) = [(FCl(1,1)+FCl(2,1))/2, (FCl(1,2)+FCl(4,2))/2];
COM_Loc(2,:) = [(FCr(1,1)+FCr(2,1))/2, (FCr(1,2)+FCr(4,2))/2];

Center = [mean(COM_Loc(:,1)),mean(COM_Loc(:,2))];
end