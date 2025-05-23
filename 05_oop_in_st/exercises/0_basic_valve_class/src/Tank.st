NAMESPACE FluidHandling
    FUNCTION_BLOCK Tank
        VAR_INPUT
            cmdFill: BOOL;
            cmdEmpty: BOOL;
        END_VAR
        VAR_OUTPUT
            inletOpen: BOOL;
            outletOpen: BOOL;
        END_VAR
        VAR
            inlet: Valve;
            outlet: Valve;
        END_VAR 
        
        inlet(cmdOpen := cmdFill, 
            ctrlOpen => inletOpen);
        outlet(cmdOpen := cmdEmpty,
                ctrlOpen => outletOpen);
    END_FUNCTION_BLOCK

END_NAMESPACE