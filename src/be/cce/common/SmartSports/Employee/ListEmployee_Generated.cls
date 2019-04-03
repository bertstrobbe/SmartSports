/*------------------------------------------------------------------------
    File        : ListEmployee_Generated
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 16:58:09 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.Framework.Base.GenericList FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="EntityListGenerated") .

CLASS be.cce.common.SmartSports.Employee.ListEmployee_Generated 
    INHERITS GenericList
    ABSTRACT: 

    { Consultingwerk/Framework/Base/GenericList.i Employee }

    /*------------------------------------------------------------------------------
        Purpose: Creates a New Row, Initializes it and adds it to the List 
        Notes:   
        @return The reference to the new row instance
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED Employee NewRow ():
        
        DEFINE VARIABLE oEmployee AS Employee NO-UNDO . 
        
        oEmployee = NEW Employee () . 
        oEmployee:InitializeNewRow () . 
        
        THIS-OBJECT:Add (oEmployee) . 
        
        RETURN oEmployee .
    END METHOD .

END CLASS.
