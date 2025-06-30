USING System.Timer;
USING Siemens.AxTraining.ControlModules;
NAMESPACE Siemens.AxTraining.EquipmentModules

    FUNCTION_BLOCK Tank

        VAR_INPUT
            enable: BOOL;
        END_VAR
        VAR_OUTPUT
            inletOpen : BOOL;
            outletOpen : BOOL;
            state : TankState;
        END_VAR
        VAR 
            inlet : Valve;
            outlet : Valve;
            fillingDelay : OnDelay;
            statemachine : TankState := TankState#Stop; 
        END_VAR;
        
        IF NOT enable THEN
            statemachine := TankState#Stop;
        END_IF;

        CASE statemachine OF
            TankState#Stop: 
                IF enable THEN
                    statemachine := TankState#Filling;
                    END_IF;
            TankState#Filling:
                fillingDelay(signal := TRUE, duration := T#10s);
                
                inlet(cmdOpen := TRUE, cmdClose := FALSE, ctrlOpen => inletOpen);
                outlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => outletOpen);

                IF fillingDelay.output THEN
                    fillingDelay(signal := FALSE, duration := T#0s);
                    statemachine := TankState#Emptying;
                END_IF;

            TankState#Emptying:
                
                fillingDelay(signal := TRUE, duration := T#10s);
                    

                inlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => inletOpen);
                outlet(cmdOpen := TRUE, cmdClose := FALSE, ctrlOpen => outletOpen);
                
                IF fillingDelay.output THEN
                    fillingDelay(signal := FALSE, duration := T#0s);
                    statemachine := TankState#Filling;
                END_IF;

        END_CASE;

        END_FUNCTION_BLOCK
    
END_NAMESPACE
