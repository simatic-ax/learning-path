USING AxUnit.Assert;
USING Counter;

NAMESPACE Test
    {TestFixture}
    CLASS CounterTest
        VAR
            simpleCounter : SimpleCounter;
        END_VAR

        {Test}
        METHOD PUBLIC CountFrom2To4
            simpleCounter.SetCurrentValue(2);
            simpleCounter.CountUp();
            simpleCounter.CountUp();
            Equal(actual := simpleCounter.GetCurrentValue(), expected := 4);
        END_METHOD
    END_CLASS
END_NAMESPACE