/*------------------------------------------------------------------------
    File        : EmployeeDataAccess
    Purpose     : Data Access Component
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 14:58:00 
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING be.cce.server.SmartSports.Employee.* FROM PROPATH .
USING Consultingwerk.SmartFramework.* FROM PROPATH .
USING Consultingwerk.OERA.*           FROM PROPATH .
USING Consultingwerk.Util.*           FROM PROPATH . 
USING Progress.Lang.*                 FROM PROPATH .

@BusinessEntityGenerator (entityname="be.cce.server.SmartSports.Employee.EmployeeBusinessEntity", type="DataAccess") .

CLASS be.cce.server.SmartSports.Employee.EmployeeDataAccess 
    INHERITS DataAccess
    USE-WIDGET-POOL: 

    { be/cce/common/SmartSports/Employee/dsEmployee.i &ACCESS="PRIVATE" &REFERENCE-ONLY="REFERENCE-ONLY"}

    @DefineDataSourcesStart.
    define private data-source src_Employee for Employee .
    define private data-source src_Vacation for Vacation .
    @DefineDataSourcesEnd.

    @DefineDataSourceInformationStart.
    @DefineDataSourceInformationEnd.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeDataAccess class                                                                      
        Notes:   Used by the BusinessEntity, will receive the handle of the dataset
                 instance form the BusinessEntity as a parameter. Permanently BIND's
                 to that dataset using the PRIVATE BindDataset Method.                                                                        
        @param phDataset The handle of the Business Entity dataset 
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeDataAccess (phDataset AS HANDLE):
        SUPER (INPUT phDataset).
        
        BindDataset (DATASET-HANDLE phDataset BIND) .
        
        /* Fields that are not assigned to the database record when a new record is created. */
        /* THIS-OBJECT:AssignSkipList = "<key fields>":U. */
        
        
        /* Mike Fechner, Consultingwerk Ltd. 01.07.2014
           SCL-334: By default, prepare queries of joined data source 
                    queries. This behavior is the new default, and should
                    only be set to FALSE, when customers are already manipulating
                    the data-source query in code (e.g. QUERY-PREPARE in a BEFORE-FILL
                    call back) */
        THIS-OBJECT:PrepareJoinedChildTableQueries = TRUE . 
        
        /* Allows to force applying the Source Default Query to child tables
           even when no filter expression was provided by the consumer */
        THIS-OBJECT:ForceApplyQueryOnChildTables = TRUE .  
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
        Purpose: Attaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID AttachDataSources ():
        
        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsEmployee:HANDLE, FALSE) .
        
        @AttachDataSourcesStart.
        this-object:AttachDataSource (buffer eEmployee:handle,
                                      data-source src_Employee:handle, "
                                      EmpNum,Employee.EmpNum,
                                      LastName,Employee.LastName,
                                      FirstName,Employee.FirstName,
                                      Address,Employee.Address,
                                      Address2,Employee.Address2,
                                      City,Employee.City,
                                      State,Employee.State,
                                      PostalCode,Employee.PostalCode,
                                      HomePhone,Employee.HomePhone,
                                      WorkPhone,Employee.WorkPhone,
                                      DeptCode,Employee.DeptCode,
                                      Position,Employee.Position,
                                      Birthdate,Employee.Birthdate,
                                      StartDate,Employee.StartDate,
                                      VacationDaysLeft,Employee.VacationDaysLeft,
                                      SickDaysLeft,Employee.SickDaysLeft":u) .
        this-object:AttachDataSource (buffer eVacation:handle,
                                      data-source src_Vacation:handle, "
                                      EmpNum,Vacation.EmpNum,
                                      StartDate,Vacation.StartDate,
                                      EndDate,Vacation.EndDate":u) .
        @AttachDataSourcesEnd.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Do nothing, just receive the parameter and bind to the received 
                 Dataset reference                                                                    
        Notes:   Invoked from the class constructor   
        @param dsEmployee DATASET to bind to                                                                     
    ------------------------------------------------------------------------------*/
    METHOD PRIVATE VOID BindDataset (DATASET dsEmployee BIND):
        /* NOOP */
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: TO-DO: Subscribe to ProDataset Event Handlers using SET-CALLBACK
                 as needed                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData, note that the callback methods need to be 
                 PUBLIC and need to have the Dataset defined as an INPUT Parameter.
                 Errors thrown from or raised in the FILL call-back methods of the 
                 DataAccess class (SET-CALLBACK) will stop the Dataset from getting 
                 filled / filled further. However errors thrown from the call-back 
                 methods are not thrown from the FILL() method further up into a 
                 catch block or to the client.  
                 See http://knowledgebase.progress.com/articles/Article/P188375
        Sample:  BUFFER eCustomer:SET-CALLBACK (Consultingwerk.DatasetBufferCallbackEnum:AfterFill,
                                                "eCustomerAfterFill":U) .                 
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DefineReadEvents ():
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Detaches the DATA-SOURCE objects to the ProDataset Buffers                                                                      
        Notes:   Overrides ABSTRACT method in Consultingwerk.OERA.DataAccess,
                 Invoked in FetchData and SaveChanges
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PROTECTED VOID DetachDataSources ():

        Consultingwerk.Util.DatasetHelper:SetTrackingChanges (DATASET dsEmployee:HANDLE, FALSE) .
    
        @DetachDataSourcesStart.
        buffer eEmployee:detach-data-source () .
        buffer eVacation:detach-data-source () .
        @DetachDataSourcesEnd.
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the database field name matching a temp-table field name
                 contained in a consumers query string (query string vs. temp-table
                 definition) 
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of 
                 DataAccess:FetchData () query preparation                        
                 TO-DO: Provide code for alternative mapping                                             
        @param pcTable The temp table name to return the source (database table) field name for
        @param pcColumn The temp table column name to return the source (database table) field name for             
        @return The database field name mapped to the passed in temp-table field
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceColumn (pcTable AS CHARACTER, pcColumn AS CHARACTER):

        DEFINE VARIABLE cMap  AS CHARACTER NO-UNDO.
        DEFINE VARIABLE iPos  AS INTEGER   NO-UNDO .
        
        @SourceColumnCaseBlock.
        CASE pcTable:
            when "eEmployee":u then
                cMap = buffer eEmployee:data-source-complete-map . 
            when "eVacation":u then
                cMap = buffer eVacation:data-source-complete-map . 

        END CASE .
     
        ASSIGN iPos = LOOKUP(pcColumn, cMap) .
        
        IF iPos MODULO 2 = 1 THEN  
            RETURN ENTRY(LOOKUP(pcColumn,cMap) + 1,cMap).    
        ELSE 
            RETURN "":U . 

    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Returns the base query string used to retrieve data for the temp
                 tables. This query string will be appended by the query provided by
                 the consumer (FetchDataRequest object).                                                                      
        Notes:   Call-back used by Consultingwerk.OERA.Query.DSQueryString (part of 
                 DataAccess:FetchData () query preparation                        
                 TO-DO: Provide code to return the DATA-SOURCE root query string                                             
        @param pcTable The temp table name to return the source default (database) query string for
        @return The base query string used to retrieve data for the given temp-table
    ------------------------------------------------------------------------------*/
    METHOD OVERRIDE PUBLIC CHARACTER SourceDefaultQuery (pcTable AS CHARACTER):
        @SourceDefaultQueryCaseBlock.
        CASE pcTable:
            when "eEmployee":u then
                return "for each Employee indexed-reposition":u. 
            when "eVacation":u then
                return "for each Vacation indexed-reposition":u. 

        END CASE . 
        
    END METHOD.

    /*------------------------------------------------------------------------------
        Purpose: Activates at eEmployeeeVacationRelation DATA-RELATION
        Notes:   
    ------------------------------------------------------------------------------*/
    method protected void ActivateRelationeEmployeeeVacationRelation ():
        this-object:ActivateRelations ("eEmployeeeVacationRelation":u).
    end method.

END CLASS.
