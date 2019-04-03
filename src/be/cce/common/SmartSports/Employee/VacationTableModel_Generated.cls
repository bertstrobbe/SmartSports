/*------------------------------------------------------------------------
    File        : VacationTableModel_Generated
    Purpose     : Auto Generated portion of the VacationTableModel class
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:03,345+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModelGenerated") .

CLASS be.cce.common.SmartSports.Employee.VacationTableModel_Generated 
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
        Purpose: Gets and sets the current EndDate value
        Notes:   
    ------------------------------------------------------------------------------*/
    define public property EndDate as date no-undo
    get:
        return this-object:GetDateFieldValue ("EndDate":U) .
    end get . 
    public set (arg as date):
        this-object:SetDateFieldValue ("EndDate":U, arg) .
    end set .

    /*------------------------------------------------------------------------------
        Purpose: Returns the value of the EndDate field when a record is available
        Notes:   Returns the default value, when no record
        @param pDefaultValue The default value to return when no record is available
        @return The field value or the default value when no record is available
    ------------------------------------------------------------------------------*/
    method public date EndDateWhenAvailable (pDefaultValue as date):
        if this-object:BufferHandle:available then 
            return this-object:BufferHandle:buffer-field ("EndDate":u):buffer-value .
        else 
            return pDefaultValue .
    end method .

    /*------------------------------------------------------------------------------
        Purpose: Gets and sets if the table eEmployee should be populated as well
        Notes:
    ------------------------------------------------------------------------------*/
    define public property FillEmployee as logical no-undo
    get:
        return this-object:GetFillChildTable ("eEmployee":U).
    end get.
    set (arg as logical):
        this-object:SetFillChildTable ("eEmployee":U, arg).
    end set.

    /*------------------------------------------------------------------------------
        Purpose: Gets if the table eEmployee should be populated as well
        Notes:
        @param plFill Logical value indicating if the table should be populated
        @return The reference to the TableModel for fluent style code
    ------------------------------------------------------------------------------*/
    method public VacationTableModel SetFillEmployee (plFill as logical):
        this-object:SetFillChildTable ("eEmployee":U, plFill).
        return cast (this-object, VacationTableModel).
    end method.



    /*------------------------------------------------------------------------------
        Purpose: Returns the Filter Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY Filter AS VacationTableModelFilter NO-UNDO 
    GET:
        DEFINE VARIABLE oFilter AS VacationTableModelFilter NO-UNDO.
        
        oFilter = NEW VacationTableModelFilter (THIS-OBJECT) .
        
        &IF PROVERSION BEGINS "10" &THEN
        ASSIGN THIS-OBJECT:SavedFilterReference = oFilter .
        &ENDIF
        
        RETURN oFilter .      
    END.

    /*------------------------------------------------------------------------------
        Purpose: Returns the Sort Class for this TableModel
        Notes:   
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY SortBy AS VacationTableModelSort NO-UNDO 
    GET:
        RETURN NEW VacationTableModelSort (THIS-OBJECT) .
    END.
    
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModel_Generated class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC VacationTableModel_Generated (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModel_Generated class
        Notes:   Creates a view model
        @param poTableModel The reference to VacationTableModel on which this VacationTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PROTECTED VacationTableModel_Generated (poTableModel AS VacationTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the VacationTableModel as a view model for the current record
       Notes:
       @return The VacationTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VacationTableModel CreateCurrentRecordView ():
        
        RETURN CAST (THIS-OBJECT:CreateCurrentRecordViewInternal (), 
                     VacationTableModel) . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
       Purpose: Creates a new instance of the VacationTableModel as a view model
       Notes:
       @return The VacationTableModel as the view model
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VacationTableModel CreateView ():
        
        RETURN CAST (THIS-OBJECT:CreateViewInternal (), 
                     VacationTableModel) . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
     * Purpose: Fills the DatasetModel based on the given IFetchDataByKeyTableParameter
     * Notes:   The Tables property of the IFetchDataByKeyTableParameter should match the
     *          FillChildTables property of the TableModel instance
     * @param poFetchDataByKeyTableParameter The IFetchDataByKeyTableParameter to populate the DatasetModel with
     * @return The reference to this TableModel instance
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VacationTableModel Fill (poFetchDataByKeyTableParameter AS IFetchDataByKeyTableParameter):
        RETURN CAST (THIS-OBJECT:FillByKeyTable (poFetchDataByKeyTableParameter), VacationTableModel) .
    END METHOD .

    /*------------------------------------------------------------------------------
       Purpose: Resets the TableModel Filter
       Notes:   Strong-typed variant of the TableModelFilter:Reset() method
       @return The VacationTableModelFilter instance 
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VacationTableModelFilter ResetFilter ():
        
        RETURN CAST (THIS-OBJECT:Filter:Reset (), 
                     VacationTableModelFilter) . 
        
    END METHOD.

    {Consultingwerk/OERA/table-model-fluent-methods.i be.cce.common.SmartSports.Employee.VacationTableModel}        
        
END CLASS.
