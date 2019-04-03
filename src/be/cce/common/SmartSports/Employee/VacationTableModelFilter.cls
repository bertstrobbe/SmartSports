/*------------------------------------------------------------------------
    File        : VacationTableModelFilter
    Purpose     : Filter class for the VacationTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:03,289+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModelFilter") .

CLASS be.cce.common.SmartSports.Employee.VacationTableModelFilter
    INHERITS TableModelFilter: 

    DEFINE PRIVATE VARIABLE oTableModel AS VacationTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the IntegerFilter for the EmpNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EmpNum as IntegerFilter no-undo 
    get:
        return oTableModel:NewIntegerFilter ("EmpNum":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the DateFilter for the StartDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property StartDate as DateFilter no-undo 
    get:
        return oTableModel:NewDateFilter ("StartDate":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the DateFilter for the EndDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EndDate as DateFilter no-undo 
    get:
        return oTableModel:NewDateFilter ("EndDate":u, this-object) .
    end get.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModelFilter class
        Notes:   
        @param poTableModel The reference to the TableModel for this Filter class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC VacationTableModelFilter (poTableModel AS VacationTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
