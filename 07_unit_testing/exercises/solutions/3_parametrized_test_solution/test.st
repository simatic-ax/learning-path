USING AxUnit.Assert;
USING Counter;

NAMESPACE Test
    {TestFixture}
    CLASS CounterTest
        VAR
            simpleCounter : SimpleCounter;
        END_VAR

        {Test(startValue := 0, countUpXtimes := 42, result := 42)}
        {Test(startValue := 5, countUpXtimes := 9, result := 14)}
        {Test(startValue := 100, countUpXtimes := 5, result := 105)}
        METHOD PUBLIC CountUp
            VAR_INPUT
                startValue : INT;
                countUpXtimes : INT;
                result : INT;
            END_VAR

            VAR_TEMP
                index : DINT;
            END_VAR

            FOR index := 1 TO countUpXtimes DO
                IF index = 1 THEN
                    simpleCounter.SetCurrentValue(startValue);
                END_IF;
                simpleCounter.CountUp();
            END_FOR;

            Equal(actual := simpleCounter.GetCurrentValue(), expected := result);
        END_METHOD
    END_CLASS
END_NAMESPACE