---
title: Unit testing in AX
progress: true
revealOptions:
  transition: 'fade'
mouseWheel: true,

---


## Agenda

| ID | Topic |
| -- | ----- |
| 00 | Introduction to the workshop |
| 01 | Introduction to AX Code IDE |
| 02 | Get started with your first AX Project |
| 03 | Introduction to ST Programming |
| 04 | Loading and Debugging |
| 05 | OOP Elements of ST |
| **06** | **Unit Testing** |
| 07 | Tools for commissioning |
| 08 | Package management |

---

## Prerequisites

Basic understanding of SIMATIC AX Code and ST programming

---

## What will you learn in this chapter?

* Writing and running unit tests in AxUnit

* Utilizing test functions and test classes

* Implementing parameterized tests and mocking techniques

* Following best practices for reliable and maintainable tests
---

## AX Unit Testing Framework
### Introduction


Software quality or code quality is something that the market has been demanding in recent times and it is gaining importance every year.

The **AX Unit Testing Framework** supports automation engineers in developing unit tests.

The main objective is to ensure the reliability and quality by facilitating the development, execution and management of unit tests.

----

## Main Benefits

* **Automated Testing.** Verify automatically the functionality of individual units of code, ensuring the behavior as expected.

* **Early Bug Detection.** Identify and fix bugs early in the development process, reducing cost and efforts.

* **Regression Prevention.** Ensure that new changes do not break existing functionality.

* **Code Quality Improvement.** Encourage better design and modularity of code, as unit test typically require code to be split into smaller testable units.

* **Documentation.** Serve as documentation for expected behavior of code, making it easier for developers to understand the purpose.

* **Continuous Integration.** Support continuous integration practices by providing a framework for automated testing as part of the build process.

* **Confidence in Refactoring.** Allow developers to refactor code with confidence, ensuring that the existing test will catch any unintented changes in the behavior.

* **Efficiency.** Reduce the need for extensive manual testing, speeding up the development cycle.

----

## Possibilities

SIMATIC AX provides different possibilities to execute the tests. The big advantage of both is that a runtime like PLCSIM Advanced or a real PLC is __NOT NEEDED__:

* via APAX (locally or in the pipeline)
* via the IDE

This learning session is focused on <ins>**testing with the IDE**</ins>

---
<header class="slide_header">
<h2>Testing in the IDE</h2>
<h3>Prerequisites</h3>
</header>

* An AX Project (lib or app) is created
* SDK is installed ('apax add @ax/sdk' or 'apax install')
* A folder "test" where your tests are located is existing
* llvm target is enabled in the apax.yml (next page)

A typical project structure looks like that:
```text
my-project/
├── apax.yml
├── src/
│   └── (source files)
└── test/
    └── (test files)
```

----

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Axunit Target</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>The correct target has to be selected, depending on where you want to test.</p>
    <br>
    <p>
    When testing without a PLC or PLCSim instance, check that <code>llvm</code> is set as a target in the <code>apax.yml</code>.
    </p>
    <br>
    <br>
  </div>
  <div class="grid-slide-image" style="background-image: url(../img/Target.png); background-repeat: no-repeat; background-size: contain">
  </div>
  <div class="grid-slide-ressources">
    <ol>
      <li>axunit targets: <br><a href="https://console.simatic-ax.siemens.io/docs/axunitst/targets">https://console.simatic-ax.siemens.io/docs/axunitst/targets</a></li>
    </ol>
  </div>

----


<header class="slide_header">
  <h2>Testing with the IDE</h2>
</header>

<div>
    <img src="./img/TestExplorer.png"/>
</div>

---

## Writing Tests
### Test function

The easiest way to write tests in SIMATIC AX is using a function. This function is characterized by:

* The pragma {Test} above FUNCTION
* Minimum one Assertion (given by assert functions)

<span style="font-size: 36px;">**&darr;**</span> Go down to understand the previous points <span style="font-size: 36px;">**&darr;**</span>
----

## What is a pragma?

A pragma is a special instruction or directive in programming languages that provides additional information to the compiler or interpreter. Pragmas are typically used to enable or disable certain features, optimize code, or provide metadata.

In the context of the AX Unit Testing Framework, a pragma is used to mark a function as a test function.

----

<header class="slide_header">
<h2>What is an assertion?</h2>
</header>

