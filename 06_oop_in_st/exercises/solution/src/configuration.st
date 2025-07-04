USING FluidHandlingInterfaces;
USING FluidHandlingClass;
Using MATHS;
CONFIGURATION MyConfiguration
    TASK Main(Interval := T#1000ms, Priority := 1);
    PROGRAM P1 WITH Main: MyProgram;
    PROGRAM P2 WITH Main: CalculatorCurrentVolume;
    PROGRAM P3 WITH Main: CalculatorWithRegulation;
    VAR_GLOBAL

        //FIRST IMPLEMENTATION SIMPLE

        //SECOND AND COMPLEX
        vInEntry : ValveWithEntry;
        vOutEntry: ValveWithEntry;
        tankCube: CubicTank :=(inletValve:= vIn, outletValve:= vOut, side_length:= 20);
        tankCylinder : CylindricalTank :=(inletValve := vIn, outletValve:= vOut, height:= 20, radium := 10);

        //SIMPLE VALVES
        vInCtrl AT %Q1.0 : BOOL;
        vOutCtrl AT %Q1.1 : BOOL;

        vInOpen : BOOL;
        vOutOpen : BOOL;
        vInClosed : BOOL;
        vOutClosed : BOOL;

        statusIn : ValveState;
        statusOut : ValveState;


        //COMPLEX VALVES
        vInRegulator AT %IB2 : BYTE;
        vOutRegulator AT %IB3 : BYTE;
        vInCtrlEntry AT %QB2 : BYTE;
        vOutCtrlEntry AT %QB3 : BYTE;

        vInOpenR    : BOOL;
        vOutOpenR   : BOOL;
        vInClosedR  : BOOL;
        vOutClosedR : BOOL;

        statusInR : ValveState;
        statusOutR : ValveState;

        //CONTROL TANK
        Close AT %I0.0 : BOOL;
        Fill AT %I0.1  : BOOL;
        Empty AT %I0.2 : BOOL;
        Flush AT %I0.3  : BOOL;
        phase : TankState;
    END_VAR
END_CONFIGURATION
