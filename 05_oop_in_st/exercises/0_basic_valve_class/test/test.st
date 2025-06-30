USING AxUnit;

NAMESPACE MyTest

    {TestFixture}
    CLASS MyTestFixture

        VAR PROTECTED
        END_VAR

        {Test}
        METHOD PUBLIC MyTestMethod
            VAR_TEMP
                result : BOOL;
            END_VAR

            Assert.Equal(actual := FALSE, expected := FALSE);
        
        END_METHOD
    END_CLASS

END_NAMESPACE
