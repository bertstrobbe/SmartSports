/*------------------------------------------------------------------------
    File        : eEmployee.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 14:53:55
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="EmpNum").

DEFINE {&ACCESS} TEMP-TABLE eEmployee{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN before-table eEmployeeBefore{&SUFFIX} &ENDIF
    field EmpNum as integer format "zzzzzzzzz9":u initial "0":u label "Emp No":t
    field LastName as character format "x(25)":u label "Last Name":t
    field FirstName as character format "x(15)":u label "First Name":t
    field Address as character format "x(35)":u label "Address":t
    field Address2 as character format "x(35)":u label "Address2":t
    field City as character format "x(25)":u label "City":t
    field State as character format "x(20)":u label "State":t
    field PostalCode as character format "x(10)":u label "Postal Code":t
    field HomePhone as character format "x(20)":u label "Home Phone":t
    field WorkPhone as character format "x(20)":u label "Work Phone":t
    field DeptCode as character format "x(3)":u label "Dept Code":t
    field Position as character format "x(20)":u label "Position":t
    field Birthdate as date format "99/99/9999":u initial ? label "Birthdate":t
    field StartDate as date format "99/99/9999":u initial ? label "Start Date":t
    field VacationDaysLeft as integer format ">>9":u initial "0":u label "Vacation Days Left":t
    field SickDaysLeft as integer format ">>9":u initial "0":u label "Sick Days Left":t

    index DeptCode DeptCode ascending
    index EmpNo as unique primary EmpNum ascending
    index Name as unique LastName ascending FirstName ascending

    .
