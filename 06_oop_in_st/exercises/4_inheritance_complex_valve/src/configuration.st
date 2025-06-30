USING FluidHandlingClass;
CONFIGURATION MyConfiguration
    TASK Main(Interval := T#1000ms, Priority := 1);
    PROGRAM P1 WITH Main: CalculatorCurrentVolume;
    VAR_GLOBAL

        //FIRST IMPLEMENTATION SIMPLE
        vIn : ValveBase;
        vOut: ValveBase;
        tank : TankWithVolume := (inletValve := vIn, outletValve := vOut, volume := 100);

       
        //SIMPLE VALVES
        vInCtrl AT %Q1.0 : BOOL;
        vOutCtrl AT %Q1.1 : BOOL;

        vInOpen : BOOL;
        vOutOpen : BOOL;
        vInClosed : BOOL;
        vOutClosed : BOOL;

        statusIn : ValveState;
        statusOut : ValveState;


        //CONTROL TANK
        Close AT %I0.0 : BOOL;
        Fill AT %I0.1  : BOOL;
        Empty AT %I0.2 : BOOL;
        Flush AT %I0.3  : BOOL;
        phase : TankState;
    END_VAR
END_CONFIGURATION
