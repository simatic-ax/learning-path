NAMESPACE Counter
    CLASS SimpleCounter
        VAR
            value : INT := 0;
        END_VAR

        METHOD PUBLIC SetCurrentValue
            VAR_INPUT
                newValue : INT;
            END_VAR

            value := newValue;
        END_METHOD

        METHOD PUBLIC GetCurrentValue : Int
            GetCurrentValue := value;
        END_METHOD

        METHOD PUBLIC CountUp
            value := value + 1;
        END_METHOD
    END_CLASS
END_NAMESPACE