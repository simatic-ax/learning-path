---
title: OOP in ST
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
mermaid:
  theme: 'base'
  themeVariables:
    lineColor: '#000000fc'
    primaryColor: '#cde6eb'
---
## Agenda

| ID | Topic |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| 03 | Introduction to ST Programming |
| 04 | Loading and Debugging |
| **05** | **OOP Elements of ST** |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |

---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="grid-two-col-eq">
  <div class="flex-col justify-center">
    <p>To get started, you need to have SIMATIC AX, apax and all its prerequisites installed.</p>
    <p>Additionally you should know the basics of ST and be able to program procedual ST on your own.</p>
    <br/>
    <p>With this you are set up to continue with this learning path.</p>
  </div>
</div>
---

<div class="">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>What will you learn in this chapter?</h2>
    </header>
  </div>
  <div>
    <p>Object oriented programming is a paradigm that can help you better structure your code and model data similar to the real world.</p>
    <br>
    <p>In this chapter we will explore some of the ways that OOP can be used in ST to get some advantages; it is not meant to give you a complete introduction to object oriented programming, there are a lot of free resources to cover this topic in far greater depth than it would be possible for a learning path of this format.</p>
    <div class="warning">This chapter is intended for users who want to dive into more advanced programming topics.
You can skip this chapter for now, if you just want to get started with the basics of AX and come back later to learn more about how OOP helps you to structure your code.</div>

  </div>

</div>

---

# OOP

## Object oriented programming

---


## Introduction
<br/>

### Some facts about OOP

Object-oriented programming (OOP) is a programming paradigm based on the concept of "objects", which can contain **data** and **code**: data in the form of fields (often known as **attributes** or **properties**), and code, in the
form of **methods**.

A feature of objects is that an object's own **procedures** can **access** and often **modify** the data fields of itself (objects have a notion of this or self).

In OOP, computer programs are designed by making them out of objects that **interact** with one another.
<br/>
<br/>
<br/>

### History

The basics of OOP were developed in the 60ties and 70ties during the software crisis.

In this time, the software costs exceeded the hardware costs. In the 80ties, OOP became popular in computer programming.

---
<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Main concepts of OOP</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>OOP consists of several concepts that can be a fit for different scenarios or design patterns.
    Not all concepts must be applied for a programming language to be object oriented.</p>
    <p>The main difference between OOP and non-OOP is how data is modelled; how the name implies data is represented as objects.<p>
    <p>We will learn about objects in depth in the next chapter.<p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/valvescheme.png); background-repeat: no-repeat; background-size: contain; margin-top: -7rem;">
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Main concepts of OOP</h2>
        <h3>Objects</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>If we have a look at our valve, that we programmed in the previous chapter, we can identify certain attributes that are associated with it:</p>
    <ul>
        <li>Valve is open</li>
        <li>Valve is closed</li>
    </ul>
    <p>Additionally there are certain actions that we can execute on the valve to modify its state:</p>
    <ul>
        <li>Open the valve</li>
        <li>Close the valve</li>
    </ul>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/valvescheme.png); background-repeat: no-repeat; background-size: contain; margin-top: -7rem;">
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Main concepts of OOP</h2>
        <h3>Objects</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>This can be represented programmatically as an object or a data structure called a class.</p>
    <p>A class has fields (or variables) that represent the state and methods (functions) that represent behavior.</p>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/valveuml.svg); background-repeat: no-repeat; background-size: 50%;"> </div>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Main concepts of OOP</h2>
        <h3>Objects</h3>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>On the right side you see an example of a class in ST. We can define the fields in the interface, similar to the function block and the methods are declared within the class. The access to the methods and fields is similar to access in a namespace:</p>
    <br>
    <pre>
    VAR
        myValveInstance : Valve;
        isOpen : BOOL;
    END_VAR
    </pre>
    <br>
    <pre>
    myValveInstance.Open();
    isOpen := myValveInstance.IsOpen;
    </pre>
  </div>
  <div class="grid-slide-image">
    <pre>
    CLASS Valve
    </pre>
    <br>
    <pre>
        VAR PUBLIC
            isOpen : BOOL;
            isClosed : BOOL;
        END_VAR
        </pre>
    <br>
    <pre>
        METHOD PUBLIC Open
            isOpen := TRUE;
            isClosed := FALSE;
        END_METHOD
        </pre>
    <br>
    <pre>
        METHOD PUBLIC Close
            isOpen := FALSE;
            isClosed := TRUE;
        END_METHOD
        </pre>
    <br>
    <pre>
    END_CLASS
    </pre>
  </div>
