NAMESPACE Circle
    FUNCTION Area : LREAL
        VAR_INPUT
            diameter : LREAL;
        END_VAR
        VAR CONSTANT
            PI : REAL := REAL#3.141592;
        END_VAR
        Area := diameter ** 2.0 * PI / 4.0; // (d^2*PI)/4;
    END_FUNCTION    
END_NAMESPACE

NAMESPACE Square
    FUNCTION Area : LREAL
        VAR_INPUT
            sideLength : LREAL;
        END_VAR
        Area := sideLength ** 2.0;
    END_FUNCTION    
END_NAMESPACE