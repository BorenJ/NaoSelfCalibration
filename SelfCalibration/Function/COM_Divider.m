function COM_Lim = COM_Divider(FootCorner0, d)

FC = FootCorner0;
    
    FC([1,4,5],1) = FC([1,4,5],1)+d;
    FC([2,3],1) = FC([2,3],1)-d; 
    FC([1,2,5],2) = FC([1,2,5],2)+d;
    FC([3,4],2) = FC([3,4],2)-d; 
    
    dx = (max(FC(:,1))-min(FC(:,1)))/3;
    
    COM_Lim = zeros(6,2,2);
    
    COM_Lim(1,:,1) = [min(FC(:,1)) + 1*dx, min(FC(:,1)) + 2*dx];
    COM_Lim(2,:,1) = [min(FC(:,1)) + 2*dx, min(FC(:,1)) + 3*dx];
    COM_Lim(3,:,1) = [min(FC(:,1)) + 2*dx, min(FC(:,1)) + 3*dx];
    COM_Lim(4,:,1) = [min(FC(:,1)) + 1*dx, min(FC(:,1)) + 2*dx];
    COM_Lim(5,:,1) = [min(FC(:,1)) + 0*dx, min(FC(:,1)) + 1*dx];
    COM_Lim(6,:,1) = [min(FC(:,1)) + 0*dx, min(FC(:,1)) + 1*dx];
    
    COM_Lim(1,:,2) = [min(FC(:,2)), 0];
    COM_Lim(2,:,2) = [min(FC(:,2)), 0];
    COM_Lim(3,:,2) = [0, max(FC(:,2))];
    COM_Lim(4,:,2) = [0, max(FC(:,2))];
    COM_Lim(5,:,2) = [0, max(FC(:,2))];
    COM_Lim(6,:,2) = [min(FC(:,2)), 0];
end