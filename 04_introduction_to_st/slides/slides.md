---
title: Introduction to ST Programming
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,
---

# Agenda

| ID | Topic |
| -- | ---- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| 03 | Loading and Debugging |
| **04** | **Introduction to ST Programming** |
| 05 | OOP Elements of ST |
| 06 | Unit Testing |
| 07 | Tools for commissioning |
| 08 | Package management |
| 09 | Hardware Configuration |

---

## Prerequisites

Basic SCL programming knowledge

The target audience for this training includes beginners and those transitioning from SCL who already have basic knowledge in SCL programming and wish to expand their skills in ST programming in SIMATIC AX.

---

## What will you learn in this chapter

- Understand the configuration and structure of an ST program: The training explains the structure of an ST program, which consists of a configuration and one or more Program Organization Units (POUs). It also covers tasks, global variables, and their usage within a program.
- Understand Program Organization Units (POUs): The training explains the different types of POUs, such as programs, functions, and function blocks, and how they are used in an ST program to perform specific tasks.
- Understand the usage of namespaces and functions/function blocks: The training explains the use of namespaces to structure code into separate areas and improve reusability.

**Hint:** All topics will be covered in the exercises of this chapter.

---

## ST Program

A ST application consists of:

- a Configuration
- Task(s)
- Program organization units

A minimal ST program consists of a **CONFIGURATION** and a **PROGRAM**.

---

## Configuration & Tasks

A configuration is used to...

- abstract the hardware from the software part of the application
- define all resources of an application like:
  - tasks
  - programs and their order of execution
  - declaration of global variables and instances
  - declaration of I/O

---

## Task Configuration

```
CONFIGURATION PLC_1
    TASK Main(Interval := T#10ms, Priority := 1);
    PROGRAM P1 WITH Main : ExampleProgram;
END_CONFIGURATION
```

In this example, the task 'Main' will be executed every 10ms.

The Program 'ExampleProgram' is assigned to this task.

---

## Global Variables

Global variables are variables that are accessible and modifiable from any part of the program. These variables are declared outside of any function or block and can be used throughout the entire program. They can be useful for sharing data between different parts of the program.

Declaration of global variables or global constants and instances:

```
CONFIGURATION PLC_1
    VAR_GLOBAL
    END_VAR
    VAR_GLOBAL CONSTANT
    END_VAR
END_CONFIGURATION
```

---

## Example: Configuration & Global Variables

| Variable       | cycleCount : INT; |
| -------------- | ----------------- |
| Instances      | v1 : Valve;       |
| Digital input  | v1isClosed AT %I0.1 : BOOL; |
| Digital output | v1ctrlOpen AT %Q0.0 : BOOL; |

```
CONFIGURATION PLC_1
    VAR_GLOBAL // Variables and Instances
        v1ctrlOpen AT %Q0.0 : BOOL;  // digital  output
        v1isClosed AT %I0.0 : BOOL;  // digital input
        v2ctrlOpen AT %Q0.1 : BOOL;  // digital  output
        v2isClosed AT %I0.1 : BOOL;  // digital input
        v1 : Valve; // instance of Valve (can be a function block or class)
        v2 : Valve; 
        t1 : Tank := (volume := REAL#100.0); // with initialization
    END_VAR
    VAR_GLOBAL // Another VAR_GLOBAL section
        cycleCount : INT; // global variable of type integer
    END_VAR
    VAR_GLOBAL CONSTANT // Constants
        PI : REAL := REAL#3.141592;
    END_VAR
END_CONFIGURATION
```

---

## Program organization units (POU)

Following POUs exist in ST:

- Program
- Function
- Function Block
- Class & Methods (not in this session)

---

## Program

A program declaration defines a program, its used variables and the executed program (code).

A program may declare the following sections:

```
PROGRAM ExampleProgram
    VAR_EXTERNAL    
        //global  variables / instances from the configuration
    END_VAR
    VAR
        // program local variables / instances (static)
    END_VAR
    VAR_TEMP
        // temporary local variables (will be reset in each cycle)
    END_VAR
    ;   // program code
END_PROGRAM
```

- Classes/Function blocks can not be instantiated in VAR_TEMP
- Benefit: you can modularize the program

---

## Example: Program

```
PROGRAM ExampleProgram
    VAR_EXTERNAL
        v1ctrlOpen : BOOL;  
        v1isClosed : BOOL;  
        v2ctrlOpen : BOOL;  
        v2isClosed : BOOL;  
        v1 : Valve; 
        v2 : Valve; 
        t1 : Tank;
    END_VAR    
    ;
END_PROGRAM
```

---

## Functions

A function is a POU which does not store its state. It may or may not additionally declare a return value.

It can contain the following sections:

| Section                | Meaning                                      |
| ---------------------- | -------------------------------------------- |
| VAR_INPUT              | Input variables                              |
| VAR_OUTPUT             | Output variables                             |
| VAR_IN_OUT             | Reference to any other variable              |
| VAR_TEMP               | Temporary variables                          |
| VAR_EXTERNAL (CONSTANT)| Access to a global variable/constant declared in the configuration section |
| VAR CONSTANT           | Constants within the function                |

---

## Example: Function and Program

```
FUNCTION Area : LREAL
    VAR_INPUT
        diameter : LREAL;
    END_VAR
    VAR_EXTERNAL CONSTANT
        PI : REAL;
    END_VAR
    Area := diameter ** 2.0 * PI / 4.0; // (d^2*PI)/4;
END_FUNCTION
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Area(diameter := 2.0); 
    ;
END_PROGRAM
```

Question: What needs to be done, in case you wanted to calculate the area of a square?