<div style="padding-right:10px">
  <p>
    An assertion is a statement in code that checks if a specified condition is true. Assertions are used in unit tests to verify that the output of a piece of code matches the expected result.
    If the assertion fails (i.e., the condition is not true), it indicates that there is a bug or error in the code being tested.
  </p>
</div>



----

<header class="slide_header">
<h2>Example function</h2>
</header>

<div>
  <pre>
FUNCTION  ADD : INT
    VAR_INPUT
        a : INT;
        b : INT;
    END_VAR
    ADD := a + b;
END_FUNCTION
</pre><br><pre>
NAMESPACE Tests
    {Test}
    FUNCTION TestSomething
        // write your test code here
        Assert.Equal(actual := ADD(a := 4, b := 4), expected := 8);
    END_FUNCTION
END_NAMESPACE
  </pre>
</div>

----

## Assert functions

|Assertion  |Example|
|-          |-|
|Equal      | AxUnit.Assert.Equal(expected := x, actual := y)|
|NotEqual   | AxUnit.Assert.NotEqual(expected := x, actual := y)|
|LessThan   | AxUnit.Assert.LessThan(left := x, right := y)|
|GreaterThan| AxUnit.Assert.GreaterThan(left := x, right := y)|

<br>
<br>

**HINT**: You can create your own assert functions, specific to your requirements.

<br>
<br>
<div class="grid-slide-ressources">
    <ol>
      <li>Supported data types: <br><a href="https://console.simatic-ax.siemens.io/docs/axunitst/includeddatatypes">https://console.simatic-ax.siemens.io/docs/axunitst/includeddatatypes</a></li>
    </ol>
</div>
----
<header class="slide_header">
<h2>Custom asserts</h2>
</header>

<div class="flex-col justify-center">
    <p>
    Since not all data types, especially user defined data types, are supported by the assertions, you can define `custom asserts`.
    </p>

<br>
<p>Here's an example for a string assertion:</p>
</div>

```text
USING AxUnit.ResultFunctions;
USING System.Strings;

NAMESPACE AxUnit.Assert
    FUNCTION PUBLIC Equal
        VAR_INPUT
            actual : String;
            expected: String;
            {CallerFilePath}
            file : WSTRING[1024];
            {CallerLineNumber}
            line : INT;
        END_VAR

        IF actual = expected THEN
            axunit_Succeed();
        ELSE
            axunit_Fail(Concat('Expected ', expected, ', but found ', actual), file, line);
        END_IF;

    END_FUNCTION
END_NAMESPACE
```

Further example on: https://console.simatic-ax.siemens.io/docs/axunitst/customasserts
----

## Limitations

With test functions you can't test function blocks or classes in a proper way. Because it is not allowed to instantiate FBs or classes in VAR_TEMP and you need to instantiate it in VAR_GLOBAL.

> * If you execute multiple tests at global  instances, the instances are not stateless. This can lead to unexpected test results!
> * VAR_GLOBAL is not available in library projects (type: lib)

Notes:
To test fb/classes with test functions you need global instances
Global instances are not stateless when you execute tests on the same instance

---

## Writing Tests
### With <ins>Test Classes</ins>

* A test class is a specialized class designed for testing function blocks or other classes.
* These classes contain test methods that validate the functionality of the code under test.
* The pragma **{TestFixture}** is used to mark a class as a test class.

----

## Test Class - Instantiation

* Within test classes, you can **instantiate the function blocks or classes** that you need to test.
* This allows for comprehensive testing of class behaviors and interactions.

----

## Test Class - Statelessness

* Before each test, the TestFixture is reinitialized, ensuring that tests are stateless
* This means that each test runs in isolation, without any effect in other tests.

----

## Main Benefits of Test Classes

* **Isolation and Independence.** Since the TestFixture is reinitialized before each test, the tests do not interfere with each other.

* **Reusability and Organization.** Grouping related tests together within a class makes the test suite more manageable and easier to understand.

* **Encapsulation.** Allows the user to define setup and teardown methods. These methods can initialize common test data and clean up after tests, reducing redundancy and potential errors.

* **Scalability.** Test classes can be easily scaled with additional test methods as the functionality of the code under test expands. This scalability makes it easier to maintain a comprehensive test suite.

