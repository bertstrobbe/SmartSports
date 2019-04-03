/*------------------------------------------------------------------------
    File        : EmployeeForm
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 15:04:38
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING be.cce.dotnet.SmartSports.Employee.* FROM PROPATH .  
USING Consultingwerk.SmartComponents.Base.* FROM PROPATH .
USING Consultingwerk.Util.*                 FROM PROPATH .
USING Progress.Lang.*                       FROM PROPATH .
USING Consultingwerk.SmartComponents.Enum.FindRowWhereModeEnum FROM PROPATH.
USING Consultingwerk.OERA.Exceptions.NotFoundException FROM PROPATH.

CLASS be.cce.dotnet.SmartSports.Employee.EmployeeForm INHERITS SmartWindowForm: 

    DEFINE PRIVATE VARIABLE employeeViewerControl1 AS be.cce.dotnet.SmartSports.Employee.EmployeeViewerControl NO-UNDO.
    DEFINE PRIVATE VARIABLE m_EmployeeForm_Toolbars_Dock_Area_Top AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_EmployeeForm_Toolbars_Dock_Area_Right AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_EmployeeForm_Toolbars_Dock_Area_Left AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
    DEFINE PRIVATE VARIABLE m_EmployeeForm_Toolbars_Dock_Area_Bottom AS Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea NO-UNDO.
	DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource3 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDataBrowser1 AS Consultingwerk.SmartComponents.Implementation.SmartDataBrowser NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    DEFINE PRIVATE VARIABLE smartBusinessEntityAdapter1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityAdapter NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDatasetChildAdapter1 AS Consultingwerk.SmartComponents.Implementation.SmartDatasetChildAdapter NO-UNDO.
    DEFINE PRIVATE VARIABLE smartDataBrowser2 AS Consultingwerk.SmartComponents.Implementation.SmartDataBrowser NO-UNDO.
    DEFINE PRIVATE VARIABLE smartToolbarController1 AS Consultingwerk.SmartComponents.Implementation.SmartToolbarController NO-UNDO.
    DEFINE PRIVATE VARIABLE EmployeeForm_Fill_Panel AS Infragistics.Win.Misc.UltraPanel NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraSplitter1 AS Infragistics.Win.Misc.UltraSplitter NO-UNDO.
    DEFINE PRIVATE VARIABLE ultraSplitter2 AS Infragistics.Win.Misc.UltraSplitter NO-UNDO.
    
    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeForm class                                                                        
        Notes:                                                                        
    ------------------------------------------------------------------------------*/
	CONSTRUCTOR PUBLIC EmployeeForm ():
		
        SUPER().
        InitializeComponent().
        
        &IF NOT PROVERSION BEGINS "10.2":U AND NOT PROVERSION BEGINS "11.0" &THEN
        THIS-OBJECT:ComponentsCollection:Add (THIS-OBJECT:components).
        &ENDIF
        
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

	END CONSTRUCTOR.
	
    /**
     * Purpose: Initializes the Visual Design
     * Notes:
     */
    @InitializeComponent.
	METHOD PRIVATE VOID InitializeComponent ():
		
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:components = NEW System.ComponentModel.Container().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool1 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool1 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("Exit").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool2 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool2 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool3 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool3 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool4 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool4 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool5 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool5 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool6 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool6 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool7 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool7 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ribbonTab1 AS Infragistics.Win.UltraWinToolbars.RibbonTab NO-UNDO.
        ribbonTab1 = NEW Infragistics.Win.UltraWinToolbars.RibbonTab("start").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ribbonGroup1 AS Infragistics.Win.UltraWinToolbars.RibbonGroup NO-UNDO.
        ribbonGroup1 = NEW Infragistics.Win.UltraWinToolbars.RibbonGroup("navigation").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool8 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool8 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool9 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool9 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool10 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool10 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool11 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool11 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ribbonGroup2 AS Infragistics.Win.UltraWinToolbars.RibbonGroup NO-UNDO.
        ribbonGroup2 = NEW Infragistics.Win.UltraWinToolbars.RibbonGroup("maintenance").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool12 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool12 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool13 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool13 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool14 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool14 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool15 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool15 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool16 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool16 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool17 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool17 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ribbonGroup3 AS Infragistics.Win.UltraWinToolbars.RibbonGroup NO-UNDO.
        ribbonGroup3 = NEW Infragistics.Win.UltraWinToolbars.RibbonGroup("ribbonGroup1").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool18 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool18 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("FilterGe50").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool48 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool48 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("FetchAll").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool20 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool20 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool21 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool21 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool22 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool22 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraToolbar1 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar1 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("NavigationToolbar").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool23 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool23 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool24 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool24 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool25 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool25 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool26 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool26 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraToolbar2 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar2 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("TableIOToolbar").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool27 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool27 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool28 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool28 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool29 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool29 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool30 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool30 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool31 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool31 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool32 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool32 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraToolbar3 AS Infragistics.Win.UltraWinToolbars.UltraToolbar NO-UNDO.
        ultraToolbar3 = NEW Infragistics.Win.UltraWinToolbars.UltraToolbar("TransactionToolbar").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool33 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool33 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionCommit").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool34 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool34 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionUndo").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool35 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool35 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationFirst").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance25 AS Infragistics.Win.Appearance NO-UNDO.
        appearance25 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE resources AS Progress.Util.ResourceManager NO-UNDO.
        resources = NEW Progress.Util.ResourceManager("be.cce.dotnet.SmartSports.Employee.EmployeeForm").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool36 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool36 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationPrev").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance26 AS Infragistics.Win.Appearance NO-UNDO.
        appearance26 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool37 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool37 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationNext").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance27 AS Infragistics.Win.Appearance NO-UNDO.
        appearance27 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool38 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool38 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("NavigationLast").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool39 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool39 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOAdd").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool40 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool40 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCopy").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool41 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool41 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOUpdate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool42 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool42 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOSave").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool43 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool43 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIOCancel").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool44 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool44 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TableIODelete").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool45 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool45 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("Exit").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool46 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool46 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionCommit").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool47 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool47 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("TransactionUndo").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool19 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool19 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("FilterGe50").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE buttonTool49 AS Infragistics.Win.UltraWinToolbars.ButtonTool NO-UNDO.
        buttonTool49 = NEW Infragistics.Win.UltraWinToolbars.ButtonTool("FetchAll").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance13 AS Infragistics.Win.Appearance NO-UNDO.
        appearance13 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridBand2 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
        ultraGridBand2 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("eEmployee", -1).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn1 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn1 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("EmpNum").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn2 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn2 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("LastName").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn3 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn3 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("FirstName").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn4 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn4 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Address").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn5 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn5 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Address2").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn6 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn6 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("City").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn7 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn7 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("State").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn8 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn8 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("PostalCode").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn9 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn9 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("HomePhone").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn10 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn10 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("WorkPhone").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn11 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn11 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("DeptCode").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn12 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn12 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Position").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn13 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn13 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("Birthdate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn14 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn14 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("StartDate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn15 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn15 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("VacationDaysLeft").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn16 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn16 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("SickDaysLeft").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance14 AS Infragistics.Win.Appearance NO-UNDO.
        appearance14 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance15 AS Infragistics.Win.Appearance NO-UNDO.
        appearance15 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance16 AS Infragistics.Win.Appearance NO-UNDO.
        appearance16 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance17 AS Infragistics.Win.Appearance NO-UNDO.
        appearance17 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance18 AS Infragistics.Win.Appearance NO-UNDO.
        appearance18 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance19 AS Infragistics.Win.Appearance NO-UNDO.
        appearance19 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance20 AS Infragistics.Win.Appearance NO-UNDO.
        appearance20 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance21 AS Infragistics.Win.Appearance NO-UNDO.
        appearance21 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance22 AS Infragistics.Win.Appearance NO-UNDO.
        appearance22 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance23 AS Infragistics.Win.Appearance NO-UNDO.
        appearance23 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance24 AS Infragistics.Win.Appearance NO-UNDO.
        appearance24 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc2 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc2 = NEW Progress.Data.TableDesc("eEmployee").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
        appearance1 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridBand1 AS Infragistics.Win.UltraWinGrid.UltraGridBand NO-UNDO.
        ultraGridBand1 = NEW Infragistics.Win.UltraWinGrid.UltraGridBand("eVacation", -1).
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn17 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn17 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("EmpNum").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn18 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn18 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("StartDate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE ultraGridColumn19 AS Infragistics.Win.UltraWinGrid.UltraGridColumn NO-UNDO.
        ultraGridColumn19 = NEW Infragistics.Win.UltraWinGrid.UltraGridColumn("EndDate").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance2 AS Infragistics.Win.Appearance NO-UNDO.
        appearance2 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance3 AS Infragistics.Win.Appearance NO-UNDO.
        appearance3 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance4 AS Infragistics.Win.Appearance NO-UNDO.
        appearance4 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance5 AS Infragistics.Win.Appearance NO-UNDO.
        appearance5 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance6 AS Infragistics.Win.Appearance NO-UNDO.
        appearance6 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance7 AS Infragistics.Win.Appearance NO-UNDO.
        appearance7 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance8 AS Infragistics.Win.Appearance NO-UNDO.
        appearance8 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance9 AS Infragistics.Win.Appearance NO-UNDO.
        appearance9 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance10 AS Infragistics.Win.Appearance NO-UNDO.
        appearance10 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance11 AS Infragistics.Win.Appearance NO-UNDO.
        appearance11 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance12 AS Infragistics.Win.Appearance NO-UNDO.
        appearance12 = NEW Infragistics.Win.Appearance().
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("eVacation").
        THIS-OBJECT:smartToolbarController1 = NEW Consultingwerk.SmartComponents.Implementation.SmartToolbarController(THIS-OBJECT:components).
        THIS-OBJECT:EmployeeForm_Fill_Panel = NEW Infragistics.Win.Misc.UltraPanel().
        THIS-OBJECT:employeeViewerControl1 = NEW be.cce.dotnet.SmartSports.Employee.EmployeeViewerControl().
        THIS-OBJECT:smartBusinessEntityAdapter1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityAdapter(THIS-OBJECT:components).
        THIS-OBJECT:ultraSplitter1 = NEW Infragistics.Win.Misc.UltraSplitter().
        THIS-OBJECT:smartDataBrowser1 = NEW Consultingwerk.SmartComponents.Implementation.SmartDataBrowser().
        THIS-OBJECT:smartBusinessEntityBindingSource1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom = NEW Infragistics.Win.UltraWinToolbars.UltraToolbarsDockArea().
        THIS-OBJECT:smartDataBrowser2 = NEW Consultingwerk.SmartComponents.Implementation.SmartDataBrowser().
        THIS-OBJECT:smartDatasetChildAdapter1 = NEW Consultingwerk.SmartComponents.Implementation.SmartDatasetChildAdapter(THIS-OBJECT:components).
        THIS-OBJECT:smartBusinessEntityBindingSource3 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:ultraSplitter2 = NEW Infragistics.Win.Misc.UltraSplitter().
        CAST(THIS-OBJECT:smartToolbarController1, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:SuspendLayout().
        THIS-OBJECT:EmployeeForm_Fill_Panel:SuspendLayout().
        CAST(THIS-OBJECT:employeeViewerControl1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityAdapter1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartDataBrowser1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartDataBrowser2, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartDatasetChildAdapter1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource3, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* smartToolbarController1 */
        /*  */
        THIS-OBJECT:smartToolbarController1:DesignerFlags = 1.
        THIS-OBJECT:smartToolbarController1:DockWithinContainer = THIS-OBJECT.
        THIS-OBJECT:smartToolbarController1:DockWithinContainerBaseType = Progress.Util.TypeHelper:GetType("Consultingwerk.SmartComponents.Base.SmartWindowForm").
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 1 NO-UNDO.
        arrayvar0[1] = buttonTool1.
        THIS-OBJECT:smartToolbarController1:Ribbon:ApplicationMenu:FooterToolbar:NonInheritedTools:AddRange(arrayvar0).
        buttonTool5:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar1 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar1[1] = buttonTool2.
        arrayvar1[2] = buttonTool3.
        arrayvar1[3] = buttonTool4.
        arrayvar1[4] = buttonTool5.
        arrayvar1[5] = buttonTool6.
        arrayvar1[6] = buttonTool7.
        THIS-OBJECT:smartToolbarController1:Ribbon:ApplicationMenu:ToolAreaLeft:NonInheritedTools:AddRange(arrayvar1).
        ribbonTab1:Caption = "Start".
        ribbonGroup1:Caption = "Navigation".
        buttonTool8:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool8:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool9:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool9:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool10:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool10:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool11:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool11:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar2 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 4 NO-UNDO.
        arrayvar2[1] = buttonTool8.
        arrayvar2[2] = buttonTool9.
        arrayvar2[3] = buttonTool10.
        arrayvar2[4] = buttonTool11.
        ribbonGroup1:Tools:AddRange(arrayvar2).
        ribbonGroup2:Caption = "Maintenance".
        buttonTool12:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool12:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool13:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool13:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool14:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool14:InstanceProps:PreferredSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:Large.
        buttonTool15:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool16:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        buttonTool17:InstanceProps:MinimumSizeOnRibbon = Infragistics.Win.UltraWinToolbars.RibbonToolSize:ImageOnly.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar3 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar3[1] = buttonTool12.
        arrayvar3[2] = buttonTool13.
        arrayvar3[3] = buttonTool14.
        arrayvar3[4] = buttonTool15.
        arrayvar3[5] = buttonTool16.
        arrayvar3[6] = buttonTool17.
        ribbonGroup2:Tools:AddRange(arrayvar3).
        ribbonGroup3:Caption = "ribbonGroup1".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar4 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 2 NO-UNDO.
        arrayvar4[1] = buttonTool18.
        arrayvar4[2] = buttonTool48.
        ribbonGroup3:Tools:AddRange(arrayvar4).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar5 AS Infragistics.Win.UltraWinToolbars.RibbonGroup EXTENT 3 NO-UNDO.
        arrayvar5[1] = ribbonGroup1.
        arrayvar5[2] = ribbonGroup2.
        arrayvar5[3] = ribbonGroup3.
        ribbonTab1:Groups:AddRange(arrayvar5).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar6 AS Infragistics.Win.UltraWinToolbars.RibbonTab EXTENT 1 NO-UNDO.
        arrayvar6[1] = ribbonTab1.
        THIS-OBJECT:smartToolbarController1:Ribbon:NonInheritedRibbonTabs:AddRange(arrayvar6).
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar7 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 3 NO-UNDO.
        arrayvar7[1] = buttonTool20.
        arrayvar7[2] = buttonTool21.
        arrayvar7[3] = buttonTool22.
        THIS-OBJECT:smartToolbarController1:Ribbon:QuickAccessToolbar:NonInheritedTools:AddRange(arrayvar7).
        THIS-OBJECT:smartToolbarController1:Ribbon:Visible = TRUE.
        THIS-OBJECT:smartToolbarController1:ShowFullMenusDelay = 500.
        THIS-OBJECT:smartToolbarController1:Style = Infragistics.Win.UltraWinToolbars.ToolbarStyle:Office2010.
        ultraToolbar1:DockedColumn = 0.
        ultraToolbar1:DockedRow = 0.
        buttonTool23:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar8 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 4 NO-UNDO.
        arrayvar8[1] = buttonTool23.
        arrayvar8[2] = buttonTool24.
        arrayvar8[3] = buttonTool25.
        arrayvar8[4] = buttonTool26.
        ultraToolbar1:NonInheritedTools:AddRange(arrayvar8).
        ultraToolbar1:Text = "Navigation Toolbar".
        ultraToolbar2:DockedColumn = 0.
        ultraToolbar2:DockedRow = 1.
        buttonTool27:InstanceProps:IsFirstInGroup = TRUE.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar9 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 6 NO-UNDO.
        arrayvar9[1] = buttonTool27.
        arrayvar9[2] = buttonTool28.
        arrayvar9[3] = buttonTool29.
        arrayvar9[4] = buttonTool30.
        arrayvar9[5] = buttonTool31.
        arrayvar9[6] = buttonTool32.
        ultraToolbar2:NonInheritedTools:AddRange(arrayvar9).
        ultraToolbar2:Text = "TableIO Toolbar".
        ultraToolbar3:DockedColumn = 1.
        ultraToolbar3:DockedRow = 1.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar10 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 2 NO-UNDO.
        arrayvar10[1] = buttonTool33.
        arrayvar10[2] = buttonTool34.
        ultraToolbar3:NonInheritedTools:AddRange(arrayvar10).
        ultraToolbar3:Text = "Transaction Toolbar".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar11 AS Infragistics.Win.UltraWinToolbars.UltraToolbar EXTENT 3 NO-UNDO.
        arrayvar11[1] = ultraToolbar1.
        arrayvar11[2] = ultraToolbar2.
        arrayvar11[3] = ultraToolbar3.
        THIS-OBJECT:smartToolbarController1:Toolbars:AddRange(arrayvar11).
        appearance25:Image = CAST(resources:GetObject("appearance25.Image"), System.Object).
        buttonTool35:SharedPropsInternal:AppearancesSmall:Appearance = appearance25.
        buttonTool35:SharedPropsInternal:Caption = "First record".
        buttonTool35:SharedPropsInternal:CustomizerCaption = "First".
        buttonTool35:SharedPropsInternal:Enabled = FALSE.
        buttonTool35:SharedPropsInternal:ToolTipText = "First record".
        appearance26:Image = CAST(resources:GetObject("appearance26.Image"), System.Object).
        buttonTool36:SharedPropsInternal:AppearancesSmall:Appearance = appearance26.
        buttonTool36:SharedPropsInternal:Caption = "Previous record".
        buttonTool36:SharedPropsInternal:CustomizerCaption = "Previous".
        buttonTool36:SharedPropsInternal:Enabled = FALSE.
        buttonTool36:SharedPropsInternal:ToolTipText = "Previous record".
        appearance27:Image = CAST(resources:GetObject("appearance27.Image"), System.Object).
        buttonTool37:SharedPropsInternal:AppearancesSmall:Appearance = appearance27.
        buttonTool37:SharedPropsInternal:Caption = "Next record".
        buttonTool37:SharedPropsInternal:CustomizerCaption = "Next".
        buttonTool37:SharedPropsInternal:Enabled = FALSE.
        buttonTool37:SharedPropsInternal:ToolTipText = "Next record".
        buttonTool38:SharedPropsInternal:Caption = "Last record".
        buttonTool38:SharedPropsInternal:CustomizerCaption = "Last".
        buttonTool38:SharedPropsInternal:Enabled = FALSE.
        buttonTool38:SharedPropsInternal:ToolTipText = "Last record".
        buttonTool39:SharedPropsInternal:Caption = "Add record".
        buttonTool39:SharedPropsInternal:CustomizerCaption = "Add".
        buttonTool39:SharedPropsInternal:Enabled = FALSE.
        buttonTool39:SharedPropsInternal:ToolTipText = "Add record".
        buttonTool40:SharedPropsInternal:Caption = "Copy record".
        buttonTool40:SharedPropsInternal:CustomizerCaption = "Copy".
        buttonTool40:SharedPropsInternal:Enabled = FALSE.
        buttonTool40:SharedPropsInternal:ToolTipText = "Copy record".
        buttonTool41:SharedPropsInternal:Caption = "Update record".
        buttonTool41:SharedPropsInternal:CustomizerCaption = "Update".
        buttonTool41:SharedPropsInternal:Enabled = FALSE.
        buttonTool41:SharedPropsInternal:ToolTipText = "Update record".
        buttonTool42:SharedPropsInternal:Caption = "Save changes".
        buttonTool42:SharedPropsInternal:CustomizerCaption = "Save".
        buttonTool42:SharedPropsInternal:Enabled = FALSE.
        buttonTool42:SharedPropsInternal:ToolTipText = "Save changes".
        buttonTool43:SharedPropsInternal:Caption = "Cancel update".
        buttonTool43:SharedPropsInternal:CustomizerCaption = "Cancel".
        buttonTool43:SharedPropsInternal:Enabled = FALSE.
        buttonTool43:SharedPropsInternal:ToolTipText = "Cancel update".
        buttonTool44:SharedPropsInternal:Caption = "Delete record".
        buttonTool44:SharedPropsInternal:CustomizerCaption = "Delete".
        buttonTool44:SharedPropsInternal:Enabled = FALSE.
        buttonTool44:SharedPropsInternal:ToolTipText = "Delete record".
        buttonTool45:SharedPropsInternal:Caption = "&Exit".
        buttonTool45:SharedPropsInternal:DisplayStyle = Infragistics.Win.UltraWinToolbars.ToolDisplayStyle:ImageAndText.
        buttonTool46:SharedPropsInternal:Caption = "Commit".
        buttonTool46:SharedPropsInternal:CustomizerCaption = "Commit".
        buttonTool46:SharedPropsInternal:Enabled = FALSE.
        buttonTool46:SharedPropsInternal:ToolTipText = "Commit transaction".
        buttonTool47:SharedPropsInternal:Caption = "Revert".
        buttonTool47:SharedPropsInternal:CustomizerCaption = "Revert".
        buttonTool47:SharedPropsInternal:Enabled = FALSE.
        buttonTool47:SharedPropsInternal:ToolTipText = "Revert transaction".
        buttonTool19:SharedPropsInternal:Caption = "FilterGe50".
        buttonTool49:SharedPropsInternal:Caption = "FetchAll".
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar12 AS Infragistics.Win.UltraWinToolbars.ToolBase EXTENT 15 NO-UNDO.
        arrayvar12[1] = buttonTool35.
        arrayvar12[2] = buttonTool36.
        arrayvar12[3] = buttonTool37.
        arrayvar12[4] = buttonTool38.
        arrayvar12[5] = buttonTool39.
        arrayvar12[6] = buttonTool40.
        arrayvar12[7] = buttonTool41.
        arrayvar12[8] = buttonTool42.
        arrayvar12[9] = buttonTool43.
        arrayvar12[10] = buttonTool44.
        arrayvar12[11] = buttonTool45.
        arrayvar12[12] = buttonTool46.
        arrayvar12[13] = buttonTool47.
        arrayvar12[14] = buttonTool19.
        arrayvar12[15] = buttonTool49.
        THIS-OBJECT:smartToolbarController1:Tools:AddRange(arrayvar12).
        THIS-OBJECT:smartToolbarController1:ToolClick:Subscribe(THIS-OBJECT:smartToolbarController1_ToolClick).
        /*  */
        /* EmployeeForm_Fill_Panel */
        /*  */
        /*  */
        /* EmployeeForm_Fill_Panel.ClientArea */
        /*  */
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:ultraSplitter2).
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:smartDataBrowser2).
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:employeeViewerControl1).
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:ultraSplitter1).
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:Controls:Add(THIS-OBJECT:smartDataBrowser1).
        THIS-OBJECT:EmployeeForm_Fill_Panel:Cursor = System.Windows.Forms.Cursors:Default.
        THIS-OBJECT:EmployeeForm_Fill_Panel:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:EmployeeForm_Fill_Panel:Location = NEW System.Drawing.Point(8, 151).
        THIS-OBJECT:EmployeeForm_Fill_Panel:Name = "EmployeeForm_Fill_Panel".
        THIS-OBJECT:EmployeeForm_Fill_Panel:Size = NEW System.Drawing.Size(966, 566).
        THIS-OBJECT:EmployeeForm_Fill_Panel:TabIndex = 0.
        /*  */
        /* employeeViewerControl1 */
        /*  */
        THIS-OBJECT:employeeViewerControl1:AutoScroll = TRUE.
        THIS-OBJECT:employeeViewerControl1:Dock = System.Windows.Forms.DockStyle:Fill.
        THIS-OBJECT:employeeViewerControl1:FocusControlOnAdd = ?.
        THIS-OBJECT:employeeViewerControl1:FocusControlOnUpdate = ?.
        THIS-OBJECT:employeeViewerControl1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:employeeViewerControl1:LinkGroupAssignSource = ?.
        THIS-OBJECT:employeeViewerControl1:LinkTableIOSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:employeeViewerControl1:Location = NEW System.Drawing.Point(313, 0).
        THIS-OBJECT:employeeViewerControl1:Name = "employeeViewerControl1".
        THIS-OBJECT:employeeViewerControl1:Size = NEW System.Drawing.Size(653, 566).
        THIS-OBJECT:employeeViewerControl1:TabIndex = 5.
        /*  */
        /* smartBusinessEntityAdapter1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityAdapter1:AppServerPartition = "".
        THIS-OBJECT:smartBusinessEntityAdapter1:BindingSourceExcludeFields = "".
        THIS-OBJECT:smartBusinessEntityAdapter1:BindingSourceIncludeFields = "*".
        THIS-OBJECT:smartBusinessEntityAdapter1:DatasetControllerType = "be.cce.dotnet.SmartSports.Employee.EmployeeDatasetController".
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityName = "be.cce.server.SmartSports.Employee.EmployeeBusinessEntity".
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityTable = "eEmployee".
        THIS-OBJECT:smartBusinessEntityAdapter1:EntityView = "eVacation".
        THIS-OBJECT:smartBusinessEntityAdapter1:FetchLastOnServer = TRUE.
        THIS-OBJECT:smartBusinessEntityAdapter1:ForeignFields = "".
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkCommitSource = ?.
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkDataSource = ?.
        THIS-OBJECT:smartBusinessEntityAdapter1:LinkNavigationSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:smartBusinessEntityAdapter1:NonUpdatableColumns = "".
        THIS-OBJECT:smartBusinessEntityAdapter1:QuerySort = "".
        THIS-OBJECT:smartBusinessEntityAdapter1:SmartDataSourceActive = TRUE.
        THIS-OBJECT:smartBusinessEntityAdapter1:ThrowErrorsFromRetrieveData = FALSE.
        /*  */
        /* ultraSplitter1 */
        /*  */
        THIS-OBJECT:ultraSplitter1:Location = NEW System.Drawing.Point(307, 0).
        THIS-OBJECT:ultraSplitter1:Name = "ultraSplitter1".
        THIS-OBJECT:ultraSplitter1:RestoreExtent = 307.
        THIS-OBJECT:ultraSplitter1:Size = NEW System.Drawing.Size(6, 566).
        THIS-OBJECT:ultraSplitter1:TabIndex = 6.
        /*  */
        /* smartDataBrowser1 */
        /*  */
        THIS-OBJECT:smartDataBrowser1:DataSource = THIS-OBJECT:smartBusinessEntityBindingSource1.
        THIS-OBJECT:smartDataBrowser1:DeleteDataSourceOnFormClosed = TRUE.
        THIS-OBJECT:smartDataBrowser1:DeselectRowsOnActivate = TRUE.
        appearance13:BackColor = System.Drawing.SystemColors:Window.
        appearance13:BorderColor = System.Drawing.SystemColors:InactiveCaption.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Appearance = appearance13.
        ultraGridColumn1:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn1:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn1:Header:Caption = "Emp No ".
        ultraGridColumn1:Header:VisiblePosition = 0.
        ultraGridColumn2:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn2:Header:Caption = "Last Name ".
        ultraGridColumn2:Header:VisiblePosition = 1.
        ultraGridColumn3:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn3:Header:Caption = "First Name ".
        ultraGridColumn3:Header:VisiblePosition = 2.
        ultraGridColumn4:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn4:Header:Caption = "Address ".
        ultraGridColumn4:Header:VisiblePosition = 3.
        ultraGridColumn5:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn5:Header:Caption = "Address2 ".
        ultraGridColumn5:Header:VisiblePosition = 4.
        ultraGridColumn5:Hidden = TRUE.
        ultraGridColumn6:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn6:Header:Caption = "City ".
        ultraGridColumn6:Header:VisiblePosition = 5.
        ultraGridColumn7:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn7:Header:Caption = "State ".
        ultraGridColumn7:Header:VisiblePosition = 6.
        ultraGridColumn7:Hidden = TRUE.
        ultraGridColumn8:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn8:Header:Caption = "Postal Code ".
        ultraGridColumn8:Header:VisiblePosition = 7.
        ultraGridColumn8:Hidden = TRUE.
        ultraGridColumn9:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn9:Header:Caption = "Home Phone ".
        ultraGridColumn9:Header:VisiblePosition = 8.
        ultraGridColumn9:Hidden = TRUE.
        ultraGridColumn10:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn10:Header:Caption = "Work Phone ".
        ultraGridColumn10:Header:VisiblePosition = 9.
        ultraGridColumn11:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn11:Header:Caption = "Dept Code ".
        ultraGridColumn11:Header:VisiblePosition = 10.
        ultraGridColumn11:Hidden = TRUE.
        ultraGridColumn12:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn12:Header:Caption = "Position ".
        ultraGridColumn12:Header:VisiblePosition = 11.
        ultraGridColumn13:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn13:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn13:Header:Caption = "Birthdate ".
        ultraGridColumn13:Header:VisiblePosition = 12.
        ultraGridColumn13:Hidden = TRUE.
        ultraGridColumn14:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn14:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn14:Header:Caption = "Start Date ".
        ultraGridColumn14:Header:VisiblePosition = 13.
        ultraGridColumn14:Hidden = TRUE.
        ultraGridColumn15:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn15:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn15:Header:Caption = "Vacation Days Left ".
        ultraGridColumn15:Header:VisiblePosition = 14.
        ultraGridColumn16:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn16:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn16:Header:Caption = "Sick Days Left ".
        ultraGridColumn16:Header:VisiblePosition = 15.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar13 AS System.Object EXTENT 16 NO-UNDO.
        arrayvar13[1] = ultraGridColumn1.
        arrayvar13[2] = ultraGridColumn2.
        arrayvar13[3] = ultraGridColumn3.
        arrayvar13[4] = ultraGridColumn4.
        arrayvar13[5] = ultraGridColumn5.
        arrayvar13[6] = ultraGridColumn6.
        arrayvar13[7] = ultraGridColumn7.
        arrayvar13[8] = ultraGridColumn8.
        arrayvar13[9] = ultraGridColumn9.
        arrayvar13[10] = ultraGridColumn10.
        arrayvar13[11] = ultraGridColumn11.
        arrayvar13[12] = ultraGridColumn12.
        arrayvar13[13] = ultraGridColumn13.
        arrayvar13[14] = ultraGridColumn14.
        arrayvar13[15] = ultraGridColumn15.
        arrayvar13[16] = ultraGridColumn16.
        ultraGridBand2:Columns:AddRange(arrayvar13).
        ultraGridBand2:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        ultraGridBand2:Override:SelectTypeCell = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand2:Override:SelectTypeCol = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand2:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:BandsSerializer:Add(ultraGridBand2).
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:CaptionVisible = Infragistics.Win.DefaultableBoolean:False.
        appearance14:BackColor = System.Drawing.SystemColors:ActiveBorder.
        appearance14:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance14:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
        appearance14:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:Appearance = appearance14.
        appearance15:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:BandLabelAppearance = appearance15.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        appearance16:BackColor = System.Drawing.SystemColors:ControlLightLight.
        appearance16:BackColor2 = System.Drawing.SystemColors:Control.
        appearance16:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance16:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:GroupByBox:PromptAppearance = appearance16.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:MaxColScrollRegions = 1.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:MaxRowScrollRegions = 1.
        appearance17:BackColor = System.Drawing.SystemColors:Window.
        appearance17:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:ActiveCellAppearance = appearance17.
        appearance18:BackColor = System.Drawing.SystemColors:Highlight.
        appearance18:ForeColor = System.Drawing.SystemColors:HighlightText.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:ActiveRowAppearance = appearance18.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew:No.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:AllowUpdate = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:BorderStyleCell = Infragistics.Win.UIElementBorderStyle:Dotted.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:Dotted.
        appearance19:BackColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CardAreaAppearance = appearance19.
        appearance20:BorderColor = System.Drawing.Color:Silver.
        appearance20:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellAppearance = appearance20.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:RowSelect.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:CellPadding = 0.
        appearance21:BackColor = System.Drawing.SystemColors:Control.
        appearance21:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance21:BackGradientAlignment = Infragistics.Win.GradientAlignment:Element.
        appearance21:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance21:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:GroupByRowAppearance = appearance21.
        appearance22:TextHAlignAsString = "Left".
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderAppearance = appearance22.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:ExternalSortMulti.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:HeaderStyle = Infragistics.Win.HeaderStyle:WindowsXPCommand.
        appearance23:BackColor = System.Drawing.SystemColors:Window.
        appearance23:BorderColor = System.Drawing.Color:Silver.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:RowAppearance = appearance23.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        appearance24:BackColor = System.Drawing.SystemColors:ControlLight.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:Override:TemplateAddRowAppearance = appearance24.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
        THIS-OBJECT:smartDataBrowser1:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
        THIS-OBJECT:smartDataBrowser1:Dock = System.Windows.Forms.DockStyle:Left.
        THIS-OBJECT:smartDataBrowser1:Font = NEW System.Drawing.Font("Microsoft Sans Serif", Progress.Util.CastUtil:ToSingle(8.25), System.Drawing.FontStyle:Regular, System.Drawing.GraphicsUnit:Point, System.Convert:ToByte(0)).
        THIS-OBJECT:smartDataBrowser1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:smartDataBrowser1:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:smartDataBrowser1:Name = "smartDataBrowser1".
        THIS-OBJECT:smartDataBrowser1:SettingsKey = "d6cfc28c-1137-a7bd-5014-c535ecc72b44".
        THIS-OBJECT:smartDataBrowser1:Size = NEW System.Drawing.Size(307, 566).
        THIS-OBJECT:smartDataBrowser1:TabIndex = 5.
        THIS-OBJECT:smartDataBrowser1:Text = "smartDataBrowser1".
        /*  */
        /* smartBusinessEntityBindingSource1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource1:BindTo = "QUERY".
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityName = "be.cce.server.SmartSports.Employee.EmployeeBusinessEntity".
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityTable = "eEmployee".
        THIS-OBJECT:smartBusinessEntityBindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:NoLOBs = FALSE.
        tableDesc2:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar14 AS Progress.Data.ColumnPropDesc EXTENT 16 NO-UNDO.
        arrayvar14[1] = NEW Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER).
        arrayvar14[2] = NEW Progress.Data.ColumnPropDesc("LastName", "Last Name", Progress.Data.DataType:CHARACTER).
        arrayvar14[3] = NEW Progress.Data.ColumnPropDesc("FirstName", "First Name", Progress.Data.DataType:CHARACTER).
        arrayvar14[4] = NEW Progress.Data.ColumnPropDesc("Address", "Address", Progress.Data.DataType:CHARACTER).
        arrayvar14[5] = NEW Progress.Data.ColumnPropDesc("Address2", "Address2", Progress.Data.DataType:CHARACTER).
        arrayvar14[6] = NEW Progress.Data.ColumnPropDesc("City", "City", Progress.Data.DataType:CHARACTER).
        arrayvar14[7] = NEW Progress.Data.ColumnPropDesc("State", "State", Progress.Data.DataType:CHARACTER).
        arrayvar14[8] = NEW Progress.Data.ColumnPropDesc("PostalCode", "Postal Code", Progress.Data.DataType:CHARACTER).
        arrayvar14[9] = NEW Progress.Data.ColumnPropDesc("HomePhone", "Home Phone", Progress.Data.DataType:CHARACTER).
        arrayvar14[10] = NEW Progress.Data.ColumnPropDesc("WorkPhone", "Work Phone", Progress.Data.DataType:CHARACTER).
        arrayvar14[11] = NEW Progress.Data.ColumnPropDesc("DeptCode", "Dept Code", Progress.Data.DataType:CHARACTER).
        arrayvar14[12] = NEW Progress.Data.ColumnPropDesc("Position", "Position", Progress.Data.DataType:CHARACTER).
        arrayvar14[13] = NEW Progress.Data.ColumnPropDesc("Birthdate", "Birthdate", Progress.Data.DataType:DATE).
        arrayvar14[14] = NEW Progress.Data.ColumnPropDesc("StartDate", "Start Date", Progress.Data.DataType:DATE).
        arrayvar14[15] = NEW Progress.Data.ColumnPropDesc("VacationDaysLeft", "Vacation Days Left", Progress.Data.DataType:INTEGER).
        arrayvar14[16] = NEW Progress.Data.ColumnPropDesc("SickDaysLeft", "Sick Days Left", Progress.Data.DataType:INTEGER).
        tableDesc2:Columns = arrayvar14.
        THIS-OBJECT:smartBusinessEntityBindingSource1:TableSchema = tableDesc2.
        /*  */
        /* m_EmployeeForm_Toolbars_Dock_Area_Left */
        /*  */
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Left.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:Location = NEW System.Drawing.Point(0, 151).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:Name = "m_EmployeeForm_Toolbars_Dock_Area_Left".
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:Size = NEW System.Drawing.Size(8, 566).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_EmployeeForm_Toolbars_Dock_Area_Right */
        /*  */
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Right.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:Location = NEW System.Drawing.Point(974, 151).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:Name = "m_EmployeeForm_Toolbars_Dock_Area_Right".
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:Size = NEW System.Drawing.Size(8, 566).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_EmployeeForm_Toolbars_Dock_Area_Top */
        /*  */
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Top.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:Location = NEW System.Drawing.Point(0, 0).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:Name = "m_EmployeeForm_Toolbars_Dock_Area_Top".
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:Size = NEW System.Drawing.Size(982, 151).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* m_EmployeeForm_Toolbars_Dock_Area_Bottom */
        /*  */
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:AccessibleRole = System.Windows.Forms.AccessibleRole:Grouping.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:BackColor = System.Drawing.Color:FromArgb(System.Convert:ToInt32(System.Convert:ToByte(191)), System.Convert:ToInt32(System.Convert:ToByte(219)), System.Convert:ToInt32(System.Convert:ToByte(255))).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:DockedPosition = Infragistics.Win.UltraWinToolbars.DockedPosition:Bottom.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:InitialResizeAreaExtent = 8.
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:Location = NEW System.Drawing.Point(0, 717).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:Name = "m_EmployeeForm_Toolbars_Dock_Area_Bottom".
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:Size = NEW System.Drawing.Size(982, 8).
        THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom:ToolbarsManager = THIS-OBJECT:smartToolbarController1.
        /*  */
        /* smartDataBrowser2 */
        /*  */
        THIS-OBJECT:smartDataBrowser2:DataSource = THIS-OBJECT:smartBusinessEntityBindingSource3.
        THIS-OBJECT:smartDataBrowser2:DeleteDataSourceOnFormClosed = TRUE.
        THIS-OBJECT:smartDataBrowser2:DeselectRowsOnActivate = TRUE.
        appearance1:BackColor = System.Drawing.SystemColors:Window.
        appearance1:BorderColor = System.Drawing.SystemColors:InactiveCaption.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Appearance = appearance1.
        ultraGridColumn17:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn17:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn17:Header:Caption = "Emp No ".
        ultraGridColumn17:Header:VisiblePosition = 0.
        ultraGridColumn18:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn18:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn18:Header:Caption = "Start Date ".
        ultraGridColumn18:Header:VisiblePosition = 1.
        ultraGridColumn19:CellActivation = Infragistics.Win.UltraWinGrid.Activation:NoEdit.
        ultraGridColumn19:FilterOperatorDefaultValue = Infragistics.Win.UltraWinGrid.FilterOperatorDefaultValue:GreaterThanOrEqualTo.
        ultraGridColumn19:Header:Caption = "End Date ".
        ultraGridColumn19:Header:VisiblePosition = 2.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar15 AS System.Object EXTENT 3 NO-UNDO.
        arrayvar15[1] = ultraGridColumn17.
        arrayvar15[2] = ultraGridColumn18.
        arrayvar15[3] = ultraGridColumn19.
        ultraGridBand1:Columns:AddRange(arrayvar15).
        ultraGridBand1:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        ultraGridBand1:Override:SelectTypeCell = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand1:Override:SelectTypeCol = Infragistics.Win.UltraWinGrid.SelectType:None.
        ultraGridBand1:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:BandsSerializer:Add(ultraGridBand1).
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:CaptionVisible = Infragistics.Win.DefaultableBoolean:False.
        appearance2:BackColor = System.Drawing.SystemColors:ActiveBorder.
        appearance2:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance2:BackGradientStyle = Infragistics.Win.GradientStyle:Vertical.
        appearance2:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:Appearance = appearance2.
        appearance3:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:BandLabelAppearance = appearance3.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:BorderStyle = Infragistics.Win.UIElementBorderStyle:Solid.
        appearance4:BackColor = System.Drawing.SystemColors:ControlLightLight.
        appearance4:BackColor2 = System.Drawing.SystemColors:Control.
        appearance4:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance4:ForeColor = System.Drawing.SystemColors:GrayText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:GroupByBox:PromptAppearance = appearance4.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:MaxColScrollRegions = 1.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:MaxRowScrollRegions = 1.
        appearance5:BackColor = System.Drawing.SystemColors:Window.
        appearance5:ForeColor = System.Drawing.SystemColors:ControlText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:ActiveCellAppearance = appearance5.
        appearance6:BackColor = System.Drawing.SystemColors:Highlight.
        appearance6:ForeColor = System.Drawing.SystemColors:HighlightText.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:ActiveRowAppearance = appearance6.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew:No.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:AllowDelete = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:AllowUpdate = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:BorderStyleCell = Infragistics.Win.UIElementBorderStyle:Dotted.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:BorderStyleRow = Infragistics.Win.UIElementBorderStyle:Dotted.
        appearance7:BackColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CardAreaAppearance = appearance7.
        appearance8:BorderColor = System.Drawing.Color:Silver.
        appearance8:TextTrimming = Infragistics.Win.TextTrimming:EllipsisCharacter.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellAppearance = appearance8.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction:RowSelect.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:CellPadding = 0.
        appearance9:BackColor = System.Drawing.SystemColors:Control.
        appearance9:BackColor2 = System.Drawing.SystemColors:ControlDark.
        appearance9:BackGradientAlignment = Infragistics.Win.GradientAlignment:Element.
        appearance9:BackGradientStyle = Infragistics.Win.GradientStyle:Horizontal.
        appearance9:BorderColor = System.Drawing.SystemColors:Window.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:GroupByRowAppearance = appearance9.
        appearance10:TextHAlignAsString = "Left".
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderAppearance = appearance10.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction:ExternalSortMulti.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:HeaderStyle = Infragistics.Win.HeaderStyle:WindowsXPCommand.
        appearance11:BackColor = System.Drawing.SystemColors:Window.
        appearance11:BorderColor = System.Drawing.Color:Silver.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:RowAppearance = appearance11.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:RowSelectors = Infragistics.Win.DefaultableBoolean:False.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:SelectTypeRow = Infragistics.Win.UltraWinGrid.SelectType:SingleAutoDrag.
        appearance12:BackColor = System.Drawing.SystemColors:ControlLight.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:Override:TemplateAddRowAppearance = appearance12.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds:ScrollToFill.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle:Immediate.
        THIS-OBJECT:smartDataBrowser2:DisplayLayout:ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand:OutlookGroupBy.
        THIS-OBJECT:smartDataBrowser2:Dock = System.Windows.Forms.DockStyle:Bottom.
        THIS-OBJECT:smartDataBrowser2:LinkDataSource = THIS-OBJECT:smartDatasetChildAdapter1.
        THIS-OBJECT:smartDataBrowser2:Location = NEW System.Drawing.Point(313, 298).
        THIS-OBJECT:smartDataBrowser2:Name = "smartDataBrowser2".
        THIS-OBJECT:smartDataBrowser2:SettingsKey = "cc61973b-c182-d3a6-5014-1437400b44bc".
        THIS-OBJECT:smartDataBrowser2:Size = NEW System.Drawing.Size(653, 268).
        THIS-OBJECT:smartDataBrowser2:TabIndex = 7.
        THIS-OBJECT:smartDataBrowser2:Text = "smartDataBrowser2".
        /*  */
        /* smartDatasetChildAdapter1 */
        /*  */
        THIS-OBJECT:smartDatasetChildAdapter1:AppServerPartition = "".
        THIS-OBJECT:smartDatasetChildAdapter1:BindingSourceExcludeFields = "".
        THIS-OBJECT:smartDatasetChildAdapter1:BindingSourceIncludeFields = "*".
        THIS-OBJECT:smartDatasetChildAdapter1:EntityTable = "eVacation".
        THIS-OBJECT:smartDatasetChildAdapter1:ForeignFields = "".
        THIS-OBJECT:smartDatasetChildAdapter1:LinkDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:smartDatasetChildAdapter1:LinkGroupCreateSource = ?.
        THIS-OBJECT:smartDatasetChildAdapter1:LinkNavigationSource = ?.
        THIS-OBJECT:smartDatasetChildAdapter1:NonUpdatableColumns = "".
        THIS-OBJECT:smartDatasetChildAdapter1:QuerySort = "".
        THIS-OBJECT:smartDatasetChildAdapter1:SmartDataSourceActive = TRUE.
        THIS-OBJECT:smartDatasetChildAdapter1:ThrowErrorsFromRetrieveData = FALSE.
        /*  */
        /* smartBusinessEntityBindingSource3 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource3:BindTo = "QUERY".
        THIS-OBJECT:smartBusinessEntityBindingSource3:EntityName = "be.cce.server.SmartSports.Employee.EmployeeBusinessEntity".
        THIS-OBJECT:smartBusinessEntityBindingSource3:EntityTable = "eVacation".
        THIS-OBJECT:smartBusinessEntityBindingSource3:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource3:NoLOBs = FALSE.
        tableDesc1:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar16 AS Progress.Data.ColumnPropDesc EXTENT 3 NO-UNDO.
        arrayvar16[1] = NEW Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER).
        arrayvar16[2] = NEW Progress.Data.ColumnPropDesc("StartDate", "Start Date", Progress.Data.DataType:DATE).
        arrayvar16[3] = NEW Progress.Data.ColumnPropDesc("EndDate", "End Date", Progress.Data.DataType:DATE).
        tableDesc1:Columns = arrayvar16.
        THIS-OBJECT:smartBusinessEntityBindingSource3:TableSchema = tableDesc1.
        /*  */
        /* ultraSplitter2 */
        /*  */
        THIS-OBJECT:ultraSplitter2:BackColor = System.Drawing.SystemColors:Control.
        THIS-OBJECT:ultraSplitter2:Dock = System.Windows.Forms.DockStyle:Bottom.
        THIS-OBJECT:ultraSplitter2:Location = NEW System.Drawing.Point(313, 292).
        THIS-OBJECT:ultraSplitter2:Name = "ultraSplitter2".
        THIS-OBJECT:ultraSplitter2:RestoreExtent = 268.
        THIS-OBJECT:ultraSplitter2:Size = NEW System.Drawing.Size(653, 6).
        THIS-OBJECT:ultraSplitter2:TabIndex = 8.
        /*  */
        /* EmployeeForm */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(982, 725).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:EmployeeForm_Fill_Panel).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Left).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Right).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Bottom).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:m_EmployeeForm_Toolbars_Dock_Area_Top).
        THIS-OBJECT:Name = "EmployeeForm".
        THIS-OBJECT:PrimaryDataSource = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:PrimaryDataTarget = THIS-OBJECT:smartBusinessEntityAdapter1.
        THIS-OBJECT:PrimaryNavigationSource = THIS-OBJECT:smartToolbarController1.
        THIS-OBJECT:Text = "Employee Maintenance".
        THIS-OBJECT:WindowPositionRegistryKey = "EmployeeForm".
        CAST(THIS-OBJECT:smartToolbarController1, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:EmployeeForm_Fill_Panel:ClientArea:ResumeLayout(FALSE).
        THIS-OBJECT:EmployeeForm_Fill_Panel:ResumeLayout(FALSE).
        CAST(THIS-OBJECT:employeeViewerControl1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityAdapter1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartDataBrowser1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartDataBrowser2, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartDatasetChildAdapter1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource3, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
	END METHOD .

    /*------------------------------------------------------------------------------
        Purpose: Raises the Shown Event
        Notes:   
        @param e The System.EventArgs with the data for this event
    ------------------------------------------------------------------------------*/
	METHOD PROTECTED OVERRIDE VOID OnShown (e AS System.EventArgs):
		
		SUPER:OnShown (e) .

        Consultingwerk.Util.UserInterfaceHelper:ProcessEvents() .        



	END METHOD .

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID smartToolbarController1_ToolClick( INPUT sender AS System.Object, INPUT e AS Infragistics.Win.UltraWinToolbars.ToolClickEventArgs ):
        DEFINE VARIABLE lWhere AS CHARACTER NO-UNDO.
		
		CASE e:Tool:Key:
		    WHEN "FilterGe50"
		    THEN DO:
                lWhere = "where eEmployee.EmpNum ge 11".
    
                THIS-OBJECT:smartBusinessEntityAdapter1:ThrowErrorsFromRetrieveData = TRUE.
                THIS-OBJECT:smartBusinessEntityAdapter1:RetrieveDataOnChangeSortOrder = FALSE .
                THIS-OBJECT:smartBusinessEntityAdapter1:PrefetchOnFindRowWhere = 10.
                
                DO ON ERROR UNDO, THROW:
                    THIS-OBJECT:smartBusinessEntityAdapter1:FindRowWhere(lWhere,FindRowWhereModeEnum:FindOnServer).
    
                    CATCH err AS Progress.Lang.Error :
                        /* if no records found -> no error message */
                        IF TYPE-OF (err, NotFoundException)
                           OR err:GetMessage(1) BEGINS "No record is available"
                        THEN DO ON ERROR UNDO, THROW:
//                            THIS-OBJECT:smartBusinessEntityAdapter1:FindRowWhere("",FindRowWhereModeEnum:FindOnServer).
                            CATCH uncaught AS Progress.Lang.Error :
                                 /* swallow error */
                            END CATCH.
                        END.
                        ELSE Consultingwerk.Util.ErrorHelper:ShowErrorMessage(err).
                    END CATCH.
                END.		        
		    END.
		    WHEN "FetchAll"
		    THEN THIS-OBJECT:smartBusinessEntityAdapter1:RetrieveData () .
        END CASE.
        
	END METHOD.


END CLASS.
