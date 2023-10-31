# Humanoid Self-Calibration Foot Force Sensors
This project is intented to let humanoid robot self-calibrate their foot force sensors. It contains humanoid robot whole-body trajectory planning based on model-predict-control, and sensor calibration algorithm. (The current version contains humanoid whole-body motion planning code, the sensor calibration algorithm with be updated soon!)

The robot model is in the foler `Function`. It contains the model parameters of Nao robot, kinematics method, and graphics visualization engine. 

## Authors
Yuanfeng Han, Boren Jiang, Gregory Chirikjian
- Repository maintainers: Boren Jiang
## Associate paper

Han, B. Jiang, and G. S. Chirikjian, “Watch me calibrate my force-sensing shoes!” in  2022 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS).  IEEE, 2022, pp. 8344–8351.

If you find this repo useful, please give us a star and cite:
```
@inproceedings{han2022watch,
  title={Watch Me Calibrate My Force-Sensing Shoes!},
  author={Han, Yuanfeng and Jiang, Boren and Chirikjian, Gregory S},
  booktitle={2022 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)},
  pages={8344--8351},
  year={2022},
  organization={IEEE}
}
```
## Description
We presents a novel method for smallersized humanoid robots to self-calibrate their foot force sensors. The method consists of two steps: 1. The robot is commanded to move along planned whole-body trajectories in different double support configurations. 2. The sensor parameters are determined by minimizing the error between the measured and modeled center of pressure (CoP) and ground reaction force (GRF) during the robot’s movement using optimization. This is the first proposed autonomous calibration method for foot force-sensing devices in smaller humanoid robots. Furthermore, we introduce a high-accuracy manual calibration method to establish CoP ground truth, which is used to validate the measured CoP using self-calibration. The results show that the self-calibration can accurately estimate CoP and GRF without any manual intervention. Our method is demonstrated using a NAO humanoid platform and our previously presented forcesensing shoes.

## Implementation
Please make sure you have matlab on you PC and download all the source codes and data to your preferred directory.

Please notice that we use matlab default rotation matrix, `rotx, roty, rotz`. The default trigonometric functions of them are in degrees as `sind` and `cosd`. Please remember to custumize them with `sin` and `cos`.

The executable humanoid whole-body motion planning based on model-predict control code is `NAO_FootCal_MPC_paper.m`. All the called functions are in the folder: 'Function'.  

Kindly change the path to your own directory. 
```
addpath('$your_own_path/Function');
load('$your_own_path/data/training/q_init_1.mat')
```
And then you can run the code. 
The different double support can be selected by changing chosed trainng or testing in `data`.
