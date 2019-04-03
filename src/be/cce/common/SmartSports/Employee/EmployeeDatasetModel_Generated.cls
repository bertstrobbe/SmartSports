/*------------------------------------------------------------------------
    File        : EmployeeDatasetModel_Generated
    Purpose     : Auto Generated portion of the Employee class
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:04,180+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="DatasetModelGenerated") .

CLASS be.cce.common.SmartSports.Employee.EmployeeDatasetModel_Generated 
    INHERITS DatasetModel ABSTRACT: 

    { be/cce/common/SmartSports/Employee/dsEmployee.i &ACCESS=PROTECTED }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Employee table model
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Employee as EmployeeTableModel no-undo
    get.
    private set.

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the Vacation table model
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Vacation as VacationTableModel no-undo
    get.
    private set.

    /*------------------------------------------------------------------------------
        Purpose: Initializes the Filter for Employee 
        Notes:   
        @param pEmpNum The filter value for the eEmployee.EmpNum field
        @return Logical value indicating if a record is available
    ------------------------------------------------------------------------------*/
    method public logical NewFilter (pEmpNum as integer):

        this-object:Employee:Filter:Reset () .
        this-object:Employee:Filter:EmpNum:EQ (pEmpNum) .

        this-object:Employee:Filter:Run () .

        return this-object:Employee:Available .

    end method .

    /*------------------------------------------------------------------------------
        Purpose: Initializes the Filter for Vacation 
        Notes:   
        @param pEmpNum The filter value for the eVacation.EmpNum field
        @param pStartDate The filter value for the eVacation.StartDate field
        @return Logical value indicating if a record is available
    ------------------------------------------------------------------------------*/
    method public logical NewFilter (pEmpNum as integer, pStartDate as date):

        this-object:Vacation:Filter:Reset () .
        this-object:Vacation:Filter:EmpNum:EQ (pEmpNum) .
        this-object:Vacation:Filter:StartDate:EQ (pStartDate) .

        this-object:Vacation:Filter:Run () .

        return this-object:Vacation:Available .

    end method .

    /*------------------------------------------------------------------------------
        Purpose: Returns the name of the Business Entity this model belongs to 
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE OVERRIDE PUBLIC PROPERTY EntityName AS CHARACTER NO-UNDO INITIAL "be.cce.server.SmartSports.Employee.EmployeeBusinessEntity":U
    GET.
    PROTECTED SET.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDatasetModel_Generated class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetModel_Generated ():
        SUPER (DATASET dsEmployee:HANDLE).

        this-object:Employee = new EmployeeTableModel (this-object, buffer eEmployee:handle) .

        this-object:TableModels:Add (this-object:Employee) .

        this-object:Vacation = new VacationTableModel (this-object, buffer eVacation:handle) .

        this-object:TableModels:Add (this-object:Vacation) .

       
    END CONSTRUCTOR.

  
    {Consultingwerk/OERA/dataset-model-fluent-methods.i be.cce.common.SmartSports.Employee.EmployeeDatasetModel}

END CLASS.