* **Clarity and Readability.** Each class represents a specific area of functionality, improving the readability and maintainability of the test code.

* **Integration with Testing Frameworks.** Most modern testing frameworks support the use of test classes, providing additional tools and features such as test discovery, advanced assertions, and reporting.

* **Automated Test Management.** Test frameworks can automatically discover and run test classes, simplifying the process of running and managing tests

----

<header class="slide_header">
<h2>Example for test class</h2>
</header>

<div>
  <pre>
NAMESPACE Examples.Test
  CLASS CumSimInt
      VAR
          _sum : INT;
      END_VAR
</pre><br><pre>
      METHOD PUBLIC Add : INT
          VAR_INPUT
              v : INT;
          END_VAR
          </pre><br><pre>
          _sum := _sum + v;
          Add := _sum;
      END_METHOD
</pre><br><pre>
  END_CLASS
  {TestFixture}
  CLASS MyTestFixture
      VAR
          o : CumSimInt;
      END_VAR
</pre><br><pre>
      {Test}
      METHOD PUBLIC ADD_4_Twice_returns_8
          VAR
              result : INT;
          END_VAR
          result := o.Add(v := 4);
          result := o.Add(v := 4);
          AxUnit.Assert.Equal(expected := 8, actual := result);
      END_METHOD
  END_CLASS
END_NAMESPACE
</pre>
</div>

---

## Parametrized tests

Parametrized tests allow the user to run the same test logic with different sets of input data.

----

## When to use Parametrized Tests?

* **Testing Multiple Scenarios.** When a function/method needs to be tested with many inputs to ensure it behaves correctly in all scenarios.

* **Edge Cases and Boundary Conditions.** You can obtain the range of parameters that your function works fine.

* **Avoid Code Duplication.** When you have similar test cases with different inputs, parametrized tests help avoid redundancy.

----

## Example of a Parametrized Test

We will test the add function previously defined for different situations with different input parameters.
<br>
<br>
<br>
<div class="grid-two-col-eq">
<div>
<p>Example:</p>
<p>ADD(a := 3, b := 2) = 5</p>
<p>ADD(a := -4, b := -2) = -6</p>
<p>ADD(a := 4, b := -2) = 2</p>
</div>
<pre>
NAMESPACE Test
    {Test( A := 3, B := 2, X := 5)}
    {Test( A := -4, B := -2, X := -6)}
    {Test( A := 4, B := -2, X := 2)}
    FUNCTION ADD_of_A_plus_B_returns_X
        VAR_INPUT
            A : INT;
            B : INT;
            X : INT;
        END_VAR
        VAR_TEMP
            res: INT;
        END_VAR
        res := ADD(a := A, b := B);
        AxUnit.Assert.Equal(expected := X, actual := res);
    END_FUNCTION
END_NAMESPACE
</pre>
</div>

---

<div class="grid-slide-container">
    <div class="grid-slide-header">
    <header class="slide_header">
        <h2>Debugging of tests</h2>
    </header>
  </div>
  <div class="grid-slide-text">
    <p>With AX Unit you can use breakpoints to debug your code step by step.</p>
    <br>
    <p>For this you have to start the debugging session via the testing extension.</p>

  </div>
  <div class="grid-slide-image" style="background-image: url(../img/debugging.png); background-repeat: no-repeat; background-size: contain" >
  </div>
</div>


----
## Breakpoints

1. Standard: Halt execution when hit
2. Expression: Halt execution if a certain expression evaluates to true.
3. Hitcount: Halt execution after certain amount of hits
4. Logging: Emit a message when hit

----
## User Interface

<br>

![UI butttons](./img/ui_buttons.png)

- **Continue execution.** Stop on the next breakpoint or when the program terminates.

- **Step Over.** When pressing step over the whole function will be executed. The execution will stop at the next instruction after the function.

- **Step into.** Debug every single instruction, step by step.

- **Step out.** Execute the current function and stop when it returns.

- **Restart debugging.**

- **Stop the test** execution and terminates the debug mode.

---

<header class="slide_header">
  <h2>Mocking</h2>
  <h3>What is a mock and why should I use it?</h3>
</header>

