# Mobile Robot for Waste Sorting

## Overview

This project involves building and programming a mobile robot, controlled by an infrared (IR) remote, equipped with an articulated robotic arm designed for manual manipulation and sorting of waste into mini-bins. The project integrates a tracked chassis for locomotion, a 5-degree-of-freedom arm driven by servomotors, and a centralized control system based on Arduino

Note: This mobile robot project served as the foundational proof-of-concept that ultimately inspired and launched my Bachelor's Degree project. The hands-on experience gained here with chassis locomotion, multi-axis robotic arms, and Arduino-based IR control directly influenced the design and architecture of my final thesis.

## Features 

- Tracked locomotion: "Tank" style system, controlled by two L9110 motor drivers, allowing complex movements (forward, backward, pivoting).
- Precise manipulation: Articulated robotic arm equipped with 5 independent servomotors (base, joint 1, joint 2, joint 3, gripper end-effector).
- IR Remote Control: Manual remote operation using an IR sensor and remote; control is achieved by selecting the desired axis/motor using numeric keys (defined via enum) and commanding movement via directional keys.
- Stabilized power system: Integration of a higher capacity power supply (2x0.5 cable instead of 6x0.22) and a voltage stabilizer to eliminate fluctuations and servo "jitter".

## Technologies Used

- Hardware (Central Unit): Arduino UNO development board.
- Hardware (Locomotion & Actuation): Tracked chassis with 2 DC motors, 2 x L9110 motor drivers, 5 x servomotors for the arm.
- Hardware (Power & Control): 5V power supply, voltage stabilizer, IR sensor + remote control, LED status module
- Software: Arduino IDE (C/C++), Servo.h and DIYables_IRcontroller.h libraries.

## Architecture

The system is orchestrated by the Arduino UNO board. The locomotion unit is provided by the modified chassis, whose transverse rods were extended to make room for the robotic arm's base. The two DC motors of the tracks are connected to PWM pins (2, 3, 4, 9) through two L9110 drivers, controlled via differential logic (the direction of opposing tracks reverses for turning).

The robotic arm is controlled via PWM signals using the Servo.h library on allocated pins (e.g., pin 10 for the base, 6 for the effector). Navigation and commands are decoded by the IR sensor connected to pin 7. In the code, an enum structure stores the current state of the selected module (e.g., DIRECTIE, BAZA, CUPLA1), and the loop functions incrementally modify (+15/-15 degrees) the servomotor angles based on the remote's directional inputs.

## Results

- The final assembled robot can successfully move and manipulate objects according to the commands received from the remote control.
- Encountered challenges: Electromagnetic interference caused by the Arduino's power supply, which accidentally triggered the chassis's right motor, and mechanical wear of the plastic gears inside the effector's servomotor.
- Resolved challenges: The initial jittering of the arm's servomotors was fixed by adding a voltage stabilizer and replacing the thin power wires.

## Documentation

[Presentation](Presentation%2018.pptx)

[Documentation](Documentatie%20Roboti%20Mobili%20Condrea%20Laurentiu.pdf)