Notes: rename the function to CircleArea and SquareArea OR --> Namespaces

---

## Function Block

A function block is another program organization unit (POU) to modularize your program.

In contrast to a FUNCTION, a FUNCTION_BLOCK persists its state over multiple cycles.

---

## Structure of Function Block

It can contain the following sections:

| Section                | Meaning                                      |
| ---------------------- | -------------------------------------------- |
| VAR                    | Static variables (not accessible from external) |
| VAR_INPUT              | Input variables                              |
| VAR_OUTPUT             | Output variables                             |
| VAR_IN_OUT             | Reference to any other variable              |
| VAR_TEMP               | Temporary variables                          |
| VAR_EXTERNAL (CONSTANT)| Access to a global variable/constant declared in the configuration section |
| VAR CONSTANT           | Constants within the function block          |

---

## Example

```
FUNCTION_BLOCK Valve
    VAR_INPUT
        cmdOpen : BOOL;
    END_VAR
    VAR_OUTPUT
        ctrlOpen : BOOL;
        isOpen : BOOL;
        isClosed : BOOL;
    END_VAR
    // your code
    ;
END_FUNCTION_BLOCK
```

---

## Usage of Function Block

```
PROGRAM ExampleProgram
    VAR
        v2 : Valve; // program local instance
    END_VAR
    VAR_EXTERNAL  // import global variables/instances
        v1 : Valve;
        v1ctrlOpen : BOOL;
        v1isClosed : BOOL; 
    END_VAR
    v1(); // Call the global instance
    v2(); // call the program local instance
END_PROGRAM
```

---

## Namespaces

- Namespaces combine a number of language elements to a single entity.
- By using namespaces you may structure your code in separate scopes and isolate them from one another.
- Every language element is part of a namespace.
- Any element which does not have an enclosing namespace is implicitly part of the invisible global namespace.

Resources:
1. namespaces [https://console.simatic-ax.siemens.io/docs/st/language/program-structure/namespaces#declaring-a-namespace](https://console.simatic-ax.siemens.io/docs/st/language/program-structure/namespaces#declaring-a-namespace)

---

## Declaration of Namespaces

A namespace may contain the following language elements:

- Namespace (namespaces can be nested)
- Function
- Class
- Type

```
NAMESPACE Vehicle
END_NAMESPACE
```

---

## Example Namespaces

```
NAMESPACE Circle
    FUNCTION Area : LREAL
        VAR_INPUT
            diameter : LREAL;
        END_VAR
        VAR_EXTERNAL CONSTANT
            PI : REAL;
        END_VAR
        Area := diameter ** 2.0 * PI / 4.0; // (d^2*PI)/4;
    END_FUNCTION    
END_NAMESPACE
NAMESPACE Square
    FUNCTION Area : LREAL
        VAR_INPUT
            sideLength : LREAL;
        END_VAR
        VAR_EXTERNAL CONSTANT
            PI : REAL;
        END_VAR
        Area := sideLength ** 2.0;
    END_FUNCTION    
END_NAMESPACE
```

---

## Using Namespaces

There are two different ways to use namespaces:

```
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Circle.Area(diameter := 2.0);     // fully qualified call
    result := Square.Area(sideLength := 2.0);   // fully qualified call
    ;
END_PROGRAM
```

Here you can see how to use it with "USING" at the beginning of the code:

```
USING Circle;
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Area(diameter := 2.0);     // partly qualified call
    ;
END_PROGRAM
```

Question: What do I have to do, when I want to call the Square.Area() method?

Notes:
Call Square.Area() fully qualified
or use USING Square;

---

## Solution

There are two different ways to use namespaces:

```
USING Circle;
USING Square;
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Area(diameter := 2.0);     // partly qualified call
    result := Area(sideLength := 2.0);   // partly qualified call
END_PROGRAM
```

Question: Why does it work?

---

## Types

ST offers a huge variety of different data types. A data type specifies how a given address in memory (named with a variable name) is to be interpreted, i.e. how many bytes are covered by a variable and how it is interpreted.

Some of the data types are already predefined by the ST language, while others may be defined by the user on demand. The focus is now on the data types that can be defined by the user.

---

## Enumeration

An enumeration is a data type defined by a set of named, constant values.

```
NAMESPACE Siemens.Ax.Training
    TYPE
        ValveState : ( Open, Undefined, Closed, Error) := Undefined;
    END_TYPE
END_NAMESPACE
```

This will declare the type ValveState and the four constant values UNDEFINED, OPEN, CLOSED, and ERROR.

Because the type ValveState is closed after declaration, the compiler will ensure that there is no value of type ValveState whose runtime value is not one of the defined.

The default value of an enumeration can be specified during declaration. If no default value is specified, the first enumeration value is the default for the type. In our example, the default value is Undefined.

---

## Data type with named values

Similar to the enumeration data type is the data type with named values. The declaration specifies the data type and assigns the values of the named values.

It is defined by a set of named, constant values of a certain type with a dedicated value.

```
NAMESPACE Siemens.Ax.Training
    TYPE
        TankState : INT (Filling := 1, Emptying := 2, Stop := 3) := Empty;
    END_TYPE
END_NAMESPACE
```

This will declare the type TankState and the three constant values.

The default value of a data type with named values may be specified during the declaration. If no default value is specified, the first named value is the default for the type.

In this example, the default value is Empty.

---

## Enumerations vs Data type with named values

Data types with named values do not provide the same advantage over symbolic constants as enumerations.

Values of data types with named values can be used like constants of the type specified by the data type with named values.

---

## What did you learn?

- Configuration & Tasks
- Program organization units
- Namespaces
- Control structures, and function/block
