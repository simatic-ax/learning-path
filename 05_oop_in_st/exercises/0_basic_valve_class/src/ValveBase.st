//Use the same namespace than the TYPE for the Valves state

NAMESPACE FluidHandlingClass   

    CLASS ValveBase
        VAR
            
        END_VAR
        
        METHOD PUBLIC Open 
            ;
        END_METHOD

        METHOD PUBLIC Close
            ;        
        END_METHOD

        METHOD PUBLIC GetState: FluidHandlingClass.ValveState
            ;
        END_METHOD

        METHOD PUBLIC WriteCyclic
            ;
        END_METHOD

    END_CLASS
    
END_NAMESPACE