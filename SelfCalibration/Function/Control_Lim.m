function u_max = Control_Lim(q_traj)
Control = [];
    for i = 2:size(q_traj,2)
        Control = [Control,abs(q_traj(:,i)-q_traj(:,i-1))];
    end
    u_max = max(Control,[],2);
end