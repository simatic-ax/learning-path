NAMESPACE FluidHandlingInterfaces
    INTERFACE ITank

        METHOD OpenInlet 
        END_METHOD
        METHOD OpenOutlet 
        END_METHOD
        METHOD CloseInlet 
        END_METHOD
        METHOD CloseOutlet 
        END_METHOD

        METHOD Fill
        END_METHOD
        METHOD Flush    
        END_METHOD

        METHOD  Close
        END_METHOD

        METHOD Emptying
        END_METHOD

    END_INTERFACE    
END_NAMESPACE