<div class="flex-col justify-center" style="padding:20px;">
<p><b>NOTE:</b> This is an advanced topic, that can be skipped for users who want to get started quickly. You can come back to this section later.</p>
<br>
    <p>
        Mocking is a technique used in unit testing where certain objects or behaviors are simulated or "mocked" to test specific components of a codebase in isolation. Mock objects mimic the behavior of real objects in a controlled way.
    </p>
    <br>
    <p>
    Advantages:
    </p>
    <ul>
        <li><b>Isolation:</b> Allows testing of a specific unit of code independently from its dependencies, ensuring that the test is focused and accurate.</li>
        <li><b>Control:</b> Provides control over the behavior of dependencies, enabling tests to simulate various scenarios, including edge cases and error conditions.</li>
        <li><b>Reliability:</b> Ensures that tests are reliable and consistent, as mocks eliminate the variability and unpredictability of external dependencies.</li>
    </ul>
</div>

----

<header class="slide_header">
  <h2>When is mocking necessary?</h2>
</header>

<div class="flex-col justify-center">
<ul>
        <li><b>Complex Dependencies:</b> When the code under test interacts with complex or difficult-to-control dependencies.</li>
        <li><b>External Services:</b> When the code relies on external services or APIs that might be unavailable, unstable, or have usage limitations during testing (e. g. system functions).</li>
        <li><b>State Management:</b> When dependencies maintain complex state that is hard to replicate and reset for each test run.</li>
    </ul>
</div>

----

<header class="slide_header">
  <h2>How to create mocks?</h2>
</header>

<div class="flex-col justify-center" style="padding-right:10px">
  <p>
    There are two options for creating mocks: via dependency injection and with the help of the mocking framework, which will be explained in this chapter.
  </p>
  <br>
  <p>
    Dependency injection is a technique which moves the responsibility for the creation of an object to the caller. So the caller is in control of the used implementation. This enables you to exchange the concrete implementation of an object with a stub. A stub acts as a small piece of code that replaces another component during testing. This is an advanced technique and won´t be explained in this chapter. You can find more information on that topic in the documentation.
  </p>
  <br><br><br>
</div>

<div class="grid-slide-ressources">
    <ol>
      <li>Mocking with dependency injection: <br><a href="https://console.simatic-ax.siemens.io/docs/axunitst/mocking">https://console.simatic-ax.siemens.io/docs/axunitst/mocking</a></li>
    </ol>
</div>

----

<header class="slide_header">
  <h2>Mocking framework</h2>
  <h3>Prerequisites</h3>
</header>

<div class="flex-col justify-center" style="padding-right:10px">
  <ul>
        <li>Check that your apax-build version is 1.1 or higher</li>
        <li>Add axunit-mocking with <code>apax add @ax/axunit-mocking -D</code> to the dev-dependecies</li>
        <li>Add <code>USING AxUnit.Mocking;</code> to the namespace you want to use the mocks in</li>
    </ul>
</div>

----

<header class="slide_header">
  <h2>How does the mocking framework work?</h2>
</header>

<div class="flex-col justify-center" style="padding-right:10px">
  <p>
    The Mock function takes the name of a METHOD/ FUNCTION or FUNCTION_BLOCK and exchanges the implementation during runtime with the functionality provided by the user.
  </p>
<br>
  <table>
        <tr><th><b>Name</b></th><th><b>Type</b></th><th style="padding-right:20px"><b>Section</b></th><th><b>Description</b></th></tr>
        <tr><td style="padding-right:20px">mockeeFn</td><td><code>STRING</code></td><td>Input</td><td>The fully qualified name, including namespace, of the METHOD/ FUNCTION/ FUNCTION_BLOCK which is to be mocked</td></tr>
        <tr><td>mockFn</td><td><code>STRING</code></td><td>Input</td><td style="padding-top:15px">The fully qualified name, including namespace, of the METHOD/ FUNCTION/ FUNCTION_BLOCK which is to be used as a mock implementation.</td></tr>
        <tr><td>payload</td><td style="padding-right:20px"><code>IPayload</code></td><td>Input</td><td style="padding-top:15px">	Additional payload to store states during tests.</td></tr>
    </table>
</div>

----

<header class="slide_header">
  <h2>How does the mocking framework work?</h2>
</header>

<div class="flex-col justify-center" style="padding-right:10px">
    <p>
    You can use multiple mocks inside a single test. This includes multiple different mocks and changing the mockFn of an already existing Mock.The mocking functionality only works while executing tests.</p>
    <br>
    <p>We do suggest to make use of the NAME_OF functionality, e.g. NAME_OF(SomeFunction). This makes adaptions to the test code easier, in case the name of a dependency changes.</p>
