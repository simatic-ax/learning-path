
NAMESPACE FluidHandling
    FUNCTION_BLOCK Valve
        VAR_INPUT
            cmdOpen: BOOL;
        END_VAR
        VAR_OUTPUT
            ctrlOpen : BOOL;
            isOpen : BOOL;
            isClosed : BOOL;
        END_VAR
        
        IF (cmdOpen) THEN
            isOpen := TRUE;
            isClosed := FALSE;
            ctrlOpen := TRUE;
        ELSE
            isOpen := FALSE;
            isClosed := TRUE;
            ctrlOpen := FALSE;
        END_IF;

    END_FUNCTION_BLOCK

END_NAMESPACE