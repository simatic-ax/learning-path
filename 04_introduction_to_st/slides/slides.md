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
| 09 | Versioning and Continuous Integration |

---

<header class="slide_header">
  <h2>Prerequisites</h2>
</header>

<div class="flex-col justify-center">
    <p>
    Basic SCL programming knowledge
    <br>
    <br>
    The target audience for this training includes beginners and those transitioning from SCL who already have basic knowledge in SCL programming and wish to expand their skills in ST programming in SIMATIC AX.
</div>
---

<header class="slide_header">
  <h2>What will you learn in this chapter</h2>
</header>

<div class="flex-col justify-center">
<ul>
    <li>Understand the differences between SCL and ST: The training focuses on the key differences between the two languages, including syntax, data types, control structures, and function/block creation. This enables participants to leverage their existing knowledge in SCL and smoothly transition to ST programming in Siemens environments.</li>
    <li>Understand the configuration and structure of an ST program: The training explains the structure of an ST program, which consists of a configuration and one or more Program Organization Units (POUs). It also covers tasks, global variables, and their usage within a program.</li>
    <li>Understand Program Organization Units (POUs): The training explains the different types of POUs, such as programs, functions, and function blocks, and how they are used in an ST program to perform specific tasks.</li>
    <li>Understand the usage of namespaces and functions/function blocks: The training explains the use of namespaces to structure code into separate areas and improve reusability.</li>
</ul>
    <br><br>    
<p>
<b>Hint:</b> All topics will be covered in the exercises of this chapter.
</p>
</div>

---
<header class="slide_header">
  <h2>ST Program</h2>
</header>


<div class="flex-col justify-center">
    <p>
        A ST Program consists of:
    </p>
    <ul>
        <li>a Configuration</li>
        <li>Task(s)</li>
        <li>Program organization units</li>
    </ul>
    <br>
    <p>
        A minimal ST program consists of a  <b>CONFIGURATION</b> and a <b>PROGRAM</b> section.
    </p>
</div>

----

<header class="slide_header">
  <h2>Configuration & Tasks</h2>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
            A configuration is used to...
        </p>
    <ul>
            <li>abstract the hardware from the software part of the application</li>
            <li>define all resources of an application like:</li>
            <ul>
                <li>tasks</li>
                <li>programs and their order of execution</li>
                <li>declaration of global variables and instances</li>
                <li>declaration of I/O</li>
            </ul>
        </ul>
    </div>
</div>

----

<header class="slide_header">
  <h2>Task Configuration</h2>
</header>

