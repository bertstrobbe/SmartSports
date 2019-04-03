/*------------------------------------------------------------------------
    File        : eVacation.i
    Purpose     : 

    Syntax      :

    Description :  

    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 14:57:59
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TempTable") .
@openapi.openedge.entity.primarykey (fields="EmpNum,StartDate").

DEFINE {&ACCESS} TEMP-TABLE eVacation{&SUFFIX} NO-UNDO {&REFERENCE-ONLY} &IF DEFINED (NO-BEFORE) EQ 0 &THEN before-table eVacationBefore{&SUFFIX} &ENDIF
    field EmpNum as integer format "zzzzzzzzz9":u initial "0":u label "Emp No":t
    field StartDate as date format "99/99/9999":u initial ? label "Start Date":t
    field EndDate as date format "99/99/9999":u initial ? label "End Date":t

    index EmpNoStartDate as unique primary EmpNum ascending StartDate ascending

    .
