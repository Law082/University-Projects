# Structural Analysis of Steering Lower Bracket & Fixed Flange (Formula Student)

## Overview 

This project evaluates the structural behavior of the steering lower bracket and fixed flange components from a Formula Student vehicle. The primary objective is to validate the geometric and finite element models (FEM) and determine the distribution of stresses and deformations to ensure the structural integrity of the components remains below the material's yield limit.

## Features

- Execution of three distinct numerical analyses: Free-Free (SOL 103), Free-Constraint (SOL 103), and Linear Static (SOL 101).
- Geometric idealization using Midsurface, Extend Sheet, and Trim Sheet operations to optimize the model for 2D shell elements.
- Application of mechanical loads via Rigid Body Elements (RBE2) to simulate the stiffness of bolt-and-nut assemblies.
- Mesh optimization techniques including Mesh Mating for connectivity and Circular/Mesh Imprints for uniform stress distribution around mounting holes.
- Sensitivity analysis comparing dense mesh results (1-3mm elements) against a coarser mesh (5mm elements)

## Technologies Used

- Software & Tools: Simcenter (for 3D/2D modeling and FEM simulation).
- Materials: Aluminum Alloy Al 2014 (Elastic Modulus: 73.1 GPa, Yield Limit: 394 MPa).
- Element Types: 2D triangular shell elements and RBE2 (Rigid Body Elements).

## Architecture 

The analysis process begins by isolating the specific components from the main Formula Student CAD assembly. Due to the thin-walled nature of the parts, the geometry is idealized to its median surface (Midsurface), and 2D triangular shell elements are applied to reduce computational time while maintaining accuracy.
The testing environment is divided into three stages:
- Free-Free Analysis: Evaluates the unconstrained structure to validate mass, stiffness, and mesh connectivity.
- Free-Constraint Analysis: Applies partial noTrans boundaries to joint areas, blocking translation but allowing rotation to find elastic modes without over-constraining the model.
- Linear Static Analysis: Applies a moment of 1084 Nm (half of 2168 Nm) at the central axis hole and a pressure of 0.312 MPa over a 12,640 mm² surface to simulate cornering reaction forces.

## Results

- The Free-Free modal analysis successfully validated the mesh connectivity, showing the first six natural frequencies near zero (representing rigid body motions).
- By increasing the specified part thickness to 12mm, the maximum displacement was reduced to 0.2 mm, and the Von Mises stress dropped to 146 MPa. This provided a safe structural behavior with a safety factor of approximately 2.7.
- The mesh sensitivity test demonstrated that increasing the element size to 5mm caused stress concentrations to intensify artificially in areas with fewer elements, highlighting the necessity of a refined mesh for accurate results.

## Documentation

[Presentation](Prezentare%20ASM.pptx)

[Documentation](Raport_de_rezultate_Proiect_ASM_Condrea_Laurentiu_Corectat.pdf)