<div class="flex-col justify-center">
    <pre>
    CONFIGURATION PLC_1
        TASK Main(Interval := T#10ms, Priority := 1);
        PROGRAM P1 WITH Main : ExampleProgram;
    END_CONFIGURATION
    </pre>
    <br>
    <p>
        In this example, the task 'Main' will be executed every 10ms.
    </p>
    <p>
        The Programm 'ExampleProgram' is assigned to this task.
    </p>
</div>

----

<header class="slide_header">
  <h2>Global Variables</h2>
</header>

<div class="flex-col justify-center">
    <p>
        Global variables are variables that are accessible and modifiable from any part of the program. 
        These variables are declared outside of any function or block and can be used throughout the entire program. 
        They can be useful for sharing data between different parts of the program.
    </p>
    <p>
        Declaration of global variables or global constants and instances:
    </p>
    <br>
    <pre>
    CONFIGURATION PLC_1
        VAR_GLOBAL
        </pre><pre>
        END_VAR
        </pre><pre>
        VAR_GLOBAL CONSTANT
        </pre><pre>
        END_VAR
    END_CONFIGURATION
    </pre>
</div>

----

<header class="slide_header">
  <h2>Example: Configuration & Global Variables</h2>
</header>

<div class="flex-col justify-center">
    <table>
        <tr><td>Variable</td><td>cycleCount : INT;</td></tr>
        <tr><td>Instances</td><td>v1 : Valve;</td></tr>
        <tr><td>Digital input</td><td>v1isClosed AT %I0.1 : BOOL;</td></tr>
        <tr><td>Digital output</td><td>v1ctrlOpen AT %Q0.0 : BOOL;</td></tr>
    </table>
    <br>
    <br>
    <pre>
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
    </pre>
</div>

---

<header class="slide_header">
  <h2>Program organization units (POU)</h2>
</header>

<div class="grid-two-col-eq">
    <div class="flex-col justify-center">
        <p>
            Following POUs exist in ST:
        </p>
        <ul>
            <li>Program</li>
            <li>Function</li>
            <li>Function Block</li>
            <li>Class & Methods (not in this session)</li>
        </ul>
    </div>
</div>

----
<header class="slide_header">
  <h2>Program</h2>
</header>


<div class="flex-col justify-center">
    <p>
        A program declaration defines a program, its used variables and the executed program (code).
    </p>
    <p>
        A program may declare the following sections:
    </p>
    <br>
    <br>
    <pre>
    PROGRAM ExampleProgram
        VAR_EXTERNAL    
            //global  variables / instances from the configuration
        END_VAR
    </pre><pre>
        VAR
            // program local variables / instances (static)
        END_VAR
    </pre><pre>
        VAR_TEMP
            // temporary local variables (will be reset in each cycle)
        END_VAR
    </pre><pre>
        ;   // program code
    END_PROGRAM
    </pre>    
    <ul>
        <li>Classes/Function blocks can not be instantiated in VAR_TEMP</li>
        <li>Benefit: you can modularize the program</li>
    </ul>
</div>

----

<header class="slide_header">
  <h2>Example: Program</h2>
</header>

<div class="flex-col justify-center">
    <pre>
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
    </pre>    
</div>

----

<header class="slide_header">
  <h2>Functions</h2>
</header>

<div class="flex-col justify-center">
    <p>
        A function is a POU which does not store its state. It may or may not additionally declare a return value.
    </p>
    <p>
        It can contain the following sections:
    </p>
    <br>
    <br>
    <table>
        <tr><th>Section</th><th>Meaning</th></tr>
        <tr><td>VAR_INPUT</td><td>Input variables</td></tr>
        <tr><td>VAR_OUTPUT</td><td>Output variables</td></tr>
        <tr><td>VAR_IN_OUT</td><td>Reference to any other variable</td></tr>
        <tr><td>VAR_TEMP</td><td>Temporary variables</td></tr>
        <tr><td>VAR_EXTERNAL (CONSTANT)</td><td>Access to a global variable/constant declared in the configuration section</td></tr>
        <tr><td>VAR CONSTANT</td><td>Constants within the function</td></tr>
    </table>
</div>

----
<header class="slide_header">
  <h2>Example: Function and Program</h2>
</header>

<div class="flex-col justify-center">
    <pre>
    FUNCTION Area : LREAL
        VAR_INPUT
            diameter : LREAL;
        END_VAR
        VAR_EXTERNAL CONSTANT
            PI : REAL;
        END_VAR
        Area := diameter ** 2.0 * PI / 4.0; // (d^2*PI)/4;
    END_FUNCTION
    </pre><pre>
    PROGRAM ExampleProgram
        VAR_TEMP
            result : LREAL;
        END_VAR
        result := Area(diameter := 2.0); 
        ;
    END_PROGRAM
    </pre>
    <p>
        Question: What is to do, when I want to calculate the area of a square?
    </p>
</div>

Notes: rename the function to CircleArea and SquareArea
OR --> Namespaces

----

<header class="slide_header">
  <h2>Function Block</h2>
</header>

<div class="flex-col justify-center">
    <p>
        A function block is a another program organization unit (POU) to modularize your program.
    </p>
    <p>
        The differences to functions are:
    </p>
    <ul>
        <li>A function block (FB) is able to persist its state over multiple cycles.</li>
        <li>Hence, all variables are remain valid outside its scope.</li>
    </ul>
</div>

----

<header class="slide_header">
  <h2>Structure of Function Block</h2>
</header>

<div class="flex-col justify-center">
    <p>
        It can contain the following sections:
    </p>
    <br>
    <br>
    <table>
        <tr><th>Section</th><th>Meaning</th></tr>
        <tr><td>VAR</td><td>Static variables (not accessible from external)</td></tr>
        <tr><td>VAR_INPUT</td><td>Input variables</td></tr>
        <tr><td>VAR_OUTPUT</td><td>Output variables</td></tr>
        <tr><td>VAR_IN_OUT</td><td>Reference to any other variable</td></tr>
        <tr><td>VAR_TEMP</td><td>Temporary variables</td></tr>
        <tr><td>VAR_EXTERNAL (CONSTANT)</td><td>Access to a global variable/constant declared in the configuration section</td></tr>
        <tr><td>VAR CONSTANT</td><td>Constants within the function</td></tr>
    </table>
</div>

----

<header class="slide_header">
  <h2>Example</h2>
</header>

<div class="flex-col justify-center">
    <pre>
FUNCTION_BLOCK Valve
    VAR_INPUT
        cmdOpen : BOOL;
    END_VAR
    </pre><pre>
    VAR_OUTPUT
        ctrlOpen : BOOL;
        isOpen : BOOL;
        isClosed : BOOL;
    END_VAR
    // your code
    ;
END_FUNCTION_BLOCK
    </pre>
</div>

----

<header class="slide_header">
  <h2>Usage of Function Block</h2>
</header>

<div class="flex-col justify-center">
    <pre>
PROGRAM ExampleProgram
    VAR
        v2 : Valve; // program local instance
    END_VAR
    </pre><pre>
    VAR_EXTERNAL  // import global variables/instances
        v1 : Valve;
        v1ctrlOpen : BOOL;
        v1isClosed : BOOL; 
    END_VAR
    </pre><pre>
    v1(); // Call the global instance
    v2(); // call the program local instance
END_PROGRAM
    </pre>
</div>

---

<header class="slide_header">
  <h2>Namespaces</h2>
</header>


<div class="flex-col justify-center">
    <ul>
        <li>Namespaces combine a number of language elements to a single entity.</li>
        <li>By using namespaces you may structure your code in separate scopes and isolate them from one another.</li>
        <li>Every language element is part of a namespace.</li>
        <li>Any element which does not have an enclosing namespace is implicitly part of the invisible global namespace.</li>
    </ul>
    <br>
    <br>
</div>


<div class="grid-slide-ressources">
  <ol>
    <li>namespaces<br><a href="https://console.simatic-ax.siemens.io/docs/st/language/program-structure/namespaces#declaring-a-namespace">"https://console.simatic-ax.siemens.io/docs/st/language/program-structure/namespaces#declaring-a-namespace"</a></li>
  </ol>
</div>

----

<header class="slide_header">
  <h2>Declaration of Namespaces</h2>
</header>

<div class="flex-col justify-center">
    <p>
        A namespace may contain the following language elements:
    </p>
    <ul>
        <li>Namespace (namespaces can be nested)</li>
        <li>Function</li>
        <li>Class</li>
        <li>Type</li>
    </ul>
    <br>
    <br>
    <pre>
    NAMESPACE Vehicle
    </pre><pre>
    END_NAMESPACE
    </pre>
</div>

----

<header class="slide_header">
  <h2>Example Namespaces</h2>
</header>

<div class="flex-col justify-center">
    <pre>
NAMESPACE Circle
    FUNCTION Area : LREAL
        VAR_INPUT
            diameter : LREAL;
        END_VAR
        </pre><pre>
        VAR_EXTERNAL CONSTANT
            PI : REAL;
        END_VAR
        </pre><pre>
        Area := diameter ** 2.0 * PI / 4.0; // (d^2*PI)/4;
        </pre><pre>
    END_FUNCTION    
END_NAMESPACE
    </pre><pre>
NAMESPACE Square
    FUNCTION Area : LREAL
        VAR_INPUT
            sideLength : LREAL;
        END_VAR
        </pre><pre>
        VAR_EXTERNAL CONSTANT
            PI : REAL;
        END_VAR
        </pre><pre>
        Area := sideLength ** 2.0;
        </pre><pre>
    END_FUNCTION    
END_NAMESPACE
    </pre>
</div>

----

<header class="slide_header">
  <h2>Using Namespaces</h2>
</header>

<div class="flex-col justify-center">
    <p>
    There are two different ways to use namespaces:
    </p>
    <pre>
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    </pre><pre>
    result := Circle.Area(diameter := 2.0);     // full qualified call
    result := Square.Area(sideLength := 2.0);   // full qualified call
    ;
END_PROGRAM
    <p>
Here you can see how to use it with "USING" at the beginning of the code:
    </p>
    <pre>
USING Circle;
    </pre><pre>
PROGRAM ExampleProgram
</pre><pre>
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Area(diameter := 2.0);     // partly qualified call
    ;
END_PROGRAM
    </pre>
    <p>
Question: What do I have to do, when I want to call the Square.Area() method?
    </p>
</div>

Notes:
Call Square.Area() fully qualified
or use USING Square;

----

<header class="slide_header">
  <h2>Solution</h2>
</header>

<div class="flex-col justify-center">
    <p>
    There are two different ways to use namespaces:
    </p>
    <pre>
USING Circle;
USING Square;
    </pre><pre>
PROGRAM ExampleProgram
    VAR_TEMP
        result : LREAL;
    END_VAR
    </pre><pre>
    result := Area(diameter := 2.0);     // partly qualified call
    result := Area(sideLength := 2.0);   // partly qualified call
END_PROGRAM
    </pre>
    <p>
Question: Why does it work?
    </p>
</div>

---

<header class="slide_header">
  <h2>Types</h2>
</header>

<div class="flex-col justify-center">
    <p>
    ST offers a huge a variety of different data types. A data type specifies how a given address in memory (named with a variable name) is to be interpreted, i.e. how many bytes are covered by a variable and how it is interpreted.
    </p>
    <p>
    Some of the data types are already predefined by the ST language, while others may be defined by the user on demand.
    The focus is now on the data types that can be defined by the user.
    </p>
</div>

----

<header class="slide_header">
  <h2>Enumeration</h2>
</header>

<div class="flex-col justify-center">
    <p>
    An enumeration is a data type defined by a set of named, constant values.
    </p>
    <br>
    <pre>
NAMESPACE Siemens.Ax.Training
    TYPE
        ValveState : ( Open, Undefined,Closed, Error) := Undefined;
    END_TYPE
END_NAMESPACE
    </pre>
    <p>
    This will declare the type ValveState and the four constant values UNDEFINED, OPEN, CLOSED and ERROR. 
    </p>
    <p>
    Because the type ValveState is closed after declaration, the compiler will ensure that there is no value of type ValveState whose runtime value is not one of the defined.
    </p>
    <p>
    The default value of an enumeration can be specified during declaration. If no default value is specified, the first enumeration value is the default for the type. In our example the default value is Undefined.
    </p>
</div>

----

<header class="slide_header">
  <h2>Data type with named values</h2>
</header>

<div class="flex-col justify-center">
    <p>
    Similar to the enumeration data type is the data type with named values. The declaration specifies the data type and assigns the values of the named values.
    </p>
    <p>
    It is defined by a set of named, constant values of a certain type with a dedicated value.
    </p>
    <br>
    <pre>
NAMESPACE Siemens.Ax.Training
    TYPE
        TankState : INT (Filling := 1, Emptying := 2, Stop := 3) := Empty;
    END_TYPE
END_NAMESPACE
    </pre>
    <p>
    This will declare the type TankState and the three constant values.
    </p>
    <p>
    The default value of a data type with named values may be specified during the declaration. If no default value is specified, the first named value is the default for the type.
    </p>
    <p>
    In this example the default value is Empty.
    </p>
</div>

----

<header class="slide_header">
  <h2>Enumerations vs Data type with named values</h2>
</header>

<div class="flex-col justify-center">
    <p>
    Data types with named values do not provide the same advantage over symbolic constants as enumerations.
    </p>
    <p>
    Values of data types with named values can be used like constants of the type specified by the data type with named values.
    </p>
</div>

---

<header class="slide_header">
  <h2>What did you learn?</h2>
</header>

<div class="flex-col justify-center">
    <ul>
        <li>Configuration & Tasks</li>
        <li>Program organization units</li>
        <li>Namespaces</li>
        <li>Control structures, and function/block</li>
    </ul>
</div>
