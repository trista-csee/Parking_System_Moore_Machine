<a name="readme-top"></a>
<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]]()
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- PROJECT Name --> 
<h1 align="center">Design a parking system that can verify the password and control the gate when the entrance and exit sensors detect an approaching vehicle</h1>

<!--  State Diagram -->
## State Diagram
* In Moore machine, the output depends only on the current state.
* A general model of a Moore machine is shown below. Its output is generated from the state register block.
* The next state is determined using the current input and the current state.
* The state register is also modeled using D flip-flops.
* Normally Moore machines are described using three blocks, one of which must be a sequential and the other two can be modeled using always blocks or a combination of always and dataflow modeling constructs. 

![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/three%20blocks%20Moore%20machine.png)

<!-- Schmatic -->
## Schmatic
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/Schmatic_all.png)

* Enlarge the left half
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/Schmatic_left.png)

* Enlarge the right half
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/Schmatic_right.png)

<!-- Simulation -->
## Simulation
* The entrance sensor which is activated to detect a vehicle coming, a password is requested to open the gate. 
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/sensor_entrance_WAIT_PASSWORD.png)

* If the entered password is not correct, the gate is still locked. 
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/WRONG_PASS.png)

* If the entered password is correct, the gate would open to let the vehicle get in.
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/password_1_2_RIGHT_PASS.png)

* If the current car is getting in the car park being detected by the exit sensor 
and another the car comes, the door will be locked and requires the coming car to enter passwords.
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/sensor_entrance_exit_STOP.png)

* If the entered password is correct, the gate would open to let the vehicle get in. Otherwise, the gate is still locked. 
![image](https://github.com/trista-csee/Parking_System_Moore_Machine/blob/main/STOP_RIGHT_PASS.png)


<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information.

<!-- LET'S GET SOCIAL -->
## Let's Get Social
* [LinkedIn](https://www.linkedin.com/in/hua-chen-wu-363252241/)
* [Github](https://github.com/trista-csee)

<!-- CONTACT -->
## Contact
吳華楨 Trista Wu - trista.cs11@nycu.edu.tw

Project Link: [https://github.com/trista-csee/Parking_System_Moore_Machine](https://github.com/trista-csee/Parking_System_Moore_Machine)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/badge/contributors-1-orange.svg?style=flat-square
[license-shield]: https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square
[license-url]: https://choosealicense.com/licenses/mit
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/hua-chen-wu-363252241/
[product-screenshot]: ./images/projects/portfolio.jpg
