/*------------------------------------------------------------------------
    File        : EmployeeTableModel
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:53:59,682+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModel") .

CLASS be.cce.common.SmartSports.Employee.EmployeeTableModel 
    INHERITS EmployeeTableModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModel class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeTableModel (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeTableModel class
        Notes:   Creates a view model
        @param poTableModel The reference to EmployeeTableModel on which this EmployeeTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeTableModel (poTableModel AS EmployeeTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

END CLASS.
