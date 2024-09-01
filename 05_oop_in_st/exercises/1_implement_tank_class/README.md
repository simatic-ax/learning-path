## Hands On (OOP02) 

----
<br>

### Goal

Using the solution for the HandsOn1 as the starting point: 


>* Create two interfaces, one for the tanks and the other for the valves. 
>* This interface will work as a "contract" that the classes must implement. 
>* In this case, we are going to include all the methods implemented in the HandsOn1 in the interface.



----
### Valve Interface

|Method|
   |-|
   |Open()|
   |Close()|
   |GetState : ValveState|
   |WriteCyclic(ctrlOpen : BOOL) |

**Advice:** remember that the interface does not include any implementation, only the definition.

----

### Tank Interface

----

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
   
**Advice:** remember that the interface does not include any implementation, only the definition.
