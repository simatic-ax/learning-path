# Exercise 2: Testing classes

You will find the file "Counter.st" in the src folder. It contains a `CLASS` named "SimpleCounter". This class has the following methods:

| Name | Input | Output | Description|
|--|--|--|--|
| SetCurrentValue| newValue | - | Sets the counter value to `newValue`|
| GetCurrentValue | - | value | Returns the current counter value |
| CountUp | - | - | Increments the current counter value by 1 |

Write and execute a test for this class which verifies that the counter can count from a starting value of 2 to 4.

>Hint: You will have to use a test method inside a `TestFixture`. The syntax for a ``TestFixture`` looks like this:
```
{TestFixture}
CLASS MyTestFixture
   VAR
   END_VAR

   {Test}
   METHOD PUBLIC MyTestMethod
      // Put your test code here
   END_METHOD
END_CLASS
```