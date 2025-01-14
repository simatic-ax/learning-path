## Hands On (OOP01) 

----
<br>

### Goal

Using the introduction to ST exercises as starting point: 

Transform Valve and Tank into classes:

**Miniumum:**

- Valve is transformed into Class ValveBase
- Tank is transformed into Class TankBase

**Voluntary:**

- ValveWithClosedSensor is transformed into class
- Valve and Tank is instanced in configuration
- Valve and Tank is called in ExampleProgram
- Compile and download it to the PLC
- Check the functionality of the program

----
### Valve Class

|Method|Functionality|
   |-|-|
   |Open()|Open the valve|
   |Close()|Close the valve|
   |GetState : ValveState| returns the state Undefined, Open, Close (Hint: Enumeration)|
   |WriteCyclic(ctrlOpen : BOOL) | for the activation of the digital output. true when valve opened, false when valve is closed|

**Advice:** do not change the function block. Choose a different namespace instead

----

SHORT HINT OF THE STRUCTURE OF THE CLASS AND THE ENUM
```C#
NAMESPACE FluidHandlingClass
    CLASS ValveClass
        //VARIABLES
        _ctrlOpen : BOOL;
        _state : ValveState;

        //METHODS
        Open();
        Close();
        GetState() : ValveState;
        WriteCyclic(VAR_OUTPUT: (ctrlOpen : BOOL));
    END_CLASS

    //ENUM 
    TYPE ValveState 
       STATES: Open, Closed, Error, Undefined
    END_TYPE
END_NAMESPACE
```
----

#### Create the Class Tank

Transform the function block Tank into a class according the table (next slide)

```C#
NAMESPACE FluidHandlingClass
    CLASS Tank 
        inletValve : Valve
        outletValve : Valve
        Fill()
        Emptying()
        Flush() 
        Close()
    END_CLASS
END_NAMESPACE
```
----

|Method|inletValve|outletValve|
   |-|-|-|
   |Fill()| OpenInlet() | CloseOutlet()|
   |Emptying()|CloseInlet()|OpenOutlet()|
   |Flush()|OpenInlet()|OpenOutlet()|
   |Close()|CloseInlet()|CloseOutlet()|

---