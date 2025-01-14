//Use the same namespace than the TYPE for the Valves state

NAMESPACE FluidHandlingClass   

    CLASS TankBase IMPLEMENTS ItfTank
        VAR PRIVATE
            inletValve: ValveBase;
            outletValve: ValveBase;
        END_VAR

        METHOD PUBLIC Fill
            inletValve.Open();
            outletValve.Close();
        END_METHOD

        METHOD PUBLIC Flush
            inletValve.Open();
            outletValve.Open();
        END_METHOD

        METHOD PUBLIC Close
            inletValve.Close();
            outletValve.Close();
        END_METHOD

        METHOD PUBLIC Emptying
            this.Close();
            outletValve.Open();
        END_METHOD
    END_CLASS
    
END_NAMESPACE