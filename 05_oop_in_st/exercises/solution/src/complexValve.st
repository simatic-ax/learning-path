USING FluidHandlingClass;
NAMESPACE FluidHandlingInterfaces
    CLASS ValveWithEntry EXTENDS basicValve
        VAR PROTECTED
            _regulator : REAL;
        END_VAR
        METHOD PUBLIC Close : REAL
            VAR_INPUT
                regulator : REAL;
            END_VAR

            Close := regulator /100;
            _ctrlOpen := FALSE;
        END_METHOD

        METHOD PUBLIC Open : REAL
            VAR_INPUT
                regulator : REAL;
            END_VAR
            Open := regulator/100;  //return the grade of opening/closing to multiply later. If the opening in filling is 50% the filling rate is 2.5 L/s
            _ctrlOpen := TRUE;
        END_METHOD

        METHOD PUBLIC OVERRIDE GetState : ValveState
            IF (_ctrlOpen) THEN 
                GetState := ValveState#Open;
            ELSE
                GetState := ValveState#Closed;
            END_IF;
        END_METHOD
        METHOD PUBLIC ReadCyclic
            VAR_INPUT
                Regulator : REAL;
            END_VAR
            
            _regulator := Regulator;
        END_METHOD
        METHOD PUBLIC  WriteCyclic 
            VAR_OUTPUT
                ctrlOpen : BYTE;
            END_VAR
            ctrlOpen := _ctrlOpen;
        END_METHOD

    END_CLASS

END_NAMESPACE