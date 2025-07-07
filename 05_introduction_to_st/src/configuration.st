CONFIGURATION PLC_1
    TASK Main (INTERVAL := T#10ms, PRIORITY := 1);
    PROGRAM P1 WITH Main : ExampleProgram;
    VAR_GLOBAL
        CycleCount : INT; // global variable of type integer
        Enable : BOOL := TRUE;
    END_VAR
    VAR_GLOBAL // Another VAR_GLOBAL section
        v1ctrlOpen AT %Q0.0 : BOOL; // digital  output
        v1isClosed AT %I0.0 : BOOL; // digital input
        v2ctrlOpen AT %Q0.1 : BOOL; // digital  output
        v2isClosed AT %I0.1 : BOOL; // digital input
        v1 : Valve; // instance of Valve (can be a function block or class)
        v2 : Valve;
        t1 : Tank := (volume := REAL#100.0); // with initialization
    END_VAR
    VAR_GLOBAL CONSTANT // Constants
        PI : REAL := REAL#3.141592;
    END_VAR
END_CONFIGURATION
