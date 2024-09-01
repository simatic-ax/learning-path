## Hands On (OOP03) 

----
<br>

### Goal

Using the solution for the HandsOn2 as the starting point: 


>* **FIRST:** Create a TYPE for the Tank State as the Valve one. 
>* **SECOND:** Create a second class: *TankWithVolume* that implements also the interface *ITank* created in the HandsOn2. 
>* **THIRD:** Create a program that calculates and displays as an output the current volume of the tank .



----
### TYPE for Tank State

|Status|
   |-|
   |Filling|
   |Emptying|
   |Flushing|
   |Closed|

**Advice:** remember that the starting state is closed and you should include it on the definition.

----

### Tank with Volume

----
> This tank implements also the ITank interface created on the previous hands On.

> It also has a new parameter **volume** given as an entry by the user with the tank volume as a REAL.

> To handle the different status transitions, it will have entries to activate the different states: fill, empty, flush and close.

> In addition, it has three new methods:  
>    **WriteCyclic(Capacity : REAL)** 

>    **Capacity : REAL** that returns a real with the percentage of capacity of the volume of the tank.  

>    **ReadCyclic(Fill : BOOL, Empty : BOOL, Flush : BOOL, Close : BOOL)** to read the entries.

----

### Program for calculating and displaying

----

Structure the program as: 

>1. Declaration of the external variables that you will use on the program: valves, tank, phyisical entries...

>2. Then, declarate the complements that you will need to execute the program. For example, a timer, the filling and emptying rates...

>3. Initialize the variables and read the entries that you need.

> 4. Evaluate the different tank phases and update the current volume in each phase. We define here that the filling/emptying is **5 L/s**. So every second we activate and reinitialize a timer and increment/decrement a variable in 5 units.

> 5. Write on the outputs.