## Exercise 1: Implement a valve

### Function Block 'Valve'

* Write a function block 'Valve' with an interface as shown below
* The function block should be placed within a namespace 'ControlModules'
* Create an instance the valve in VAR_GLOBAL, call it in a Program (hint: VAR_EXTERNAL)
* Download the program to a PLC
* Modify the cmdOpen and watch the outputs of the valve
* The solution for this exercise can be found in exercise 2

The interface of the valve should look like this:

<img src="img/Valve.png" width="400"/> 

|parameter name|section|type|
|-|-|-|
|cmdOpen|INPUT|BOOL|
|cmdClose|INPUT|BOOL|
|ctrlOpen|OUTPUT|BOOL|
|ctrlClose|OUTPUT|BOOL|

The behavior of the valve is shown in the diagram:  

<img src="img/ValveBehav.png" width="400"/>
