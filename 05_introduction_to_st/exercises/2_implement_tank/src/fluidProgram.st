USING Siemens.AxTraining.ControlModules;

NAMESPACE Siemens.AxTraining
    PROGRAM FluidProgram

        VAR_EXTERNAL
            ctrlOpenInletValve : BOOL;  
            inletValve : Valve;
        END_VAR

        inletValve(ctrlOpen => ctrlOpenInletValve);
    END_PROGRAM
END_NAMESPACE