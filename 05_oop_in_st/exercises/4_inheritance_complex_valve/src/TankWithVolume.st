USING FluidHandlingClass;

NAMESPACE FluidHandlingClass
    CLASS TankWithVolume IMPLEMENTS ItfTank
        VAR PUBLIC
            inletValve: ItfValve;
            outletValve: ItfValve;
            volume: REAL;
        END_VAR
        VAR PROTECTED
            _capacity : REAL; 
            _fill  : BOOL;
            _empty : BOOL;
            _flush : BOOL;
            _close : BOOL;
        END_VAR


        METHOD PUBLIC Capacity : REAL
            VAR_INPUT
                currentVolume : REAL;
            END_VAR 
            _capacity := (currentVolume / volume) * 100;
        END_METHOD

        METHOD PUBLIC OpenInlet 
            inletValve.Open();
        END_METHOD
        METHOD PUBLIC OpenOutlet 
            outletValve.Open();
        END_METHOD
        METHOD PUBLIC CloseInlet 
            inletValve.Close();
        END_METHOD
        METHOD PUBLIC CloseOutlet 
            outletValve.Close();
        END_METHOD
        
        METHOD PUBLIC Fill
            this.OpenInlet();
            this.CloseOutlet();
        END_METHOD

        METHOD PUBLIC Flush
            this.OpenInlet();
            this.OpenOutlet();
        END_METHOD

        METHOD PUBLIC Close
            this.CloseInlet();
            this.CloseOutlet();
        END_METHOD

        METHOD PUBLIC Emptying
            this.CloseInlet();
            this.OpenOutlet();
        END_METHOD
        METHOD PUBLIC ReadCyclic
            VAR_INPUT
                Fill : BOOL;
                Empty : BOOL;
                Flush : BOOL;
                Close : BOOL;
            END_VAR
            _fill := Fill;
            _empty := Empty;
            _flush := Flush;
            _close := Close;
        END_METHOD
        METHOD PUBLIC WriteCyclic
            VAR_OUTPUT
                Capacity : REAL;
            END_VAR
            Capacity := _capacity;
        END_METHOD
        
        
    END_CLASS
END_NAMESPACE