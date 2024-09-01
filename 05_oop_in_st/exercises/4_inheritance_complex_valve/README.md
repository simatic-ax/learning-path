## Hands On (OOP04) 

----
<br>

### Goal

Using the solution for the HandsOn3 as the starting point: 


>* Applying **inheritance** create a class: *ComplexValve* that has an entry: *Regulator* and instead of boolean the regulation can be adjusted from 0 to 100 for both states, open and closed. We will store the regulator value as a protected value that we will read in a method called *ReadCyclic*. For example: if the regulator for the entry valve is 30, the valve will be opened the 30%. 

>* For testing in next chapter, here also in the *ComplexValve* we will overwrite the methods Open/Close but we will not use them. Give this methods an entry variable with an integer of the percentage of regulation for the valve. And return the same regulation value but in decimal (as a real). The interface will consider this methods as new methods and do not lead to problems on the implementation.

>* Applying **inheritance** create a file: *TankWithShape* that has an two classes: *CilindricTank* and *CubeTank*. These classes extend the properties of the *TankWithVolume* but now the volume is calculated with a  method called *VolumeCalculator* and the result stored in the propertie *volume*.

>   * For the cilindric tank it is needed to provide to the method the properties: *radium* and *height*
>   * For the cube tank only a single propertie (is a regular cube): *side_length*

----

>* With this new valves, **modify the previous volume calculator**. To guide you through the process and facilitate the understanding:
>   * You need to modify the filling/emptying rate by multiplying the rate plus the regulation value. This regulation value is a value that is needed to read from an entry of the valve in the first program lines after the declaration of variables.

>   * To use the new classes tankCube/tankCilinder, choose your favourite and provide the properties in the declaration. Then, in the intialization call the method to Calculate the tank volume that writes on the tank propertie volume.


**For example**: If the regulation is 50% on the entry valve. In this case, the filling rate will be: 5 * 50/100 = 2.5 L/s. So here, every second that the timer is executed you add to the current_volume := current_volume + filling_rate * MAX_FILLING_RATE;


>* **HINT:** Now for the **flushing state** you must take into account that the filling and emptying rates can be different. So in this state the tank can be filled or emptied too. 

