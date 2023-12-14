# 🕹️ Home Control

This project aims to implement an innovative residential lighting control system, standing out for the strategic application of Field-Programmable Gate Arrays (FPGAs). The proposal focuses on providing precise and efficient lighting control, offering users a personalized and adaptable experience.

The strategic use of FPGAs allows the integration of various configuration modes, providing the system with notable flexibility and adaptability. With a simple touch of a button, users have the ability to adjust light intensity, creating a personalized atmosphere for different activities and preferences. The inclusion of a night mode, activated by a selector switch, automatically softens the lighting during the night, aiming for residents' comfort and energy efficiency.

The FPGA simplifies individual control of lights in each room, allowing precise lighting adjustments in different areas of the residence. Activating lights through specific buttons or switches offers convenience, while a master switch provides centralized control to turn on or off all lights in the residence.

This digital system, based on FPGAs, combines energy efficiency, personalized automation, and user-friendly operation, aiming to create a smart and comfortable residential environment. The choice of Field-Programmable Gate Arrays (FPGAs) in this residential lighting control project offers a flexible and efficient solution.

![Preview](./assets/preview.png)
![Finite State Machine](./assets/FSM.png)
The representation above illustrates the states of the machine and their respective transitions. As evidenced in the image, in the upper-left corner, the states of the variables employed in the design and control of the machine are located. Immediately adjacent is its graphical representation, along with the expected transitions.

In the first state, the machine initializes, where the controller is turned off, exerting no influence over the home lighting system. In the second state, the use of the controller begins, revealing possible directions for the machine: individual control of rooms and/or management of the system's intensity. In the third state, we are effectively regulating the system's intensity and its lighting, while in the fourth state, we have the literal structure for controlling the intensity counter.

As observed, there is the ability to count up to 3, with reduced intensity when the night mode is active, and up to 5, with maximum intensity when it is not active. In both situations, the counter process occurs in a circular structure, resetting the counter state to its default configuration (minimum intensity of unit value) upon surpassing the limits, whether lower or upper.

From this point, the machine continues to allow control not only of the intensity but also of each room independently. It is worth noting the canonical transition for all states, as they are directly dependent on the main switch, the general key. Thus, the machine and its functionalities return to the initial state or proceed with transitions solely dependent on this control variable.

## ✍️ Authors

- [Ernane Ferreira](https://github.com/ernanej) 🧑🏼‍💻
- [Quelita Míriam](https://github.com/quelita2) 👩🏼‍💻
- [Thiago Lopes](https://github.com/thiagonasmto) 🧑🏼‍💻

---

<div align="center">
  📚 DCA0119 - DIGITAL SYSTEMS - T01 (2023.2 - 35M56) 🎓 <br/>
  Federal University of Rio Grande do Norte - Department of Computer and Automation Engineering (DCA). 🏛️
</div>
