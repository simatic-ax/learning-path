USING FluidHandlingInterfaces;
USING FluidHandlingClass;
USING System.Timer;

// Imagine that the filling rate is 5 L/s when the inlet valve is Open, so to calculate the maximum filling time: VOLUME TANK/ 5 L/s = TIME FOR TIMER



//CAHNGE EVERYTHING FOR REGULATION
PROGRAM CalculatorWithRegulation
    VAR_EXTERNAL
        vInEntry  : ValveWithEntry;
        vOutEntry : ValveWithEntry;
        tankCube : FluidHandlingInterfaces.CubicTank;
        tankCilinder : FluidHandlingInterfaces.CilindricTank;


        vInCtrlEntry  : BYTE;
        vOutCtrlEntry : BYTE;
        vInRegulator  : BYTE;
        vOutRegulator : BYTE;

        statusInR : ValveState;
        statusOutR : ValveState;

        Close : BOOL;
        Fill  : BOOL;
        Empty : BOOL;
        Flush : BOOL;
        phase : TankState;
    END_VAR
    VAR
        _ton : OnDelay := (duration := T#1s);
        _duration_max : LTIME;
        current_volume : REAL := 0;
        capacity_percentage : REAL;
        _filling_rate : REAL;
        _emptying_rate: REAL;
    END_VAR
    _ton();
    
    tankCube.VolumeCalculator();

    vInEntry.ReadCyclic(Regulator := TO_REAL(TO_INT(vInRegulator))); 
    vOutEntry.ReadCyclic(Regulator := TO_REAL(TO_INT(vOutRegulator))); 
    //_duration_max :=  TO_LTIME(TO_LINT(tank.volume / 5));  //Conversion to Time values
    _filling_rate := TO_INT(vInRegulator)/100;  
    _emptying_rate := TO_INT(vOutRegulator)/100;
    statusInR := vInEntry.GetState();
    statusOutR := vOutEntry.GetState(); 
    

    tankCube.ReadCyclic(Fill := Fill, Empty := Empty, Flush := Flush,  Close := Close);
 
    CASE phase OF
        //-----------------------------------
        // here's the tank phase close
        //-----------------------------------


            TankState#Close: 
            tankCube.Close();
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
                tankCube.Fill();
                IF (capacity_percentage > 100) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close; 
                END_IF;
                IF _ton.output THEN
                    _ton.signal := FALSE;
                    current_volume := current_volume + 5 *_filling_rate; // Incrementar el volumen en 5 litros por segundo
                    IF current_volume > tankCube.volume THEN
                        current_volume := tankCube.volume; // Asegurar que el volumen no exceda el máximo
                    END_IF;
                    capacity_percentage := (current_volume / tankCube.volume) * 100; // Actualizar el porcentaje de capacidad
                    _ton.signal := TRUE; // Reiniciar el temporizador
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
                tankCube.Emptying();
                IF (capacity_percentage <= 0) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close; 
                END_IF;
                IF _ton.output THEN
                    _ton.signal := FALSE;
                    current_volume := current_volume - 5 *_emptying_rate; // Incrementar el volumen en 5 litros por segundo
                    IF current_volume < 0 THEN
                        current_volume := 0; // Asegurar que el volumen no exceda el mínimo
                    END_IF;
                    capacity_percentage := (current_volume / tankCube.volume) * 100; // Actualizar el porcentaje de capacidad
                    _ton.signal := TRUE; // Reiniciar el temporizador
                END_IF;

            ELSE
                _ton.signal := FALSE;
                phase := TankState#Close;         
            END_IF;
        //-----------------------------------
        // here's the tank phase Flushing 
        //-----------------------------------
        TankState#Flushing:
            IF Flush THEN
                tankCube.Flush();                                       
                _ton.signal := TRUE;
                IF (capacity_percentage <= 0) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close; 
                END_IF;
                IF (capacity_percentage >= 100) THEN
                    _ton.signal := FALSE;
                    phase := TankState#Close; 
                END_IF;
                IF _ton.output THEN
                    _ton.signal := FALSE;
                    current_volume := current_volume + 5 * _filling_rate - 5 *_emptying_rate;
                    IF current_volume < 0 THEN
                        current_volume := 0; 
                    END_IF;
                    IF current_volume > 100 THEN
                        current_volume := 100; 
                    END_IF;
                    capacity_percentage := (current_volume / tankCube.volume) * 100; 
                    _ton.signal := TRUE; 
                END_IF;
            ELSE
                _ton.signal := FALSE;
                phase := TankState#Close;         
            END_IF; 
    END_CASE;
    
    vInEntry.WriteCyclic(ctrlOpen => vInCtrlEntry);
    vOutEntry.WriteCyclic(ctrlOpen => vOutCtrlEntry);
    tankCube.WriteCyclic(Capacity => capacity_percentage);
END_PROGRAM