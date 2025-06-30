//Use the same namespace than the TYPE for the Valves state

NAMESPACE FluidHandlingClass   

    CLASS ValveBase
        VAR
            _ctrlOpen : BOOL;
            _state : ValveState;
            _isClosed : BOOL;
            _isOpen : BOOL;
        END_VAR

        METHOD PUBLIC Open 
            _ctrlOpen := TRUE;
            _isOpen := TRUE;
            _isClosed := FALSE;
        END_METHOD

        METHOD PUBLIC Close
            _ctrlOpen := FALSE;
            _isOpen := FALSE;
            _isClosed := TRUE;
        END_METHOD

        METHOD PUBLIC GetState: FluidHandlingClass.ValveState
            IF (_ctrlOpen) THEN
                GetState := ValveState#Open;
            ELSE
                GetState := ValveState#Closed;
            END_IF;
            _state := GetState;
        END_METHOD

        METHOD PUBLIC WriteCyclic
            VAR_OUTPUT
                ctrlOpen : BOOL;
                isOpen : BOOL;
                isClosed : BOOL;
                state : ValveState;
            END_VAR
            ctrlOpen := _ctrlOpen;
            isOpen := _isOpen;
            isClosed := _isClosed;
            state := _state;
        END_METHOD
    END_CLASS
    
END_NAMESPACE