/*------------------------------------------------------------------------
    File        : Vacation
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

CLASS be.cce.common.SmartSports.Employee.Vacation_Generated 
    INHERITS EntityTable
    ABSTRACT: 

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

    DEFINE PUBLIC PROPERTY EndDate AS DATE  NO-UNDO
    GET.
    PUBLIC SET (arg as DATE):
        THIS-OBJECT:EndDate = arg .
        THIS-OBJECT:SetModified () .
        OnEndDateChanged (Consultingwerk.EventArgs:Empty) .
    END SET .

    /*------------------------------------------------------------------------------
        Purpose: Raised when the EndDate property value changes
        Notes:           
        @param sender The reference to the object that raised the event
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC EVENT EndDateChanged SIGNATURE VOID (sender AS Progress.Lang.Object, e AS Consultingwerk.EventArgs) .

    /*------------------------------------------------------------------------------
        Purpose: Raises the EndDateChanged event
        Notes:           
        @param e The Consultingwerk.EventArgs with the data for this event 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED VOID OnEndDateChanged (e AS Consultingwerk.EventArgs):
        THIS-OBJECT:EndDateChanged:Publish (THIS-OBJECT, e) . 
    END METHOD .


    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Vacation_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Vacation_Generated ():
    
    
    END CONSTRUCTOR .

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the Vacation_Generated class                                                                      
        Notes:                                         
        @param phBuffer A source buffer to copy the values from                                
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC Vacation_Generated (phBuffer AS HANDLE):
    
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

        ASSIGN THIS-OBJECT:StartDate = phBuffer::StartDate .

        ASSIGN THIS-OBJECT:EndDate = phBuffer::EndDate .



    END METHOD . 
    
    /*------------------------------------------------------------------------------
        Purpose: Copies the entity table's properties to the buffer values                                                                         
        Notes:                                                                        
        @param phBuffer The handle of the record buffer to assign fields to 
    ------------------------------------------------------------------------------*/
    METHOD PROTECTED OVERRIDE VOID AssignToBuffer (phBuffer AS HANDLE):
    
        ASSIGN phBuffer::EmpNum = THIS-OBJECT:EmpNum .

        ASSIGN phBuffer::StartDate = THIS-OBJECT:StartDate .

        ASSIGN phBuffer::EndDate = THIS-OBJECT:EndDate .

    
    
    END METHOD . 

    /*------------------------------------------------------------------------------
        Purpose: Destructor of the Vacation_Generated class                                                                      
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC Vacation_Generated ():

    END DESTRUCTOR.

END CLASS.
