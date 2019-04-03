/*------------------------------------------------------------------------
    File        : EmployeeDatasetModel
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:54:00,505+02:00
    Notes       : Custom constructors that should not be replaced when the  
                  DatasetModel class is regenerated, need to be annotated 
                  using the @CustomConstructor. annotation
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="DatasetModel") .

CLASS be.cce.common.SmartSports.Employee.EmployeeDatasetModel
    INHERITS EmployeeDatasetModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetModel ():
        SUPER ().

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   
        @param pEmpNum The filter value for the eEmployee.EmpNum field
    ------------------------------------------------------------------------------*/
    constructor public EmployeeDatasetModel (pEmpNum as integer):
        super ().

        this-object:Employee:Filter:EmpNum:EQ (pEmpNum) .

        this-object:Employee:Filter:Run () .

    end constructor.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   
        @param pEmpNum The filter value for the eVacation.EmpNum field
        @param pStartDate The filter value for the eVacation.StartDate field
    ------------------------------------------------------------------------------*/
    constructor public EmployeeDatasetModel (pEmpNum as integer, pStartDate as date):
        super ().

        this-object:Vacation:Filter:EmpNum:EQ (pEmpNum) .
        this-object:Vacation:Filter:StartDate:EQ (pStartDate) .

        this-object:Vacation:Filter:Run () .

    end constructor.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param pcTables The comma delimited list of the Table Names to retrieve
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetModel (pcTables AS CHARACTER,
                                       poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (pcTables, poNamedQuery) .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   Retrieves data based on a named query   
        @param poNamedQuery The INamedQueryParameter that defines a named query
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetModel (poNamedQuery AS INamedQueryParameter):
        SUPER ().

        THIS-OBJECT:RetrieveData (poNamedQuery) .

    END CONSTRUCTOR.

    @CustomConstructor.
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel class
        Notes:   
        @param poDatasetModelMode The DatasetModelModeEnum that controls the mode of the DatasetModel
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetModel (poDatasetModelMode AS DatasetModelModeEnum):

        SUPER ().

        IF poDatasetModelMode = DatasetModelModeEnum:Disconnected THEN
            THIS-OBJECT:InitializeDisconnected () .

    END CONSTRUCTOR.

END CLASS.
