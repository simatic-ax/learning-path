    FUNCTION_BLOCK Tank
        VAR_INPUT
            cmdFill : BOOL; // Inlet valve is open
            cmdEmptying : BOOL; // Outlet valve is open
            cmdFlush : BOOL; // Inlet and outlet valve is open
            volume : LREAL;            
        END_VAR
        VAR_IN_OUT 
            inletValve : Valve; 
            outletValve : Valve;
        END_VAR
        ;
    END_FUNCTION_BLOCK