</div>

----
## Instantiate a class in ST

A class can be instanced just like any function block

```C#
    VAR
        v : Valve;
    END_VAR
```

#
#### Remarks

>Classes can not instantiated in:
>
>* **VAR_TEMP** section
>* **VAR_INPUT** section
>* **VAR_OUTPUT** section

>* In ST, classes can only be instantiated during compile time.
>* In opposite to other languages, ST can not create instances during runtime.
>* There are no constructors for classes in ST
----
<br>

## Initializer

```C#
CLASS Valve
    VAR PUBLIC
        isOpen : BOOL;
        isClosed : BOOL;
    END_VAR
END_CLASS

CONFIGURATION
    VAR_GLOBAL
        v : Valve := (isOpen := TRUE);
    END_VAR
END_CONFIGURATION

```

> Public variables can be initialized at declaration.

----
<br>

## Method Call

```C#
PROGRAM
    VAR_EXTERNAL
        v : Valve;
    END_VAR

    v.Open();
END_PROGRAM
```

----

## Difference to FUNCTION BLOCK

A FUNCTION BLOCK is similar to a CLASS with one method

||Function Block|Class|
|-|-|-|
|can be instantiated|yes|yes|
|occupy memory|yes|yes|
|method supported|no|yes|
|access modifier|yes|yes|
|can be inherited|no|yes|

<small>[1] In SCL on TIA Portal they're always public</small>

---

# Encapsulation

## What is a encapsulation?
One of the main concepts of OOP is encapsulation

- The state of a object is stored in member variables
- In a properly designed object, the state can be changed its methods.
- This is achieved by providing public methods that operate on the values of private member variables.
- Encapsulation ensures that private information
 - is not exposed
 - and cannot be modified except through calls of methods

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Encapsulation</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>We have now modelled our Valve class. However currently every user could just modify the state of the valve, even do something that is an invalid state:</p>
    <br>
    <pre>
    myValveInstance.isOpen := TRUE;
    myValveInstance.isClosed := TRUE;
    </pre>
    <p>To prevent this, we want to encapsulate all internal logic to be inaccessible from the outside and the user should only control the state using the defined methods. This can be done, by using access modifier; in </p>
  </div>
  <div class="grid-slide-image">
    <pre>
    CLASS Valve
    </pre>
    <br>
    <pre>
        VAR PRIVATE
            isOpen : BOOL;
            isClosed : BOOL;
        END_VAR
        </pre>
    <br>
    <pre>
        METHOD PUBLIC Open
            isOpen := TRUE;
            isClosed := FALSE;
        END_METHOD
        </pre>
    <br>
    <pre>
        METHOD PUBLIC Close
            isOpen := FALSE;
            isClosed := TRUE;
        END_METHOD
        </pre>
    <br>
    <pre>
    END_CLASS
    </pre>
  </div>
</div>

----
## What is encapsulation ?


One of the main concepts of OOP is encapsulation

* It refers to the bundling of data (variables) and methods (functions) that operate on the data into a single unit, typically a *class*.
* In a properly designed object, the state can be changed. This is achieved by providing public methods that operate on the values of private member variables.
* It also involves restricting direct access to some of an object's components, which is a means of preventing unintended interference and misuse of the data.
* Encapsulation ensures that *private* information
   * is not exposed
   * cannot be modified except through calls of methods
----

## Key benefits

**1. Control of Data:** By controlling access to the data, the class can ensure that it is used only in intended ways.

**2.  Maintainability:** Changes to the implementation details of a class can be made without affecting other parts of the program that uses the class.

**3. Reusability:** Encapsulated classes can be more easily reused across different programs.

**4. Modularity:** Encapsulation leads to better organization of code, making it more modular.

----

## Example

Let's illustrate encapsulation with a simple example of a BankAccount class:

* An account has a balance and a number that identifies the account
* How can I change the state of the balance of a specific account?
----
## Private Attributes:

_accountNumber_ and _balance_ are private attributes of the BankAccount class and can not be accessed from the outside of the class instance (e.g. can not be changed by any other method than the methods of the same BankAccount class instance)
```C#
// Declaration of the BankAccount class
Class BankAccount
VAR
// Private attributes
    accountNumber : INT;
    balance : REAL;
END_VAR
```
----
## Public Methods:

