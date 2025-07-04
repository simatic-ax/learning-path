NAMESPACE Siemens.AxTraining.ControlModules

    FUNCTION_BLOCK Valve
        VAR_INPUT
            cmdOpen :BOOL;
            cmdClose: BOOL;
        END_VAR
        VAR_OUTPUT
            ctrlOpen :BOOL;
            ctrlClose : BOOL;
        END_VAR

        ctrlClose := FALSE;
        ctrlOpen := FALSE;
        IF cmdClose THEN
            ctrlClose := TRUE;
        ELSIF cmdOpen THEN
            ctrlOpen := TRUE;
        END_IF;
        
    END_FUNCTION_BLOCK

END_NAMESPACE