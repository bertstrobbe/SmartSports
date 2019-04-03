/*------------------------------------------------------------------------
    File        : Employee
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 16:58:09 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.EntityTable FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="EntityClassGenerated") .

CLASS be.cce.common.SmartSports.Employee.Employee_Generated 
    INHERITS EntityTable
    ABSTRACT: 

    DEFINE PUBLIC PROPERTY Vacations AS be.cce.common.SmartSports.Employee.ListVacation NO-UNDO GET. PROTECTED SET. 

    DEFINE PUBLIC PROPERTY EmpNum AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:EmpNum = arg .
        THIS-OBJECT:SetModified () .
        OnEmpNumChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the EmpNum property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT EmpNumChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the EmpNumChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnEmpNumChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:EmpNumChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY LastName AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:LastName = arg .
        THIS-OBJECT:SetModified () .
        OnLastNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the LastName property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT LastNameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the LastNameChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnLastNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:LastNameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY FirstName AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:FirstName = arg .
        THIS-OBJECT:SetModified () .
        OnFirstNameChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the FirstName property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT FirstNameChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the FirstNameChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnFirstNameChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:FirstNameChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Address AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Address = arg .
        THIS-OBJECT:SetModified () .
        OnAddressChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the Address property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT AddressChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the AddressChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnAddressChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:AddressChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Address2 AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Address2 = arg .
        THIS-OBJECT:SetModified () .
        OnAddress2Changed (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the Address2 property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT Address2Changed SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the Address2Changed event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnAddress2Changed (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:Address2Changed:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY City AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:City = arg .
        THIS-OBJECT:SetModified () .
        OnCityChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the City property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT CityChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the CityChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnCityChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:CityChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY State AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:State = arg .
        THIS-OBJECT:SetModified () .
        OnStateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the State property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT StateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the StateChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnStateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:StateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY PostalCode AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:PostalCode = arg .
        THIS-OBJECT:SetModified () .
        OnPostalCodeChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the PostalCode property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT PostalCodeChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the PostalCodeChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnPostalCodeChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PostalCodeChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY HomePhone AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:HomePhone = arg .
        THIS-OBJECT:SetModified () .
        OnHomePhoneChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the HomePhone property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT HomePhoneChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the HomePhoneChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnHomePhoneChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:HomePhoneChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY WorkPhone AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:WorkPhone = arg .
        THIS-OBJECT:SetModified () .
        OnWorkPhoneChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the WorkPhone property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT WorkPhoneChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the WorkPhoneChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnWorkPhoneChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:WorkPhoneChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY DeptCode AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:DeptCode = arg .
        THIS-OBJECT:SetModified () .
        OnDeptCodeChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the DeptCode property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT DeptCodeChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the DeptCodeChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnDeptCodeChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:DeptCodeChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Position AS CHARACTER  NO-UNDO
    GET.
    PUBLIC SET (arg as CHARACTER):
        THIS-OBJECT:Position = arg .
        THIS-OBJECT:SetModified () .
        OnPositionChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the Position property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT PositionChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the PositionChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnPositionChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:PositionChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY Birthdate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:Birthdate = arg .
        THIS-OBJECT:SetModified () .
        OnBirthdateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the Birthdate property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT BirthdateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the BirthdateChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnBirthdateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:BirthdateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY StartDate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:StartDate = arg .
        THIS-OBJECT:SetModified () .
        OnStartDateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the StartDate property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT StartDateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the StartDateChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnStartDateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:StartDateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY VacationDaysLeft AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:VacationDaysLeft = arg .
        THIS-OBJECT:SetModified () .
        OnVacationDaysLeftChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the VacationDaysLeft property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT VacationDaysLeftChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the VacationDaysLeftChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnVacationDaysLeftChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:VacationDaysLeftChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .

    DEFINE PUBLIC PROPERTY SickDaysLeft AS INTEGER  NO-UNDO
    GET.
    PUBLIC SET (arg as INTEGER):
        THIS-OBJECT:SickDaysLeft = arg .
        THIS-OBJECT:SetModified () .
        OnSickDaysLeftChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the SickDaysLeft property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT SickDaysLeftChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the SickDaysLeftChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnSickDaysLeftChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:SickDaysLeftChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Employee_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Employee_Generated ():
    
        THIS-OBJECT:Vacations = NEW be.cce.common.SmartSports.Employee.ListVacation () .

    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Employee_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Employee_Generated (phBuffer AS HANDLE):
    
        THIS-OBJECT () .
    
        Consultingwerk.Assertion.HandleAssert:WidgetType (phBuffer, 
                                                          "BUFFER":U) .     
    
        THIS-OBJECT:AssignFromBuffer (phBuffer) .  
    
    END CONSTRUCTOR .

        
    /*------------------------------------------------------------------------------
        Purpose: Copies the buffer values to the entity table's properties                                                                        
        Notes:             
        @param phBuffer The handle of the record buffer to assign properties from                                                             
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignFromBuffer (phBuffer AS HANDLE):

        DEFINE VARIABLE hBuffer AS HANDLE NO-UNDO.

        ASSIGN THIS-OBJECT:EmpNum = phBuffer::EmpNum .

        ASSIGN THIS-OBJECT:LastName = phBuffer::LastName .

        ASSIGN THIS-OBJECT:FirstName = phBuffer::FirstName .

        ASSIGN THIS-OBJECT:Address = phBuffer::Address .

        ASSIGN THIS-OBJECT:Address2 = phBuffer::Address2 .

        ASSIGN THIS-OBJECT:City = phBuffer::City .

        ASSIGN THIS-OBJECT:State = phBuffer::State .

        ASSIGN THIS-OBJECT:PostalCode = phBuffer::PostalCode .

        ASSIGN THIS-OBJECT:HomePhone = phBuffer::HomePhone .

        ASSIGN THIS-OBJECT:WorkPhone = phBuffer::WorkPhone .

        ASSIGN THIS-OBJECT:DeptCode = phBuffer::DeptCode .

        ASSIGN THIS-OBJECT:Position = phBuffer::Position .

        ASSIGN THIS-OBJECT:Birthdate = phBuffer::Birthdate .

        ASSIGN THIS-OBJECT:StartDate = phBuffer::StartDate .

        ASSIGN THIS-OBJECT:VacationDaysLeft = phBuffer::VacationDaysLeft .

        ASSIGN THIS-OBJECT:SickDaysLeft = phBuffer::SickDaysLeft .

        THIS-OBJECT:Vacations:Clear () .
        THIS-OBJECT:GetChildRecords (phBuffer,
                                     "eEmployeeeVacationRelation":U,
                                     THIS-OBJECT:Vacations,
                                     "be.cce.common.SmartSports.Employee.Vacation":U) .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::EmpNum = THIS-OBJECT:EmpNum .

        ASSIGN phBuffer::LastName = THIS-OBJECT:LastName .

        ASSIGN phBuffer::FirstName = THIS-OBJECT:FirstName .

        ASSIGN phBuffer::Address = THIS-OBJECT:Address .

        ASSIGN phBuffer::Address2 = THIS-OBJECT:Address2 .

        ASSIGN phBuffer::City = THIS-OBJECT:City .

        ASSIGN phBuffer::State = THIS-OBJECT:State .

        ASSIGN phBuffer::PostalCode = THIS-OBJECT:PostalCode .

        ASSIGN phBuffer::HomePhone = THIS-OBJECT:HomePhone .

        ASSIGN phBuffer::WorkPhone = THIS-OBJECT:WorkPhone .

        ASSIGN phBuffer::DeptCode = THIS-OBJECT:DeptCode .

        ASSIGN phBuffer::Position = THIS-OBJECT:Position .

        ASSIGN phBuffer::Birthdate = THIS-OBJECT:Birthdate .

        ASSIGN phBuffer::StartDate = THIS-OBJECT:StartDate .

        ASSIGN phBuffer::VacationDaysLeft = THIS-OBJECT:VacationDaysLeft .

        ASSIGN phBuffer::SickDaysLeft = THIS-OBJECT:SickDaysLeft .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the Employee_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Employee_Generated ():

    END DESTRUCTOR.

END CLASS.