_GetBalance_ method returns the current balance.

_Deposit_ method adds a valid amount to the balance and returns TRUE if the deposit was successful, otherwise FALSE.

```C#
// Public methods
METHOD GetBalance : REAL
VAR_OUTPUT
    GetBalance : REAL;
END_VAR
    GetBalance := balance;
END_METHOD

METHOD Deposit : BOOL
VAR_INPUT
    amount : REAL;
END_VAR
VAR_OUTPUT
    Deposit : BOOL;
END_VAR
    IF amount > 0 THEN
        balance := balance + amount;
        Deposit := TRUE;
    ELSE
        Deposit := FALSE;
    END_IF;
END_METHOD
```
----
_Withdraw_ method subtracts a valid amount from the balance and returns TRUE if the withdrawal was successful, otherwise FALSE.
```C#
METHOD Withdraw : BOOL
VAR_INPUT
    amount : REAL;
END_VAR
VAR_OUTPUT
    Withdraw : BOOL;
END_VAR
    IF (amount > 0) AND (amount <= balance) THEN
        balance := balance - amount;
        Withdraw := TRUE;
    ELSE
        Withdraw := FALSE;
    END_IF;
END_METHOD
```

----
## Initialization:

The Init method is used to set up the initial values of accountNumber and balance when an instance of the BankAccount class is created. This method can act as a substitute for a constructor.
```C#
// Initialization method to set up initial values
METHOD Init
VAR_INPUT
    initAccountNumber : INT;
    initBalance : REAL;
END_VAR
    accountNumber := initAccountNumber;
    balance := initBalance;
END_METHOD
END_CLASS

```

----
<br>

## Benefits

**Controlled Access:**

* The Deposit method ensures only positive amounts are added to the balance.
* The Withdraw method ensures only valid amounts are subtracted, and only if there are sufficient funds.

----
<br>

## Accessors

### For methods and properties


| **Accessor**      | **These attributes can be accessed**   |
|---------------|------------------------------------|
| **PRIVATE**   | only inside the class|
| **PROTECTED** | by derived classes|
| **PUBLIC**    | by everybody|



<br>

>**Remark**: In ST the accessor for methods and properties by default is always PROTECTED
----

## Examples for Accessors

```C#
NAMESPACE ControlModules
    CLASS Valve
        VAR PRIVATE
            _anyPrivate : BOOL;
        END_VAR
        VAR PUBLIC
            _anyPublic : BOOL;
        END_VAR
        VAR PROTECTED
            _anyProtected : BOOL;
        END_VAR
        METHOD PRIVATE Check
            ;
        END_METHOD
        METHOD PUBLIC Open
            ;
        END_METHOD
        METHOD PROTECTED Close
            ;
        END_METHOD
    END_CLASS
END_NAMESPACE
```

---

## Hands On (OOP01)
### Goal

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

## ValveBase Class ValveBase

|**Method**|**Functionality**|
|-|-|
|Open()|Open the valve|
|Close()|Close the valve|
|GetState : ValveState| returns the state Undefined, Open, Close (Hint: Enumeration)|
|WriteCyclic(ctrlOpen : BOOL) | for the activation of the digital output. true when valve opened, false when valve is closed|


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

#### Create the Class TankBase

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

## Interfaces

----

## What is an interface ?

An interface is a contract that defines a set of methods **without implementing them**. Classes that implement the interface **must** provide the method implementation.

----

## Main features

1. **Contractual framework:** Specifies methods that must be implemented by any class that uses the interface.

2. **Abstraction:** Provides a way to define capabilities without specifying how they should be implemented.

3. **Multiple inheritance:** Allows a class to inherit from multiple interfaces, enabling more flexible design.

4. **Decoupling:** Promotes loose coupling between classes by separating the definition of methods from the implementation.

5. **Testability:** Facilitates easier unit testing by allowing mock implementations of interfaces.

6. **Reusability:** Promotes code reuse as different classes can implement the same interface in various ways.

<br>
<br>

#### NOTE
Some of the concepts mentioned in the interface features will be seen on next points/chapters

----

## Benefits

**Standardization:** Ensures a consistent method signature across different classes.

