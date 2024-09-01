NAMESPACE FluidHandlingClass

    //Update the class to implement the Interface
    class Tank
        VAR PUBLIC
            inletValve: ValveClass;
            outletValve: ValveClass;
        END_VAR

        METHOD PRIVATE OpenInlet 
            inletValve.Open();
        END_METHOD
        METHOD PRIVATE OpenOutlet 
            outletValve.Open();
        END_METHOD
        METHOD PRIVATE CloseInlet 
            inletValve.Close();
        END_METHOD
        METHOD PRIVATE CloseOutlet 
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
    END_CLASS
END_NAMESPACE