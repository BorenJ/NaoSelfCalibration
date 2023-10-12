function JointAngle = JointAngleAssign(q)
JointAngle = zeros(16,3);

JointAngle(3,2) = deg2rad(110);
JointAngle(6,2) = deg2rad(110);
JointAngle(4,1) = deg2rad(86);
JointAngle(7,1) = -deg2rad(86);
JointAngle(4,3) = deg2rad(90);
JointAngle(7,3) = -deg2rad(90);

JointAngle(10,2) = q(1);
JointAngle(10,3) = q(2);
JointAngle(11,2) = q(3);
JointAngle(12,2) = q(4);
JointAngle(12,3) = q(5);
JointAngle(14,2) = q(6);
JointAngle(14,3) = q(7);
JointAngle(15,2) = q(8);
JointAngle(16,2) = q(9);
JointAngle(16,3) = q(10);
end