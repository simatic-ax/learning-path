USING Siemens.AxTraining;

    CONFIGURATION PLC_1
        TASK Main(Interval := T#10ms, Priority := 1);
        PROGRAM P1 WITH Main: FluidProgram;

        VAR_GLOBAL
            cmdFillTank : BOOL;
            cmdEmptyTank : BOOL;
            inletOpenTank : BOOL;
            outletOpenTank : BOOL;  
        END_VAR
    END_CONFIGURATION