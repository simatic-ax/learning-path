//File to create the interface to implement the class valve
//File to create the interface to implement the class tank
NAMESPACE FluidHandlingClass   

    INTERFACE ItfValve
        METHOD Open 
        END_METHOD
        METHOD Close 
        END_METHOD
        METHOD GetState : ValveState 
        END_METHOD
    END_INTERFACE

END_NAMESPACE
