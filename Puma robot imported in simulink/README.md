# Control Systems in Robotics: PUMA Robotic Arm

## Overview

This project represents the foundational baseline that served as the starting point for my final Master's Degree Final Project. Developed in the MATLAB Simulink environment, this base project focuses on simulating a Pick-and-Place trajectory and evaluating the robot's motion accuracy across five different control methods.

Notably, this foundational project explores two advanced control architectures—Inverse Dynamic Control and Cartesian Space Control—which provide a deep mathematical approach to robot kinematics and dynamics.

## Features

- Inverse Dynamic Control: This method explicitly calculates the exact forces and torques required to move the robot by mathematically modeling its physical properties. It uses the Lagrange-Euler method to compute the Inertia $M(q)$, Coriolis $B(q)$, Centrifugal $C(q)$, and Gravity $G(q)$ matrices. By feeding these calculations into the system, it effectively cancels out the robot's nonlinearities, allowing for highly precise joint control.
- Cartesian Space Control: Instead of controlling the angles of each individual joint separately, this method controls the robot's end-effector directly in the 3D X-Y-Z space. It achieves this by using Forward Kinematics (Homogeneous Transformation Matrices) to map the joint space to Cartesian coordinates, and utilizes the Jacobian matrix to accurately map velocities and accelerations.

## Technologies Used

- Core Concepts: Forward and Inverse Dynamics, Lagrange-Euler Method, Forward Kinematics, Jacobian Matrix, PID Controllers.

## Results 

The advanced Inverse Dynamic and Cartesian Space controls successfully demonstrated how theoretical mathematical models (Jacobians and transformation matrices) translate into accurate physical simulations.

## Documentation

[Documentation](ProiectSCRICondrea%20Laurentiufinal.pdf)
