FUNCTION Calculate : LREAL
    VAR_TEMP
        result : LREAL;
    END_VAR
    result := Circle.Area(diameter := 2.0);    // full qualified call
    result := Square.Area(sideLength := 2.0);  // full qualified call
    ;
END_FUNCTION