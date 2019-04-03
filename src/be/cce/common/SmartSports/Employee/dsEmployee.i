/*------------------------------------------------------------------------
    File        : dsEmployee.i
    Purpose     : Business Entity for Employee

    Syntax      :

    Description : 

    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 16:57:00
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

&SCOPED-DEFINE ACCESS {&ACCESS}
&SCOPED-DEFINE REFERENCE-ONLY {&REFERENCE-ONLY}
&SCOPED-DEFINE SUFFIX {&SUFFIX}

&GLOBAL-DEFINE DATASET-NAME dsEmployee

{ be/cce/common/SmartSports/Employee/eEmployee.i }
{ be/cce/common/SmartSports/Employee/eVacation.i }


@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="Dataset") .

DEFINE {&ACCESS} DATASET dsEmployee{&SUFFIX} {&REFERENCE-ONLY} FOR eEmployee{&SUFFIX}, eVacation{&SUFFIX} 
    data-relation eEmployeeeVacationRelation for eEmployee{&suffix}, eVacation{&suffix} 
        relation-fields (EmpNum,EmpNum)

    .    
