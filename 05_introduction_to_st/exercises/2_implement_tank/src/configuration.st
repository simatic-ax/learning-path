USING Siemens.AxTraining.ControlModules;
USING Siemens.AxTraining;

CONFIGURATION PLC_1
    TASK Main(Interval := T#10ms, Priority := 1);
    PROGRAM P1 WITH Main: FluidProgram;

    VAR_GLOBAL
        ctrlOpenInletValve : BOOL;
        inletValve : Valve;
    END_VAR
END_CONFIGURATION