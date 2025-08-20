USING AxUnit.Assert;
USING Numbers;

NAMESPACE Test
    {Test}
    FUNCTION EvenNumber
        VAR_TEMP
            result : BOOL;
        END_VAR

        result := NumberIsEven(2);
        Equal(actual := result, expected := TRUE);

        result := NumberIsEven(5);
        Equal(actual := result, expected := FALSE);
    END_FUNCTION
END_NAMESPACE