**Interoperability:** Enables different classes to work together through a common interface.

**Flexibility:** Allows changes in implementation without affecting the code that relies on the interface.

**Maintainability:** Simplifies the maintenance of large codebases by providing clear method contracts.

----

## Example: Interface definition

```C#
INTERFACE IGeometricCalculation
    METHOD Perimeter : LREAL
    END_METHOD

    METHOD Area : LREAL
    END_METHOD
END_INTERFACE
```

----

## Example: Interface implementation

```C#
CLASS Rectangle IMPLEMENTS IGeometricCalculation
    VAR PUBLIC
        side1 : LREAL;
        side2 : LREAL;
        END_VAR
    METHOD PUBLIC Perimeter : LREAL


        Perimeter := 2 * side1 + 2 * side2;
    END_METHOD

    METHOD PUBLIC Area : LREAL
        Area := side1 * side2;
    END_METHOD
END_CLASS

CLASS Triangle IMPLEMENTS IGeometricCalculation
    VAR PUBLIC
        side1 : LREAL;
        side2 : LREAL;
        side3 : LREAL;
        height : LREAL;
    END_VAR
    METHOD PUBLIC Perimeter : LREAL
        Perimeter := side1 + side2 + side3;
    END_METHOD

    METHOD PUBLIC Area : LREAL

        Area := (side1 * height) / 2;
    END_METHOD
END_CLASS


```

----

## Instantiating the classes

```C#
CONFIGURATION MyConfiguration
    TASK Main(Interval := T#1000ms, Priority := 1);
    PROGRAM P1 WITH Main: MyProgram;
    VAR_GLOBAL
        tri : Triangle :=(side1 := 3, side2 := 3, side3 := 2);
        rect : Rectangle :=(side1 := 4, side2 := 5);
    END_VAR
END_CONFIGURATION
```
----

## Rules when using interfaces

**Method Signature:**

The method signature in the class must exactly match the method signature in the interface.

**Parameter Matching:**

If the interface defines a method with parameters, the implementation in the class must have the same parameters in type, order, and number.

**No Additional Parameters:**

You cannot add additional parameters in the implementation of a method that are not specified in the interface.

---

## Hands On (OOP02)
### Goal

Using the solution for the HandsOn1 as the starting point:


* Create two interfaces, one for the tanks and the other for the valves.
* This interface will work as a "contract" that the classes must implement.
* In this case, we are going to include all the methods implemented in the HandsOn1 in the interface.



----
## Valve Interface

|Method|
   |-|
   |Open()|
   |Close()|
   |GetState : ValveState|
   |WriteCyclic(ctrlOpen : BOOL) |

<br>
<br>

**Advice:** remember that the interface does not include any implementation, only the definition.

----

## Tank Interface

|Method|
   |-|
   |OpenInlet()|
   |OpenOutlet()|
   |CloseInlet()|
   |CloseOutlet()|
   |Fill()|
   |Flush()|
   |Close()|
   |Emptying()|
   |WriteCyclic(Capacity : REAL) |

**Advice:** remember that the interface does not include any implementation, only the definition.

---

## Hands On (OOP03)
### Goal

Developing program skills is achieved by practicing and trying to solve problems yourself. The next challenge is to apply what you have learned since the beginning of this training.

The proposal is to **develop a program that calculates the volume of a tank**.

Here you will read physical entries, write on outputs, use timers, evaluate cases...

----

Using the solution for the HandsOn2 as the starting point:


* **1:** Create a TYPE for the Tank State as the Valve one.
* **2:** Create a second class: *TankWithVolume* that implements also the interface *ITank* created in the HandsOn2.
* **3:** Create a program that calculates and displays as an output the current volume of the tank .



----
## TYPE for Tank State

|Status|
   |-|
   |Filling|
   |Emptying|
   |Flushing|
   |Closed|

**Advice:** remember that the starting state is closed and you should include it on the definition.

----

## Tank with Volume

> This tank implements also the ITank interface created on the previous hands On.

> It also has a new parameter **volume** given as an entry by the user with the tank volume as a REAL.

> To handle the different status transitions, it will have entries to activate the different states: fill, empty, flush and close.

> In addition, it has three new methods:
>    **WriteCyclic(Capacity : REAL)**

>    **Capacity : REAL** that returns a real with the percentage of capacity of the volume of the tank.

