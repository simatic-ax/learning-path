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
            statemachine : TankState := TankState#Stop; 
        END_VAR;
        
        IF NOT enable THEN
            statemachine := TankState#Stop;
        END_IF;

        CASE statemachine OF
            TankState#Stop:
             
                IF enable THEN
                    statemachine := TankState#Filling;
                    inlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => inletOpen);
                    outlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => outletOpen);
                    END_IF;
            TankState#Filling:
                
                inlet(cmdOpen := TRUE, cmdClose := FALSE, ctrlOpen => inletOpen);
                outlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => outletOpen);
                statemachine := TankState#Emptying;

            TankState#Emptying:
                    
                inlet(cmdOpen := FALSE, cmdClose := TRUE, ctrlOpen => inletOpen);
                outlet(cmdOpen := TRUE, cmdClose := FALSE, ctrlOpen => outletOpen);
                statemachine := TankState#Filling;
        END_CASE;

        state := statemachine;
        END_FUNCTION_BLOCK
END_NAMESPACE
