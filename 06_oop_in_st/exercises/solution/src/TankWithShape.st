//USING System.Math;
NAMESPACE FluidHandlingInterfaces
    CLASS CylindricalTank EXTENDS TankWithVolume
        VAR PUBLIC
            radium : REAL;
            height : REAL;
        END_VAR
        METHOD VolumeCalculator : REAL
            //volume := TO_REAL(Constants#PI) * radium * radium * height;
            volume := TO_REAL(3.14) * radium * radium * height; // PI is considered Long Real and If I don't change it to real you need to change everything
        END_METHOD
    END_CLASS

    CLASS CubicTank EXTENDS TankWithVolume
        VAR PUBLIC
            side_length : REAL;
        END_VAR
        METHOD VolumeCalculator : REAL
            volume := side_length * side_length * side_length;
        END_METHOD
    END_CLASS
END_NAMESPACE