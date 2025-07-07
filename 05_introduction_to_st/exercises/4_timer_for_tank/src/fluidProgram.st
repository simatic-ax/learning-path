USING Siemens.AxTraining.ControlModules;
USING Siemens.AxTraining.EquipmentModules;

NAMESPACE Siemens.AxTraining
    PROGRAM FluidProgram

        VAR_EXTERNAL
            enableTank : BOOL;
            inletOpenTank : BOOL;
            outletOpenTank : BOOL;
        END_VAR
        VAR
            tank : Tank;
        END_VAR

        tank(enable := enableTank,
            inletOpen => inletOpenTank,
            outletOpen => outletOpenTank);
    END_PROGRAM
END_NAMESPACE
