/*------------------------------------------------------------------------
    File        : EmployeeTableModel_Generated
    Purpose     : Auto Generated portion of the EmployeeTableModel class
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:03,046+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModelGenerated") .

CLASS be.cce.common.SmartSports.Employee.EmployeeTableModel_Generated 
    INHERITS TableModel ABSTRACT: 

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current EmpNum value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EmpNum as integer no-undo
    get:
        return this-object:GetIntegerFieldValue ("EmpNum":U) .
    end get . 
    public set (arg as integer):
        this-object:SetIntegerFieldValue ("EmpNum":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the EmpNum field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public integer EmpNumWhenAvailable (pDefaultValue as integer):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("EmpNum":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current LastName value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property LastName as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("LastName":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("LastName":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the LastName field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character LastNameWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("LastName":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current FirstName value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property FirstName as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("FirstName":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("FirstName":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the FirstName field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character FirstNameWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("FirstName":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Address value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("Address":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("Address":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Address field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character AddressWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("Address":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Address2 value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Address2 as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("Address2":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("Address2":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Address2 field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character Address2WhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("Address2":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current City value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property City as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("City":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("City":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the City field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character CityWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("City":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current State value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property State as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("State":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("State":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the State field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character StateWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("State":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current PostalCode value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property PostalCode as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("PostalCode":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("PostalCode":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the PostalCode field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character PostalCodeWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("PostalCode":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current HomePhone value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property HomePhone as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("HomePhone":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("HomePhone":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the HomePhone field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character HomePhoneWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("HomePhone":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current WorkPhone value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property WorkPhone as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("WorkPhone":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("WorkPhone":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the WorkPhone field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character WorkPhoneWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("WorkPhone":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current DeptCode value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property DeptCode as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("DeptCode":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("DeptCode":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the DeptCode field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character DeptCodeWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("DeptCode":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Position value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Position as character no-undo
    get:
        return this-object:GetCharacterFieldValue ("Position":U) .
    end get . 
    public set (arg as character):
        this-object:SetCharacterFieldValue ("Position":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Position field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public character PositionWhenAvailable (pDefaultValue as character):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("Position":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current Birthdate value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property Birthdate as date no-undo
    get:
        return this-object:GetDateFieldValue ("Birthdate":U) .
    end get . 
    public set (arg as date):
        this-object:SetDateFieldValue ("Birthdate":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the Birthdate field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public date BirthdateWhenAvailable (pDefaultValue as date):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("Birthdate":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current StartDate value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property StartDate as date no-undo
    get:
        return this-object:GetDateFieldValue ("StartDate":U) .
    end get . 
    public set (arg as date):
        this-object:SetDateFieldValue ("StartDate":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the StartDate field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public date StartDateWhenAvailable (pDefaultValue as date):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("StartDate":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current VacationDaysLeft value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property VacationDaysLeft as integer no-undo
    get:
        return this-object:GetIntegerFieldValue ("VacationDaysLeft":U) .
    end get . 
    public set (arg as integer):
        this-object:SetIntegerFieldValue ("VacationDaysLeft":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the VacationDaysLeft field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public integer VacationDaysLeftWhenAvailable (pDefaultValue as integer):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("VacationDaysLeft":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets the current SickDaysLeft value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property SickDaysLeft as integer no-undo
    get:
        return this-object:GetIntegerFieldValue ("SickDaysLeft":U) .
    end get . 
    public set (arg as integer):
        this-object:SetIntegerFieldValue ("SickDaysLeft":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the SickDaysLeft field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public integer SickDaysLeftWhenAvailable (pDefaultValue as integer):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("SickDaysLeft":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets if the table eVacation should be populated as well
        Notes:
    ------------------------------------------------------------------------------*/
    define public property FillVacation as logical no-undo
    get:
        return this-object:GetFillChildTable ("eVacation":U).
    end get.
    set (arg as logical):
        this-object:SetFillChildTable ("eVacation":U, arg).
    end set.

    /*------------------------------------------------------------------------------
        Purpose: Gets if the table eVacation should be populated as well
        Notes:
        @param plFill Logical value indicating if the table should be populated
        @return The reference to the TableModel for fluent style code
    ------------------------------------------------------------------------------*/
    method public EmployeeTableModel SetFillVacation (plFill as logical):
        this-object:SetFillChildTable ("eVacation":U, plFill).
        return cast (this-object, EmployeeTableModel).
    end method.



    /*------------------------------------------------------------------------------
        Purpose: Returns the Filter Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Filter AS EmployeeTableModelFilter NO-UNDO 
    GET:
        DEFINE VARIABLE oFilter AS EmployeeTableModelFilter NO-UNDO.
        
        oFilter = NEW EmployeeTableModelFilter (THIS-OBJECT) .
        
        &IF PROVERSION BEGINS "10" &THEN
        ASSIGN THIS-OBJECT:SavedFilterReference = oFilter .
        &ENDIF
        
        RETURN oFilter .      
    END.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY SortBy AS EmployeeTableModelSort NO-UNDO 
    GET:
        RETURN NEW EmployeeTableModelSort (THIS-OBJECT) .
    END.
    
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModel_Generated class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeTableModel_Generated (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModel_Generated class
        Notes:   Creates a view model
        @param poTableModel The reference to EmployeeTableModel on which this EmployeeTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PROTECTED EmployeeTableModel_Generated (poTableModel AS EmployeeTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the EmployeeTableModel as a view model for the current record
       Notes:
       @return The EmployeeTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC EmployeeTableModel CreateCurrentRecordView ():
        
        RETURN CAST (THIS-OBJECT:CreateCurrentRecordViewInternal (), 
                     EmployeeTableModel) . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the EmployeeTableModel as a view model
       Notes:
       @return The EmployeeTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC EmployeeTableModel CreateView ():
        
        RETURN CAST (THIS-OBJECT:CreateViewInternal (), 
                     EmployeeTableModel) . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
     * Purpose: Fills the DatasetModel based on the given IFetchDataByKeyTableParameter
     * Notes:   The Tables property of the IFetchDataByKeyTableParameter should match the
     *          FillChildTables property of the TableModel instance
     * @param poFetchDataByKeyTableParameter The IFetchDataByKeyTableParameter to populate the DatasetModel with
     * @return The reference to this TableModel instance
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC EmployeeTableModel Fill (poFetchDataByKeyTableParameter AS IFetchDataByKeyTableParameter):
        RETURN CAST (THIS-OBJECT:FillByKeyTable (poFetchDataByKeyTableParameter), EmployeeTableModel) .
    END METHOD .

    /*------------------------------------------------------------------------------
       Purpose: Resets the TableModel Filter
       Notes:   Strong-typed variant of the TableModelFilter:Reset() method
       @return The EmployeeTableModelFilter instance 
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC EmployeeTableModelFilter ResetFilter ():
        
        RETURN CAST (THIS-OBJECT:Filter:Reset (), 
                     EmployeeTableModelFilter) . 
        
    END METHOD.

    {Consultingwerk/OERA/table-model-fluent-methods.i be.cce.common.SmartSports.Employee.EmployeeTableModel}        
        
END CLASS.