>    **ReadCyclic(Fill : BOOL, Empty : BOOL, Flush : BOOL, Close : BOOL)** to read the entries.

----

## Program for calculating and displaying

Structure the program as:

>1. Declaration of the external variables that you will use on the program: valves, tank, physical entries...

>2. Then, declare the complements that you will need to execute the program. For example, a timer, the filling and emptying rates...

>3. Initialize the variables and read the entries that you need.

> 4. Evaluate the different tank phases and update the current volume in each phase. We define here that the filling/emptying is **5 L/s**. So every second we activate and reinitialize a timer and increment/decrement the fill value by 5 units.

> 5. Write on the outputs.

---

## Inheritance
### What is inheritance?

Inheritance is a fundamental principle where a new class, called the derived or child class, inherits properties and behaviors (methods) from an existing class, known as the base or parent class. This mechanism promotes code reuse and establishes a natural a hierarchy between classes.

----

## Benefits of Inheritance

1. **Reusability:** Inheritance allows the reuse of existing code. Common functionality can be defined in a base class and inherited by multiple derived classes, reducing redundancy.

2. **Maintainability:** Changes made to a base a class are automatically inherited by derived classes, making the code easier to update and maintain.

3. **Extensibility:** New functionalities can be added to existing classes without modifying them. Derived classes can extend base classes by adding new methods and properties.

4. **Abstraction:** Simplifies complex systems by defining common behaviors in base classes, while derived classes provide specific implementations.

5. **Polymorphism:** Allows objects of different classes to be treated as objects of a common base class, enabling flexible and interchangeable code.



----

## EXAMPLE

```C#
CLASS vehicle
    VAR
        Brand : STRING;
        Model : STRING;
        Speed : INT;
        FuelLevel : INT;
    END_VAR

    METHOD PUBLIC SetSpeed
        VAR_INPUT
            newSpeed : INT;
        END_VAR
        Speed := newSpeed;
    END_METHOD
END_CLASS

CLASS car EXTENDS VEHICLE
    VAR
        NumberOfDoors : INT;  //New property
    END_VAR

    METHOD PUBLIC SetFuelLevel  //New Method
        VAR_INPUT
            newFuelLevel : INT;
        END_VAR

        FuelLevel := newFuelLevel;
    END_METHOD
```
---
## Hands On (OOP04)
### Goal

Using the solution for the HandsOn3 as the starting point:


>* Applying **inheritance** create a class: *ComplexValve* that has an entry: *Regulator* and instead of boolean the regulation can be adjusted from 0 to 100 for both states, open and closed.

For example: if the regulator for the entry valve is 30, the valve will be opened the 30%.
----

>* Applying **inheritance** create a file: *TankWithShape* that has an two classes: *CylindricalTank* and *CubeTank*. These classes extend the properties of the *TankWithVolume* but now the volume is calculated with a  method called *VolumeCalculator* and the result stored in the property *volume*.
>   * For the cylindrical tank it is needed to provide to the method the properties: *radium* and *height*
>   * For the cube tank only a single property (is a regular cube): *side_length*

----

>* With this new valves, **modify the previous volume calculator**. To guide you through the process and facilitate the understanding:
>   * You need to modify the filling/emptying rate by multiplying the rate plus the regulation value. This regulation value is a value that is needed to read from an entry of the valve in the first program lines after the declaration of variables.
----

>   * To use the new classes tankCube/tankCylinder, choose your favorite and provide the properties in the declaration. Then, in the initialization call the method to Calculate the tank volume that writes on the tank property volume.


**For example**: If the regulation is 50% on the entry valve. In this case, the filling rate will be: 5 * 50/100 = 2.5 L/s. So here, every second that the timer is executed you add to the current_volume := current_volume + filling_rate * MAX_FILLING_RATE;


>* **HINT:** Now for the **flushing state** you must take into account that the filling and emptying rates can be different. So in this state the tank can be filled or emptied too.



---

<header class="slide_header">
  <h2>
        What did you learn
  </h2>
</header>

<div class="grid-two-col-foc-right">
  <div class="flex-col justify-center">
    <p>In this section you learned about...</p>
    <ul>
      <li>what OOP and why it is widely used in software development.</li>
      <li>about OOP features in Structured Test</li>
      <li>how to structure your code to follow the OOP paradigm</li>
    </ul>
    <br>
  </div>
</div>



