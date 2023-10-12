function DrawCapsule(Pos1,Pos2, R)
% Joint Info
x1 = Pos1(1);
y1 = Pos1(2);
z1 = Pos1(3);

x2 = Pos2(1);
y2 = Pos2(2);
z2 = Pos2(3);

% capsule A draw tip
% Vec = [x2,y2,z2] - [x1,y1,z1];
% Vec_Norm = Vec./norm(Vec);
% V1 = [x1,y1,z1] + Vec_Norm *R;
% V2 = [x2,y2,z2] - Vec_Norm *R;
V1 = [x1,y1,z1];
V2 = [x2,y2,z2];


% First sphere
[Xs,Ys,Zs] = sphere(20);
Xs1 = Xs*R + V1(1);
Ys1 = Ys*R + V1(2);
Zs1 = Zs*R + V1(3);

% Second sphere
Xs2 = Xs*R + V2(1);
Ys2 = Ys*R + V2(2);
Zs2 = Zs*R + V2(3);

% Plot
surf(Xs1,Ys1,Zs1,'EdgeColor','none','FaceColor','r','FaceAlpha',0.3); hold on
surf(Xs2,Ys2,Zs2,'EdgeColor','none','FaceColor','r','FaceAlpha',0.3); hold on
[Xc,Yc,Zc]=cylinder2P(R,20,V1,V2);
surf(Xc,Yc,Zc,'EdgeColor','k','FaceColor','r','FaceAlpha',1);  hold on
end

