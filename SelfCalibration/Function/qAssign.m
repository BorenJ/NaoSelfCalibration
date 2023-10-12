function q = qAssign(JointAngle)
q = zeros(10,1);
q(1) = JointAngle(10,2);
q(2) = JointAngle(10,3);
q(3) = JointAngle(11,2);
q(4) = JointAngle(12,2);
q(5) = JointAngle(12,3);
q(6) = JointAngle(14,2);
q(7) = JointAngle(14,3);
q(8) = JointAngle(15,2);
q(9) = JointAngle(16,2);
q(10) = JointAngle(16,3);
end