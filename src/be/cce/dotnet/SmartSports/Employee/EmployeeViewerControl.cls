/*------------------------------------------------------------------------
    File        : EmployeeViewerControl
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Bert Strobbe
    Created     : 03.04.2019 15:01:13
    Notes       : 
  ----------------------------------------------------------------------*/

ROUTINE-LEVEL ON ERROR UNDO, THROW.

USING Consultingwerk.SmartComponents.Base.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Enum.*           FROM PROPATH .
USING Consultingwerk.SmartComponents.Implementation.* FROM PROPATH .
USING Consultingwerk.Util.*                           FROM PROPATH .
USING Progress.Lang.*                                 FROM PROPATH .

CLASS be.cce.dotnet.SmartSports.Employee.EmployeeViewerControl 
    INHERITS SmartViewerControl: 
    
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

    DEFINE PRIVATE VARIABLE smartBusinessEntityBindingSource1 AS Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource NO-UNDO.
    define private variable eEmployee_EmpNum_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_EmpNum as Infragistics.Win.UltraWinEditors.UltraNumericEditor no-undo.
    define private variable eEmployee_LastName_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_LastName as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
    define private variable eEmployee_FirstName_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_FirstName as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
    define private variable eEmployee_Address_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_Address as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
    define private variable eEmployee_City_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_City as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
    define private variable eEmployee_WorkPhone_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_WorkPhone as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.
    define private variable eEmployee_Position_Label as Infragistics.Win.Misc.UltraLabel no-undo.
    define private variable eEmployee_Position as Infragistics.Win.UltraWinEditors.UltraTextEditor no-undo.

    /*------------------------------------------------------------------------------
        Purpose: Constructor for the EmployeeViewerControl class
        Notes:   
    ------------------------------------------------------------------------------*/
    CONSTRUCTOR PUBLIC EmployeeViewerControl ():
                
        SUPER().
        InitializeComponent().
        
        &IF NOT PROVERSION BEGINS "10.2":U AND NOT PROVERSION BEGINS "11.0" &THEN
        THIS-OBJECT:ComponentsCollection:Add (THIS-OBJECT:components).
        &ENDIF
                
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
        DEFINE VARIABLE tableDesc1 AS Progress.Data.TableDesc NO-UNDO.
        tableDesc1 = NEW Progress.Data.TableDesc("eEmployee").
        @VisualDesigner.FormMember (NeedsInitialize="true").
        DEFINE VARIABLE appearance1 AS Infragistics.Win.Appearance NO-UNDO.
        appearance1 = NEW Infragistics.Win.Appearance().
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
        THIS-OBJECT:smartBusinessEntityBindingSource1 = NEW Consultingwerk.SmartComponents.Implementation.SmartBusinessEntityBindingSource(THIS-OBJECT:components).
        THIS-OBJECT:eEmployee_EmpNum_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_EmpNum = NEW Infragistics.Win.UltraWinEditors.UltraNumericEditor().
        THIS-OBJECT:eEmployee_LastName_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_LastName = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eEmployee_FirstName_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_FirstName = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eEmployee_Address_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_Address = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eEmployee_City_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_City = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eEmployee_WorkPhone_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_WorkPhone = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        THIS-OBJECT:eEmployee_Position_Label = NEW Infragistics.Win.Misc.UltraLabel().
        THIS-OBJECT:eEmployee_Position = NEW Infragistics.Win.UltraWinEditors.UltraTextEditor().
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_EmpNum, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_LastName, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_FirstName, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_Address, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_City, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_WorkPhone, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT:eEmployee_Position, System.ComponentModel.ISupportInitialize):BeginInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):BeginInit().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* smartBusinessEntityBindingSource1 */
        /*  */
        THIS-OBJECT:smartBusinessEntityBindingSource1:BindTo = "QUERY".
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityName = "be.cce.server.SmartSports.Employee.EmployeeBusinessEntity".
        THIS-OBJECT:smartBusinessEntityBindingSource1:EntityTable = "eEmployee".
        THIS-OBJECT:smartBusinessEntityBindingSource1:MaxDataGuess = 0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:NoLOBs = FALSE.
        tableDesc1:ChildTables = ?.
        @VisualDesigner.FormMember (NeedsInitialize="false", InitializeArray="true").
        DEFINE VARIABLE arrayvar0 AS Progress.Data.ColumnPropDesc EXTENT 16 NO-UNDO.
        arrayvar0[1] = NEW Progress.Data.ColumnPropDesc("EmpNum", "Emp No", Progress.Data.DataType:INTEGER).
        arrayvar0[2] = NEW Progress.Data.ColumnPropDesc("LastName", "Last Name", Progress.Data.DataType:CHARACTER).
        arrayvar0[3] = NEW Progress.Data.ColumnPropDesc("FirstName", "First Name", Progress.Data.DataType:CHARACTER).
        arrayvar0[4] = NEW Progress.Data.ColumnPropDesc("Address", "Address", Progress.Data.DataType:CHARACTER).
        arrayvar0[5] = NEW Progress.Data.ColumnPropDesc("Address2", "Address2", Progress.Data.DataType:CHARACTER).
        arrayvar0[6] = NEW Progress.Data.ColumnPropDesc("City", "City", Progress.Data.DataType:CHARACTER).
        arrayvar0[7] = NEW Progress.Data.ColumnPropDesc("State", "State", Progress.Data.DataType:CHARACTER).
        arrayvar0[8] = NEW Progress.Data.ColumnPropDesc("PostalCode", "Postal Code", Progress.Data.DataType:CHARACTER).
        arrayvar0[9] = NEW Progress.Data.ColumnPropDesc("HomePhone", "Home Phone", Progress.Data.DataType:CHARACTER).
        arrayvar0[10] = NEW Progress.Data.ColumnPropDesc("WorkPhone", "Work Phone", Progress.Data.DataType:CHARACTER).
        arrayvar0[11] = NEW Progress.Data.ColumnPropDesc("DeptCode", "Dept Code", Progress.Data.DataType:CHARACTER).
        arrayvar0[12] = NEW Progress.Data.ColumnPropDesc("Position", "Position", Progress.Data.DataType:CHARACTER).
        arrayvar0[13] = NEW Progress.Data.ColumnPropDesc("Birthdate", "Birthdate", Progress.Data.DataType:DATE).
        arrayvar0[14] = NEW Progress.Data.ColumnPropDesc("StartDate", "Start Date", Progress.Data.DataType:DATE).
        arrayvar0[15] = NEW Progress.Data.ColumnPropDesc("VacationDaysLeft", "Vacation Days Left", Progress.Data.DataType:INTEGER).
        arrayvar0[16] = NEW Progress.Data.ColumnPropDesc("SickDaysLeft", "Sick Days Left", Progress.Data.DataType:INTEGER).
        tableDesc1:Columns = arrayvar0.
        THIS-OBJECT:smartBusinessEntityBindingSource1:TableSchema = tableDesc1.
        /*  */
        /* eEmployee_EmpNum_Label */
        /*  */
        appearance1:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_EmpNum_Label:Appearance = appearance1.
        THIS-OBJECT:eEmployee_EmpNum_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_EmpNum_Label:Location = NEW System.Drawing.Point(20, 24).
        THIS-OBJECT:eEmployee_EmpNum_Label:Name = "eEmployee_EmpNum_Label".
        THIS-OBJECT:eEmployee_EmpNum_Label:Size = NEW System.Drawing.Size(48, 14).
        THIS-OBJECT:eEmployee_EmpNum_Label:TabIndex = 1.
        THIS-OBJECT:eEmployee_EmpNum_Label:Text = "Emp No:".
        /*  */
        /* eEmployee_EmpNum */
        /*  */
        THIS-OBJECT:eEmployee_EmpNum:DataBindings:Add(NEW System.Windows.Forms.Binding("Value", THIS-OBJECT:smartBusinessEntityBindingSource1, "EmpNum", TRUE)).
        THIS-OBJECT:eEmployee_EmpNum:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_EmpNum:Location = NEW System.Drawing.Point(130, 20).
        THIS-OBJECT:eEmployee_EmpNum:Name = "eEmployee_EmpNum".
        THIS-OBJECT:eEmployee_EmpNum:Size = NEW System.Drawing.Size(80, 21).
        THIS-OBJECT:eEmployee_EmpNum:TabIndex = 2.
        /*  */
        /* eEmployee_LastName_Label */
        /*  */
        appearance2:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_LastName_Label:Appearance = appearance2.
        THIS-OBJECT:eEmployee_LastName_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_LastName_Label:Location = NEW System.Drawing.Point(20, 50).
        THIS-OBJECT:eEmployee_LastName_Label:Name = "eEmployee_LastName_Label".
        THIS-OBJECT:eEmployee_LastName_Label:Size = NEW System.Drawing.Size(62, 14).
        THIS-OBJECT:eEmployee_LastName_Label:TabIndex = 3.
        THIS-OBJECT:eEmployee_LastName_Label:Text = "Last Name:".
        /*  */
        /* eEmployee_LastName */
        /*  */
        THIS-OBJECT:eEmployee_LastName:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "LastName", TRUE)).
        THIS-OBJECT:eEmployee_LastName:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_LastName:Location = NEW System.Drawing.Point(130, 46).
        THIS-OBJECT:eEmployee_LastName:Name = "eEmployee_LastName".
        THIS-OBJECT:eEmployee_LastName:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_LastName:TabIndex = 4.
        /*  */
        /* eEmployee_FirstName_Label */
        /*  */
        appearance3:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_FirstName_Label:Appearance = appearance3.
        THIS-OBJECT:eEmployee_FirstName_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_FirstName_Label:Location = NEW System.Drawing.Point(20, 76).
        THIS-OBJECT:eEmployee_FirstName_Label:Name = "eEmployee_FirstName_Label".
        THIS-OBJECT:eEmployee_FirstName_Label:Size = NEW System.Drawing.Size(63, 14).
        THIS-OBJECT:eEmployee_FirstName_Label:TabIndex = 5.
        THIS-OBJECT:eEmployee_FirstName_Label:Text = "First Name:".
        /*  */
        /* eEmployee_FirstName */
        /*  */
        THIS-OBJECT:eEmployee_FirstName:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "FirstName", TRUE)).
        THIS-OBJECT:eEmployee_FirstName:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_FirstName:Location = NEW System.Drawing.Point(130, 72).
        THIS-OBJECT:eEmployee_FirstName:Name = "eEmployee_FirstName".
        THIS-OBJECT:eEmployee_FirstName:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_FirstName:TabIndex = 6.
        /*  */
        /* eEmployee_Address_Label */
        /*  */
        appearance4:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_Address_Label:Appearance = appearance4.
        THIS-OBJECT:eEmployee_Address_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_Address_Label:Location = NEW System.Drawing.Point(20, 102).
        THIS-OBJECT:eEmployee_Address_Label:Name = "eEmployee_Address_Label".
        THIS-OBJECT:eEmployee_Address_Label:Size = NEW System.Drawing.Size(49, 14).
        THIS-OBJECT:eEmployee_Address_Label:TabIndex = 7.
        THIS-OBJECT:eEmployee_Address_Label:Text = "Address:".
        /*  */
        /* eEmployee_Address */
        /*  */
        THIS-OBJECT:eEmployee_Address:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "Address", TRUE)).
        THIS-OBJECT:eEmployee_Address:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_Address:Location = NEW System.Drawing.Point(130, 98).
        THIS-OBJECT:eEmployee_Address:Name = "eEmployee_Address".
        THIS-OBJECT:eEmployee_Address:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_Address:TabIndex = 8.
        /*  */
        /* eEmployee_City_Label */
        /*  */
        appearance5:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_City_Label:Appearance = appearance5.
        THIS-OBJECT:eEmployee_City_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_City_Label:Location = NEW System.Drawing.Point(20, 128).
        THIS-OBJECT:eEmployee_City_Label:Name = "eEmployee_City_Label".
        THIS-OBJECT:eEmployee_City_Label:Size = NEW System.Drawing.Size(27, 14).
        THIS-OBJECT:eEmployee_City_Label:TabIndex = 9.
        THIS-OBJECT:eEmployee_City_Label:Text = "City:".
        /*  */
        /* eEmployee_City */
        /*  */
        THIS-OBJECT:eEmployee_City:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "City", TRUE)).
        THIS-OBJECT:eEmployee_City:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_City:Location = NEW System.Drawing.Point(130, 124).
        THIS-OBJECT:eEmployee_City:Name = "eEmployee_City".
        THIS-OBJECT:eEmployee_City:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_City:TabIndex = 10.
        /*  */
        /* eEmployee_WorkPhone_Label */
        /*  */
        appearance6:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_WorkPhone_Label:Appearance = appearance6.
        THIS-OBJECT:eEmployee_WorkPhone_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_WorkPhone_Label:Location = NEW System.Drawing.Point(20, 154).
        THIS-OBJECT:eEmployee_WorkPhone_Label:Name = "eEmployee_WorkPhone_Label".
        THIS-OBJECT:eEmployee_WorkPhone_Label:Size = NEW System.Drawing.Size(70, 14).
        THIS-OBJECT:eEmployee_WorkPhone_Label:TabIndex = 11.
        THIS-OBJECT:eEmployee_WorkPhone_Label:Text = "Work Phone:".
        /*  */
        /* eEmployee_WorkPhone */
        /*  */
        THIS-OBJECT:eEmployee_WorkPhone:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "WorkPhone", TRUE)).
        THIS-OBJECT:eEmployee_WorkPhone:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_WorkPhone:Location = NEW System.Drawing.Point(130, 150).
        THIS-OBJECT:eEmployee_WorkPhone:Name = "eEmployee_WorkPhone".
        THIS-OBJECT:eEmployee_WorkPhone:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_WorkPhone:TabIndex = 12.
        /*  */
        /* eEmployee_Position_Label */
        /*  */
        appearance7:BackColorAlpha = Infragistics.Win.Alpha:Transparent.
        THIS-OBJECT:eEmployee_Position_Label:Appearance = appearance7.
        THIS-OBJECT:eEmployee_Position_Label:AutoSize = TRUE.
        THIS-OBJECT:eEmployee_Position_Label:Location = NEW System.Drawing.Point(20, 180).
        THIS-OBJECT:eEmployee_Position_Label:Name = "eEmployee_Position_Label".
        THIS-OBJECT:eEmployee_Position_Label:Size = NEW System.Drawing.Size(48, 14).
        THIS-OBJECT:eEmployee_Position_Label:TabIndex = 13.
        THIS-OBJECT:eEmployee_Position_Label:Text = "Position:".
        /*  */
        /* eEmployee_Position */
        /*  */
        THIS-OBJECT:eEmployee_Position:DataBindings:Add(NEW System.Windows.Forms.Binding("Text", THIS-OBJECT:smartBusinessEntityBindingSource1, "Position", TRUE)).
        THIS-OBJECT:eEmployee_Position:DisplayStyle = Infragistics.Win.EmbeddableElementDisplayStyle:Office2010.
        THIS-OBJECT:eEmployee_Position:Location = NEW System.Drawing.Point(130, 176).
        THIS-OBJECT:eEmployee_Position:Name = "eEmployee_Position".
        THIS-OBJECT:eEmployee_Position:Size = NEW System.Drawing.Size(150, 21).
        THIS-OBJECT:eEmployee_Position:TabIndex = 14.
        /*  */
        /* EmployeeViewerControl */
        /*  */
        THIS-OBJECT:AutoScaleDimensions = NEW System.Drawing.SizeF(Progress.Util.CastUtil:ToSingle(6), Progress.Util.CastUtil:ToSingle(13)).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_EmpNum_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_EmpNum).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_LastName_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_LastName).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_FirstName_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_FirstName).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_Address_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_Address).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_City_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_City).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_WorkPhone_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_WorkPhone).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_Position_Label).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:eEmployee_Position).
        THIS-OBJECT:Name = "EmployeeViewerControl".
        THIS-OBJECT:Size = NEW System.Drawing.Size(484, 208).
        CAST(THIS-OBJECT:smartBusinessEntityBindingSource1, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_EmpNum, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_LastName, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_FirstName, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_Address, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_City, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_WorkPhone, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT:eEmployee_Position, System.ComponentModel.ISupportInitialize):EndInit().
        CAST(THIS-OBJECT, System.ComponentModel.ISupportInitialize):EndInit().
        THIS-OBJECT:ResumeLayout(FALSE).
        THIS-OBJECT:PerformLayout().
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.



    /*------------------------------------------------------------------------------
        Purpose: Destructor for the EmployeeViewerControl class
        Notes:   
    ------------------------------------------------------------------------------*/
    DESTRUCTOR PUBLIC EmployeeViewerControl ( ):

        IF VALID-OBJECT(components) THEN DO:
            CAST(components, System.IDisposable):Dispose().
        END.

    END DESTRUCTOR.

END CLASS.
