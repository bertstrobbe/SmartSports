/*------------------------------------------------------------------------
    File        : VacationTableModel
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03/04/2019 14:58:03,364+02:00
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.OERA.* FROM PROPATH .
USING be.cce.common.SmartSports.Employee.* FROM PROPATH .  
USING Progress.Lang.* FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="TableModel") .

CLASS be.cce.common.SmartSports.Employee.VacationTableModel 
    INHERITS VacationTableModel_Generated: 

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModel class
        Notes:   
        @param poDatasetModel The reference to the owning DatasetModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC VacationTableModel (poDatasetModel AS DatasetModel, phBufferHandle AS HANDLE):
        
        SUPER (poDatasetModel, phBufferHandle).
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the VacationTableModel class
        Notes:   Creates a view model
        @param poTableModel The reference to VacationTableModel on which this VacationTableModel servers as a ViewModel
        @param phBufferHandle The handle of the ProDataset member buffer this TableModel represents
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC VacationTableModel (poTableModel AS VacationTableModel, phBufferHandle AS HANDLE):
        
        SUPER (poTableModel, phBufferHandle).
        
    END CONSTRUCTOR.

END CLASS.
