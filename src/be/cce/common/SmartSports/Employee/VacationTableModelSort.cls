/*------------------------------------------------------------------------
    File        : VacationTableModelSort
    Purpose     : Sort class for the VacationTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:03,313+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.*                                                  FROM PROPATH . 
USING Consultingwerk.Assertion.*                                        FROM PROPATH . 
USING Consultingwerk.OERA.*                                             FROM PROPATH . 
USING Consultingwerk.OERA.ModelFilter.*                                 FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.*                                                   FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModelSort") .

CLASS be.cce.common.SmartSports.Employee.VacationTableModelSort
    INHERITS TableModelSort: 

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the EmpNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EmpNum as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "EmpNum":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the StartDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property StartDate as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "StartDate":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the EndDate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EndDate as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "EndDate":u). 
    end get.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC VacationTableModelSort (poTableModel AS VacationTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
    END CONSTRUCTOR.

END CLASS.
