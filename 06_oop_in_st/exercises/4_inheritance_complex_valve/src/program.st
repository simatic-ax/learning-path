USING FluidHandlingClass;
USING System.Timer;

// Imagine that the filling rate is 5 L/s when the inlet valve is Open

PROGRAM CalculatorCurrentVolume
    VAR_EXTERNAL
        vIn  : ValveBase;
        vOut : ValveBase;
        tank : TankWithVolume;

        vInCtrl  : BOOL;
        vOutCtrl : BOOL;

        vInOpen : BOOL;
        vOutOpen : BOOL;
        vInClosed : BOOL;
        vOutClosed : BOOL;
        statusIn : ValveState;
        statusOut : ValveState;

        Close : BOOL;
        Fill  : BOOL;
        Empty : BOOL;
        Flush : BOOL;
        phase : TankState;
    END_VAR
    VAR
        _ton : OnDelay := (duration := T#1s);
        _duration_max  : LTIME;
        current_volume : REAL := 0;
        capacity_percentage : REAL;
        _filling_rate : REAL;
        _emptying_rate: REAL;

    END_VAR
    _ton();
    _duration_max :=  TO_LTIME(TO_LINT(tank.volume / 5));  //Conversion to Time values
    _filling_rate := 1;  //LATER EXPRESSION WITH THE OPENING/CLOSING RATES
    _emptying_rate := 1; //SAME AS FILLING RATE
    capacity_percentage := tank.Capacity(currentVolume := current_volume);
    statusIn := vIn.GetState();
    statusOut := vOut.GetState();
    tank.ReadCyclic(Fill := Fill, Empty := Empty, Flush := Flush,  Close := Close);

    CASE phase OF
        //-----------------------------------
        // here's the tank phase close
        //-----------------------------------

            TankState#Close:
            tank.Close();
            IF (Fill) THEN
                _ton.signal := TRUE;
                phase := TankState#Filling;
            END_IF;
            IF (Empty) THEN
                _ton.signal := TRUE;
                phase:= TankState#Emptying;
            END_IF;
            IF (Flush) THEN
                _ton.signal := TRUE;
                phase := TankState#Flushing;
            END_IF;
            // next phase after timeout

        //-----------------------------------
        // here's the tank phase Filling
        //-----------------------------------
        TankState#Filling:

            // next phase after timeout
            IF (Fill) THEN
                tank.Fill();
                IF (capacity_percentage > 100) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close;
                END_IF;
                IF _ton.output THEN
                    _ton.signal := FALSE;
                    current_volume := current_volume + 5 *_filling_rate; //Increment the volume in 5 Liters per second
                    IF current_volume > tank.volume THEN
                        current_volume := tank.volume; //Ensure volume does not exceed the maximum volume
                    END_IF;
                    capacity_percentage := tank.Capacity(currentVolume := current_volume);; // Actualize the capacity percentage
                    _ton.signal := TRUE; // Reinitialize the timer
                END_IF;

            ELSE
                _ton.signal := FALSE;
                phase := TankState#Close;
            END_IF;
        //-----------------------------------
        // here's the tank phase Emptying
        //-----------------------------------
        TankState#Emptying:
            IF (Empty) THEN
                tank.Emptying();
                IF (capacity_percentage <= 0) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close;
                END_IF;
                IF _ton.output THEN
                    _ton.signal := FALSE;
                    current_volume := current_volume - 5 *_emptying_rate; //Reduce the volume in 5 Liters per second
                    IF current_volume < 0 THEN
                        current_volume := 0; // //Ensure volume does not exceed the minimum volume
                    END_IF;
                    capacity_percentage := tank.Capacity(currentVolume := current_volume);; //Actualize the capacity percentage
                    _ton.signal := TRUE; // Reinitialize the timer
                END_IF;

            ELSE
                _ton.signal := FALSE;
                phase := TankState#Close;
            END_IF;
        //-----------------------------------
        // here's the tank phase Flushing (HERE THAT THE FILLING AND EMPTYING RATE IS THE SAME DOESN'T DO ANYTHING)
        //-----------------------------------
        TankState#Flushing:
            IF Flush THEN
                tank.Flush();
                _ton.signal := TRUE;

            ELSE
                _ton.signal := FALSE;
                phase := TankState#Close;
            END_IF;
    END_CASE;


    vIn.WriteCyclic(ctrlOpen => vInCtrl, isOpen => vInOpen, isClosed => vInClosed, state => statusIn);
    vOut.WriteCyclic(ctrlOpen => vOutCtrl, isOpen => vOutOpen, isClosed => vOutClosed, state => statusOut);
    tank.WriteCyclic(Capacity => capacity_percentage);
END_PROGRAM