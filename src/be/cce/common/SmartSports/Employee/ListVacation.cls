/*------------------------------------------------------------------------
    File        : ListVacation
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     :  
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING be.cce.common.SmartSports.Employee.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="EntityList") .

CLASS be.cce.common.SmartSports.Employee.ListVacation 
    INHERITS ListVacation_Generated: 


END CLASS.