# Mobile Robot Flatness Control Enhanced with SMC

## Introduction
This project began with the implementation of a **flatness-based control strategy** for a mobile robot to track a desired trajectory. To enhance the system's robustness against disturbances, a **Sliding Mode Controller (SMC)** was integrated. The final solution combines the precision of flatness control with the robustness of SMC.

---

## Original Work: Flatness Controller

### Objective
Design a controller based on flatness theory to achieve precise trajectory tracking.

### Implementation
- Defined a desired circular trajectory for the robot.
- Used flatness properties to compute control inputs for trajectory tracking.
- Simulated the system under ideal conditions, without disturbances.

### Outcome
The flatness controller successfully tracked the trajectory in an ideal environment.

---

## Enhancement: Sliding Mode Controller (SMC)

### Why Add SMC?
The flatness controller, while effective in ideal conditions, is sensitive to external disturbances like wind. To address this limitation, SMC was added to:
- Increase robustness to uncertainties and external disturbances.
- Ensure accurate trajectory tracking even in non-ideal conditions.

### Integration Details
- Introduced a **sliding surface** based on tracking errors for the desired trajectory.
- Added SMC gains (`lambda`, `kappa`) and boundary layer parameters (`epsilon`, `gamma`) to balance performance and reduce chattering.
- Combined SMC inputs with the flatness-based control outputs.

### New Features
- Handles wind disturbances modeled as a sinusoidal function.
- Smoothens tracking with a boundary layer to reduce chattering.

---

## Simulation Results

### Performance Improvements
- Demonstrated robust trajectory tracking under wind disturbances.
- Reduced tracking errors compared to flatness control alone.

### Visualizations
1. **3D Trajectory Plot**: Shows alignment of the robot's actual path with the desired path.
2. **Time-Series Plots**:
   - Desired vs. actual trajectories.
   - Robot speed and angular velocity profiles.
   - System robustness under wind disturbances.

---

## How to Run the Code

1. Clone this repository to your local machine.
2. Open the file `mobileRobotFlatControl3Dfinalcode.m` in MATLAB.
3. Run the script to simulate the trajectory tracking under disturbances.
4. Review the generated plots for:
   - Desired vs. actual trajectories.
   - Robot speed and angular velocity consistency.
   - System robustness under wind disturbances.

---

## Requirements
- MATLAB R2024a or later (recommended).
- Basic understanding of flatness-based control and SMC theory.

---

Feel free to reach out for any questions or suggestions!
