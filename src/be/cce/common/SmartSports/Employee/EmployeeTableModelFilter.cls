/*------------------------------------------------------------------------
    File        : EmployeeTableModelFilter
    Purpose     : Filter class for the EmployeeTableModel 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:53:59,609+02:00
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

CLASS be.cce.common.SmartSports.Employee.EmployeeTableModelFilter
    INHERITS TableModelFilter: 

    DEFINE PRIVATE VARIABLE oTableModel AS EmployeeTableModel_Generated NO-UNDO . 

    /*------------------------------------------------------------------------------
        Purpose: Returns the IntegerFilter for the EmpNum field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EmpNum as IntegerFilter no-undo 
    get:
        return oTableModel:NewIntegerFilter ("EmpNum":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the LastName field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property LastName as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("LastName":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the FirstName field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property FirstName as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("FirstName":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Address field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("Address":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Address2 field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address2 as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("Address2":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the City field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property City as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("City":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the State field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property State as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("State":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the PostalCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property PostalCode as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("PostalCode":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the HomePhone field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property HomePhone as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("HomePhone":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the WorkPhone field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property WorkPhone as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("WorkPhone":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the DeptCode field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property DeptCode as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("DeptCode":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the CharacterFilter for the Position field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Position as CharacterFilter no-undo 
    get:
        return oTableModel:NewCharacterFilter ("Position":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the DateFilter for the Birthdate field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Birthdate as DateFilter no-undo 
    get:
        return oTableModel:NewDateFilter ("Birthdate":u, this-object) .
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
        Purpose: Returns the IntegerFilter for the VacationDaysLeft field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property VacationDaysLeft as IntegerFilter no-undo 
    get:
        return oTableModel:NewIntegerFilter ("VacationDaysLeft":u, this-object) .
    end get.

    /*------------------------------------------------------------------------------
        Purpose: Returns the IntegerFilter for the SickDaysLeft field
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property SickDaysLeft as IntegerFilter no-undo 
    get:
        return oTableModel:NewIntegerFilter ("SickDaysLeft":u, this-object) .
    end get.



    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModelFilter class
        Notes:   
        @param poTableModel The reference to the TableModel for this Filter class
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeTableModelFilter (poTableModel AS EmployeeTableModel_Generated):
        SUPER (poTableModel).
        
        ObjectAssert:IsValid (poTableModel, "TableModel":U) .
        
        ASSIGN oTableModel = poTableModel.
        
    END CONSTRUCTOR.

END CLASS.
