# Low-Cost Solar-Tracking System with PMDC Motor

A closed-loop solar tracking system simulation developed using MATLAB and Simulink/Simscape. The system continuously aligns a solar panel with the sun's position from east to west to optimize solar energy capture.

## Project Contributors
* **Haren Upadhyaya**
* **Debojyoti Sarkar**
* **Giridhar G.R.**
* **Atharva Jadhav**
* **Submission Date:** 30/03/2026

---

## System Overview
Traditional trackers often rely on expensive stepper or shunt motors that require complex control topologies. This project utilizes a simpler, cost-effective alternative: a **Permanent Magnet DC (PMDC) motor** combined with Light Dependent Resistors (LDRs) and an H-Bridge driver.

### Key Working Principles
1. **Sunlight Detection:** Dual LDR sensors (GL5528) are mounted on the east and west boundaries of the solar panel frame.
2. **Signal Conditioning:** The LDR resistances are fed into static voltage divider circuits to generate readable analog voltages.
3. **Control Unit:** An Arduino Uno reads the sensor inputs, evaluates the differential error against a specified deadband threshold, and generates direction inputs alongside a dynamic PWM control signal.
4. **Actuation:** An H-Bridge circuit regulates the current flow polarity through the PMDC motor to enable bi-directional rotation via a worm gear mechanism.

---

## Mathematical Modeling

### LDR Voltage Dividers
The analog voltage feedback signals ($A_0$ and $A_1$) are calculated using standard voltage divider relationships:

$$A_{0} = V_{in}\frac{R_{F}}{R_{F} + R_{0}}$$

$$A_{1} = V_{in}\frac{R_{F}}{R_{F} + R_{1}}$$

Where $R_F$ represents the fixed grounding resistance, and $R_0, R_1$ represent the dynamic operating resistances of the LDR sensors.

---

## Repository Structure
* `/scripts`: Contains the MATLAB parameter initialization, plotting utilities, and core tracking algorithm.
* `/model`: Contains the `.slx` Simulink block design workspace.
* `/docs`: Project documentation and schematic references.

## How to Run the Simulation
1. Open MATLAB and navigate to the root directory of this repository.
2. Run `scripts/init_tracker_params.m` to load the mechanical, electrical, and control parameters into the base workspace.
3. Open `model/solar_tracker_system.slx` and click **Run**.
4. Execute `scripts/plot_results.m` to generate the system response graphs.