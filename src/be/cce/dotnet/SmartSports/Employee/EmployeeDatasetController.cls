/*------------------------------------------------------------------------
    File        : EmployeeDatasetController
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 14:53:59
    Notes       : Conditionally implements the IDatasetController Interface
                  when the SmartComponentLibrary preprocessor option is set.
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

{Consultingwerk/products.i}

USING be.cce.dotnet.SmartSports.Employee.* FROM PROPATH .
USING Consultingwerk.SmartComponents.Interfaces.* FROM PROPATH .
USING Consultingwerk.Util.*                       FROM PROPATH . 
USING Progress.Lang.*                             FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="DatasetController") .

CLASS be.cce.dotnet.SmartSports.Employee.EmployeeDatasetController 
    &IF DEFINED (SmartComponentLibrary) NE 0 &THEN IMPLEMENTS IDatasetController &ENDIF : 

    { be/cce/common/SmartSports/Employee/dsEmployee.i }

    /*------------------------------------------------------------------------------
        Purpose: Returns the reference to the static dataset defined inside the
                 Dataset Controller                                                                     
        Notes:   Interface IDatasetController member                                                                        
    ------------------------------------------------------------------------------*/
    DEFINE PUBLIC PROPERTY DatasetHandle AS HANDLE NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the EmployeeDatasetController class                                                                      
        Notes:   Assigns the DatasetHandle property                                                                         
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDatasetController ():
        SUPER ().

        THIS-OBJECT:DatasetHandle = DATASET dsEmployee:HANDLE .         
        
    END CONSTRUCTOR.
    
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when detaching from the Dataset of the DatasetController.
                 Allows event unsubscription etc.                                                                      
        Notes:   Interface IDatasetController member        
        @param poConsumer The reference of the Object detaching from the Dataset Controller                                                                
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID DeregisterConsumer (poConsumer AS Progress.Lang.Object):
        
    END METHOD.
        
    /*------------------------------------------------------------------------------
        Purpose: Invoked by SmartBusinessEntityAdapter and SmartDatasetChildAdapter
                 instances when attaching to the Dataset of the DatasetController.
                 Allows event subscription etc.                                                                     
        Notes:   Interface IDatasetController member                                                                        
        @param poConsumer The reference of the Object attaching to the Dataset Controller                                                                
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC VOID RegisterConsumer (poConsumer AS Progress.Lang.Object):

    END METHOD.

END CLASS.