USING Siemens.AxTraining.EquipmentModules;

NAMESPACE Siemens.AxTraining
    PROGRAM FluidProgram

        VAR_EXTERNAL
            cmdFillTank : BOOL;
            cmdEmptyTank : BOOL;
            inletOpenTank : BOOL;
            outletOpenTank : BOOL;
        END_VAR
        VAR
            tank : Tank;
        END_VAR

        tank(cmdFill := cmdFillTank, 
            cmdEmpty := cmdEmptyTank,
            inletOpen => inletOpenTank,
            outletOpen => outletOpenTank);
    END_PROGRAM
END_NAMESPACE