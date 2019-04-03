/*------------------------------------------------------------------------
    File        : EmployeeBusinessEntity
    Purpose     : Business Entity for Employee
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 14:53:55
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING be.cce.server.SmartSports.Employee.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING Progress.Lang.*                 FROM PROPATH .

/* Sample Annotations - see http://confluence.consultingwerkcloud.com/wiki/display/SCL/The+Annotation+based+Type+Descriptor
@BusinessEntityView (name="order", isdefault="true", entitytable="eOrder", entityview="eCustomer", 
                     listcolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name",
                     viewercolumns="eOrder.OrderNum,eOrder.OrderDate,eOrder.CustNum,eCustomer.Name,eOrder.OrderStatus") .
@BusinessEntityTable (name="eOrder", performValidation="false", mandatoryColumns="ordernum,orderstatus", addOnlyColumns="ordernum", readonlyColumns="ordernum") .
@BusinessEntityTable (name="eCustomer", performValidation="false",  mandatoryColumns="ordernum,orderstatus", readonly="true") .
*/

@Description (description="Business Entity for Employee") .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="BusinessEntity") .

CLASS be.cce.server.SmartSports.Employee.EmployeeBusinessEntity 
    INHERITS BusinessEntity IMPLEMENTS IFetchDataByReference
    USE-WIDGET-POOL: 

    { be/cce/common/SmartSports/Employee/dsEmployee.i }

    /*------------------------------------------------------------------------------
        Purpose: Constructor of the EmployeeBusinessEntity class                                                                     
        Notes:   Passes the handle of the dataset instance to the base class and 
                 sets the default DataAccessName                                                                        
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeBusinessEntity ():
        SUPER (DATASET dsEmployee:HANDLE).
        
        THIS-OBJECT:DataAccessName = "be.cce.server.SmartSports.Employee.EmployeeDataAccess":U .

    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose:  Fetch data from the Data Access object
        Notes:
        @param poFetchDataRequest The IFetchDataRequest object with the parameters for this call
        @param dsEmployee The dataset, intended to by passed BY-REFERENCE
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC FINAL VOID FetchDataByReference (poFetchDataRequest AS Consultingwerk.OERA.IFetchDataRequest,
                                                   OUTPUT DATASET dsEmployee):

        THIS-OBJECT:FetchData (poFetchDataRequest, DATASET dsEmployee:HANDLE) .

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook to modify data in the ProDataset after Read and 
                 Update operations (i.e. population of aggregated values)                                                                     
        Notes:   Invoked during FetchData () and SaveChanges ()                                                                     
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID ReceiveData ():
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Provides a hook for high level data validation before Update 
                 operations                                                                     
        Notes:   Invoked during SaveChanges (). When the ERROR flag of the ProDataset
                 is set, the Update operation will be cancelled before writing back
                 the data to the database using the DataAccess object                                                                      
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID ValidateData ():
        
    END METHOD.

END CLASS.
