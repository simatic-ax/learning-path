Selbstverständlich! Hier ist ein detaillierter Trainingsplan für Modul 4: Advanced OOP Concepts, mit Beispielen und Übungen.  
   
### Module 4: Advanced OOP Concepts  
**Objectives:** Deepen the understanding of OOP concepts and their application in Structured Text (ST).  
   
#### 1. Inheritance  
**Goal:** Understand and implement inheritance to create base and derived classes.  
   
1.1. **Introduction to Inheritance**  
   - Definition and purpose of inheritance.  
   - How inheritance promotes code reusability.  
   
1.2. **Creating Base and Derived Classes**  
   - **Example:**  
     ```st  
     // Base class definition  
     CLASS Vehicle  
       VAR  
         speed: INT;  
         capacity: INT;  
       END_VAR  
       METHOD SetSpeed  
         VAR_INPUT  
           newSpeed: INT;  
         END_VAR  
         speed := newSpeed;  
       END_METHOD  
     END_CLASS  
       
     // Derived class definition  
     CLASS Car EXTENDS Vehicle  
       VAR  
         fuelType: STRING;  
       END_VAR  
       METHOD SetFuelType  
         VAR_INPUT  
           newFuelType: STRING;  
         END_VAR  
         fuelType := newFuelType;  
       END_METHOD  
     END_CLASS  
     ```  
   
1.3. **Overriding Methods**  
   - **Example:**  
     ```st  
     // Overriding method in derived class  
     CLASS ElectricCar EXTENDS Car  
       METHOD SetFuelType  
         VAR_INPUT  
           newFuelType: STRING;  
         END_VAR  
         IF newFuelType = 'Electric' THEN  
           fuelType := newFuelType;  
         ELSE  
           // Handle invalid fuel type  
         END_IF  
       END_METHOD  
     END_CLASS  
     ```  
   
1.4. **Practical Exercise:**  
   - Create a base class `Appliance` with properties like `power` and methods like `TurnOn` and `TurnOff`.  
   - Create derived classes `WashingMachine` and `Refrigerator` that extend `Appliance` and add specific properties and methods.  
   - Override the `TurnOn` method in the `WashingMachine` class to include a specific start-up sequence.  
   
#### 2. Polymorphism  
**Goal:** Understand and implement polymorphism to allow objects to be treated as instances of their base class.  
   
2.1. **Introduction to Polymorphism**  
   - Definition and purpose of polymorphism.  
   - How polymorphism enhances flexibility and maintainability.  
   
2.2. **Using Interfaces and Abstract Classes**  
   - **Example:**  
     ```st  
     // Abstract class definition  
     ABSTRACT CLASS Shape  
       METHOD Area: REAL;  
     END_CLASS  
       
     // Derived class Circle  
     CLASS Circle EXTENDS Shape  
       VAR  
         radius: REAL;  
       END_VAR  
       METHOD Area: REAL  
         Area := 3.14 * radius * radius;  
       END_METHOD  
     END_CLASS  
       
     // Derived class Rectangle  
     CLASS Rectangle EXTENDS Shape  
       VAR  
         length: REAL;  
         width: REAL;  
       END_VAR  
       METHOD Area: REAL  
         Area := length * width;  
       END_METHOD  
     END_CLASS  
     ```  
   
2.3. **Polymorphic Behavior**  
   - **Example:**  
     ```st  
     // Polymorphic method calling  
     PROGRAM Main  
       VAR  
         shape: Shape;  
         circle: Circle;  
         rectangle: Rectangle;  
       END_VAR  
       
       // Creating instances  
       circle := Circle();  
       circle.radius := 5.0;  
       
       rectangle := Rectangle();  
       rectangle.length := 10.0;  
       rectangle.width := 4.0;  
       
       // Assigning to base class reference  
       shape := circle;  
       // Calling polymorphic method  
       WriteReal('Circle Area: ', shape.Area());  
       
       shape := rectangle;  
       // Calling polymorphic