</div>


----

<header class="slide_header">
  <h2>Example usage of mocking framework</h2>
</header>

<div class="grid-two-col-eq">
<div>
<pre>
NAMESPACE UserLibrary
</pre><br><pre>
    FUNCTION GetANumber : Int
        GetANumber := GetNumber1();
    END_FUNCTION
</pre><br><pre>
    FUNCTION GetNumber1 : int
        GetNumber1 := 1;
    END_FUNCTION
</pre><br><pre>
END_NAMESPACE
</pre>
</div>
<div>
<pre>
USING AxUnit;
USING UserLibrary;
</pre><br><pre>
NAMESPACE MyTest
</pre><br><pre>
  {TestFixture}
  CLASS MyTestFixture
      {Test}
      METHOD PUBLIC MyTestMethod_1
          VAR_TEMP
              result : INT;
          END_VAR
          </pre><br><pre>
          Mocking.Mock(NAME_OF(GetANumber), NAME_OF(GetNumber2_Mock));
          result := GetANumber();
          Assert.Equal(result, 2);
</pre><br><pre>
          Mocking.Mock(NAME_OF(GetANumber), NAME_OF(GetNumber3_Mock));
          result := GetANumber();
          Assert.Equal(result, 3);
      END_METHOD
  END_CLASS
</pre><br><pre>
  FUNCTION GetNumber2_Mock : INT
      GetNumber2_Mock := 2;
  END_FUNCTION
</pre><br><pre>
  FUNCTION GetNumber3_Mock : INT
      GetNumber3_Mock := 3;
  END_FUNCTION
  </pre><br><pre>
END_NAMESPACE
</pre>
</div>
</div>
----

<header class="slide_header">
  <h2>Mocking framework: Payloads</h2>
</header>

<div>
  <p>With payloads you can parameterize your mocks and control what happens inside the mock function dynamically. In the example above we have declared 2 similar mock functions. With the payload mechanism its possible to control the behavior of your mock functions.</p>
  <br>
  <p>
  The following example is also using the functions of the previous example with the namespace "UserLibrary".
  </p>
</div>

----

<header class="slide_header">
  <h2>Example usage of payloads</h2>
</header>

<div class="grid-two-col-eq">
<div>
<pre>
USING AxUnit;
USING UserLibrary;
</pre><br><pre>
NAMESPACE MockingPayloadTest
</pre><br><pre>
FUNCTION funcMock: INT
    VAR_TEMP
        p : ref_to mypayload;
    END_VAR
    </pre><br><pre>
    p ?= AxUnit.Mocking.GetPayload();
    IF (p <> null) THEN
        funcMock:=p^.value;
    END_IF;
END_FUNCTION
</pre><br><pre>
// The IPayload interface must be implemented
// in order for the payload to work
CLASS mypayload implements AxUnit.Mocking.IPayload
    VAR PUBLIC
        value: int;
    END_VAR
END_CLASS
</pre>
<h2>...</h2>
</div>
<div>
<h2>...</h2>
<pre>
{TestFixture}
CLASS MyTest
    VAR
        payloadInstance: mypayload;
    END_VAR
</pre><br><pre>
    {Test}
    METHOD PUBLIC Returns123
        payloadInstance.value := 123;
        AxUnit.Mocking.Mock(NAME_OF(GetNumber1), NAME_OF(funcMock), payloadInstance);
        AxUnit.Assert.Equal(123, GetANumber());
</pre><br><pre>
        payloadInstance.value := 456;
        AxUnit.Mocking.Mock(NAME_OF(GetNumber1), NAME_OF(funcMock), payloadInstance);
        AxUnit.Assert.Equal(456, GetANumber());
    END_METHOD
END_CLASS
</pre><br><pre>
END_NAMESPACE
</pre>
</div>
</div>

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
      <li>what Unit Testing is</li>
      <li>how the debugger works</li>
      <li>how you can use AXUnit to assert the correctness of your code</li>
      <li>you know what parametrized tests are</li>
      <li>how to simulate target specific functionality with mocking</li>
    </ul>
    <br>
  </div>
</div>


