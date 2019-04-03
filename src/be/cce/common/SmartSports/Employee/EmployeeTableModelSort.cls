/*------------------------------------------------------------------------
    File        : EmployeeTableModelSort
    Purpose     : Sort class for the EmployeeTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:53:59,634+02:00
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

CLASS be.cce.common.SmartSports.Employee.EmployeeTableModelSort
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
        Purpose: Returns the Sort option for the LastName field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property LastName as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "LastName":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the FirstName field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property FirstName as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "FirstName":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Address field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "Address":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Address2 field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address2 as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "Address2":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the City field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property City as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "City":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the State field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property State as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "State":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the PostalCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property PostalCode as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "PostalCode":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the HomePhone field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property HomePhone as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "HomePhone":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the WorkPhone field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property WorkPhone as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "WorkPhone":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the DeptCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property DeptCode as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "DeptCode":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Position field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Position as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "Position":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the Birthdate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Birthdate as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "Birthdate":u). 
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
        Purpose: Returns the Sort option for the VacationDaysLeft field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property VacationDaysLeft as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "VacationDaysLeft":u). 
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort option for the SickDaysLeft field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property SickDaysLeft as TableModelSortField no-undo 
    get:
        return NEW TableModelSortField (this-object, "SickDaysLeft":u). 
    end get.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModelSort class
        Notes:   
        @param poTableModel The reference to the TableModel for this Sort class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeTableModelSort (poTableModel AS EmployeeTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
    END CONSTRUCTOR.

END CLASS.
