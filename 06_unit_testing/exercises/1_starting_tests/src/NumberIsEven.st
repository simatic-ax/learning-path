NAMESPACE Numbers
    FUNCTION NumberIsEven : BOOL
        VAR_INPUT
            number : INT;
        END_VAR

        IF number MOD 2 = 0 THEN
            NumberIsEven := TRUE;
        ELSE
            NumberIsEven := FALSE;
        END_IF;
    END_FUNCTION
END_NAMESPACE