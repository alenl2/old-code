Imports VB = Microsoft.VisualBasic
Imports System.Data.OleDb
Imports VBto

Public Class PRIJAVE
    Inherits System.Windows.Forms.Form

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents Label19 As Microsoft.VisualBasic.Compatibility.VB6.LabelArray
    Friend WithEvents Picture2 As System.Windows.Forms.PictureBox
    Friend WithEvents Frame3 As System.Windows.Forms.GroupBox
    Friend WithEvents D10 As System.Windows.Forms.ListBox
    Friend WithEvents D4 As System.Windows.Forms.ListBox
    Friend WithEvents Text13 As System.Windows.Forms.TextBox
    Friend WithEvents List3 As System.Windows.Forms.ListBox
    Friend WithEvents Label24 As System.Windows.Forms.Label
    Friend WithEvents Label17 As System.Windows.Forms.Label
    Friend WithEvents Frame2 As System.Windows.Forms.GroupBox
    Friend WithEvents Label26 As System.Windows.Forms.Label
    Friend WithEvents Frame1 As System.Windows.Forms.GroupBox
    Friend WithEvents Check9 As System.Windows.Forms.CheckBox
    Friend WithEvents Check8 As System.Windows.Forms.CheckBox
    Friend WithEvents Command6 As System.Windows.Forms.Button
    Friend WithEvents Text9 As System.Windows.Forms.TextBox
    Friend WithEvents Text5 As System.Windows.Forms.TextBox
    Friend WithEvents Text2 As System.Windows.Forms.TextBox
    Friend WithEvents Timer2 As System.Windows.Forms.Timer
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim resources As System.Resources.ResourceManager = New System.Resources.ResourceManager(GetType(PRIJAVE))
        Me.components = New System.ComponentModel.Container()
        Me.Label19 = New Microsoft.VisualBasic.Compatibility.VB6.LabelArray(components)
        Me.Picture2 = New System.Windows.Forms.PictureBox()
        Me.Frame3 = New System.Windows.Forms.GroupBox()
        Me.D10 = New System.Windows.Forms.ListBox()
        Me.D4 = New System.Windows.Forms.ListBox()
        Me.Text13 = New System.Windows.Forms.TextBox()
        Me.List3 = New System.Windows.Forms.ListBox()
        Me.Label24 = New System.Windows.Forms.Label()
        Me.Label17 = New System.Windows.Forms.Label()
        Me.Frame2 = New System.Windows.Forms.GroupBox()
        Me.Label26 = New System.Windows.Forms.Label()
        Me.Frame1 = New System.Windows.Forms.GroupBox()
        Me.Check9 = New System.Windows.Forms.CheckBox()
        Me.Check8 = New System.Windows.Forms.CheckBox()
        Me.Command6 = New System.Windows.Forms.Button()
        Me.Text9 = New System.Windows.Forms.TextBox()
        Me.Text5 = New System.Windows.Forms.TextBox()
        Me.Text2 = New System.Windows.Forms.TextBox()
        Me.Timer2 = New System.Windows.Forms.Timer()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        CType(Me.Label19, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Picture2
        '
        Me.Picture2.Name = "Picture2"
        Me.Picture2.TabIndex = 79
        Me.Picture2.Location = New System.Drawing.Point(343, 49)
        Me.Picture2.Size = New System.Drawing.Size(328, 34)
        Me.Picture2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Picture2.BackColor = System.Drawing.SystemColors.Window
        '
        'Frame3
        '
        Me.Frame3.Controls.AddRange(New System.Windows.Forms.Control() {Me.D10, Me.D4, Me.Text13, Me.List3, Me.Label24, Me.Label17})
        Me.Frame3.Name = "Frame3"
        Me.Frame3.TabIndex = 40
        Me.Frame3.Location = New System.Drawing.Point(8, 368)
        Me.Frame3.Size = New System.Drawing.Size(328, 246)
        Me.Frame3.Text = "DELAVNICE"
        Me.Frame3.BackColor = System.Drawing.SystemColors.Control
        Me.Frame3.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'D10
        '
        Me.D10.Name = "D10"
        Me.D10.TabStop = False
        Me.D10.TabIndex = 69
        Me.D10.Location = New System.Drawing.Point(204, 278)
        Me.D10.Size = New System.Drawing.Size(42, 17)
        Me.D10.BackColor = System.Drawing.SystemColors.Window
        Me.D10.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'D4
        '
        Me.D4.Name = "D4"
        Me.D4.TabStop = False
        Me.D4.TabIndex = 63
        Me.D4.Location = New System.Drawing.Point(204, 253)
        Me.D4.Size = New System.Drawing.Size(42, 17)
        Me.D4.BackColor = System.Drawing.SystemColors.Window
        Me.D4.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'Text13
        '
        Me.Text13.Name = "Text13"
        Me.Text13.TabIndex = 25
        Me.Text13.Location = New System.Drawing.Point(237, 33)
        Me.Text13.Size = New System.Drawing.Size(83, 19)
        Me.Text13.Text = ""
        Me.Text13.BackColor = System.Drawing.SystemColors.Window
        Me.Text13.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'List3
        '
        Me.List3.Name = "List3"
        Me.List3.TabStop = False
        Me.List3.TabIndex = 41
        Me.List3.Location = New System.Drawing.Point(114, 33)
        Me.List3.Size = New System.Drawing.Size(26, 203)
        Me.List3.BackColor = System.Drawing.SystemColors.Window
        Me.List3.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'Label24
        '
        Me.Label24.Name = "Label24"
        Me.Label24.TabIndex = 51
        Me.Label24.Location = New System.Drawing.Point(114, 16)
        Me.Label24.Size = New System.Drawing.Size(50, 17)
        Me.Label24.Text = "Od  -  Do"
        Me.Label24.BackColor = System.Drawing.SystemColors.Control
        Me.Label24.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Label17
        '
        Me.Label17.Name = "Label17"
        Me.Label17.TabIndex = 44
        Me.Label17.Location = New System.Drawing.Point(237, 57)
        Me.Label17.Size = New System.Drawing.Size(83, 17)
        Me.Label17.Text = "Max Prijav:"
        Me.Label17.BackColor = System.Drawing.SystemColors.Control
        Me.Label17.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Frame2
        '
        Me.Frame2.Controls.AddRange(New System.Windows.Forms.Control() {Me.Label26})
        Me.Frame2.Name = "Frame2"
        Me.Frame2.TabIndex = 32
        Me.Frame2.Location = New System.Drawing.Point(343, 163)
        Me.Frame2.Size = New System.Drawing.Size(328, 450)
        Me.Frame2.Text = "STANJE"
        Me.Frame2.BackColor = System.Drawing.SystemColors.Control
        Me.Frame2.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Label26
        '
        Me.Label26.Name = "Label26"
        Me.Label26.TabIndex = 53
        Me.Label26.Location = New System.Drawing.Point(139, 16)
        Me.Label26.Size = New System.Drawing.Size(91, 17)
        Me.Label26.Text = "PRIJAVE NA DAN"
        Me.Label26.BackColor = System.Drawing.SystemColors.Control
        Me.Label26.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Frame1
        '
        Me.Frame1.Controls.AddRange(New System.Windows.Forms.Control() {Me.Check9, Me.Check8, Me.Command6, Me.Text9, Me.Text5, Me.Text2, Me.Label9, Me.Label5})
        Me.Frame1.Name = "Frame1"
        Me.Frame1.TabIndex = 0
        Me.Frame1.Location = New System.Drawing.Point(8, 49)
        Me.Frame1.Size = New System.Drawing.Size(328, 312)
        Me.Frame1.Text = "PRIJAVA"
        Me.Frame1.BackColor = System.Drawing.SystemColors.Control
        Me.Frame1.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Check9
        '
        Me.Check9.Name = "Check9"
        Me.Check9.TabIndex = 95
        Me.Check9.Location = New System.Drawing.Point(123, 286)
        Me.Check9.Size = New System.Drawing.Size(124, 17)
        Me.Check9.Text = "Polno blokada"
        Me.Check9.BackColor = System.Drawing.SystemColors.Control
        Me.Check9.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Check8
        '
        Me.Check8.Name = "Check8"
        Me.Check8.TabIndex = 94
        Me.Check8.Location = New System.Drawing.Point(8, 286)
        Me.Check8.Size = New System.Drawing.Size(107, 17)
        Me.Check8.Text = "Najmlajsi blokada"
        Me.Check8.BackColor = System.Drawing.SystemColors.Control
        Me.Check8.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Command6
        '
        Me.Command6.Name = "Command6"
        Me.Command6.TabIndex = 17
        Me.Command6.Location = New System.Drawing.Point(82, 253)
        Me.Command6.Size = New System.Drawing.Size(42, 26)
        Me.Command6.Text = "ISCI"
        Me.Command6.BackColor = System.Drawing.SystemColors.Control
        Me.Command6.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Text9
        '
        Me.Text9.Name = "Text9"
        Me.Text9.TabIndex = 4
        Me.Text9.Location = New System.Drawing.Point(82, 90)
        Me.Text9.Size = New System.Drawing.Size(238, 19)
        Me.Text9.Text = ""
        Me.Text9.BackColor = System.Drawing.SystemColors.Window
        Me.Text9.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'Text5
        '
        Me.Text5.Name = "Text5"
        Me.Text5.TabIndex = 3
        Me.Text5.Location = New System.Drawing.Point(82, 65)
        Me.Text5.Size = New System.Drawing.Size(238, 19)
        Me.Text5.Text = ""
        Me.Text5.BackColor = System.Drawing.SystemColors.Window
        Me.Text5.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'Text2
        '
        Me.Text2.Name = "Text2"
        Me.Text2.TabIndex = 2
        Me.Text2.Location = New System.Drawing.Point(82, 41)
        Me.Text2.Size = New System.Drawing.Size(238, 19)
        Me.Text2.Text = ""
        Me.Text2.BackColor = System.Drawing.SystemColors.Window
        Me.Text2.ForeColor = System.Drawing.SystemColors.WindowText
        '
        'Timer2
        '
        Me.Timer2.Enabled = False
        Me.Timer2.Interval = 2000
        '
        'Label9
        '
        Me.Label9.Name = "Label9"
        Me.Label9.TabIndex = 55
        Me.Label9.Location = New System.Drawing.Point(16, 114)
        Me.Label9.Size = New System.Drawing.Size(50, 17)
        Me.Label9.Text = "Posta"
        Me.Label9.BackColor = System.Drawing.SystemColors.Control
        Me.Label9.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'Label5
        '
        Me.Label5.Name = "Label5"
        Me.Label5.TabIndex = 33
        Me.Label5.Location = New System.Drawing.Point(16, 65)
        Me.Label5.Size = New System.Drawing.Size(58, 17)
        Me.Label5.Text = "Priimek"
        Me.Label5.BackColor = System.Drawing.SystemColors.Control
        Me.Label5.ForeColor = System.Drawing.SystemColors.ControlText
        '
        'PRIJAVE
        '
        Me.ClientSize = New System.Drawing.Size(680, 623)
        Me.Controls.AddRange(New System.Windows.Forms.Control() {Me.Picture2, Me.Frame3, Me.Frame2, Me.Frame1})
        Me.Name = "PRIJAVE"
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle
        Me.BackColor = System.Drawing.SystemColors.ActiveBorder
        Me.ForeColor = System.Drawing.SystemColors.ControlText
        Me.MinimizeBox = False
        Me.MaximizeBox = False
        Me.Icon = CType(Resources.GetObject("PRIJAVE.Icon"), System.Drawing.Icon)
        Me.StartPosition = System.Windows.Forms.FormStartPosition.Manual
        Me.Text = "Prijava na oratorij"
        Me.Label19.SetIndex(Label19_0, CType(0, Short))
        CType(Me.Label19, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Picture2.ResumeLayout(False)
        Me.Frame3.ResumeLayout(False)
        Me.Frame2.ResumeLayout(False)
        Me.Frame1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub

#End Region

	'=========================================================
    Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Integer, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Integer) As Integer

    Public prepisi As Short
    Public mode As String
    ' VBto upgrade warning: POZICIJA_PRIJAVE As String	OnWrite(Integer)
    Public POZICIJA_PRIJAVE As String
    Public popravljanje As String

    ' VBto upgrade warning: Index As Short	OnWrite(Integer)
    Dim Index(300) As Short




    Private Sub Com_print_Click()
    End Sub
    Private Sub Com2_print_Click()
    End Sub


    Private Sub Combo4_Click()
    End Sub

    Private Sub Command1_Click()
    End Sub

    Private Sub Command3_Click()
    End Sub

    Private Sub Command4_Click()
    End Sub





    Private Sub Command8_Click()
    End Sub

    Public Sub PRIJAVE_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
    End Sub




    Public Function Add() As Object
    End Function


    Private Sub Command2_Click()
    End Sub

    Private Function List(ByVal Izbrani_Datum As String) As Object
    End Function

    Function List_Podatki() As Object
    End Function

    Private Function List_Stanje(ByRef Izbrani_Datum As String) As Object
    End Function

    Public Function Delete() As Object
    End Function

    Private Sub Command5_Click()
    End Sub

    Private Sub Command6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Command6.Click
    End Sub

    Private Sub Command9_Click()
    End Sub

    Public Function List1_klik() As Object
    End Function

    Private Sub List1_Click()
    End Sub

    Private Sub List2_MouseDown(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List2_MouseMove(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List3_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles List3.MouseMove
        Dim Button As Short = e.Button \ &H100000
        Dim Shift As Short = System.Windows.Forms.Control.ModifierKeys \ &H10000
        Dim X As Single = VB6.PixelsToTwipsX(e.X)
        Dim Y As Single = VB6.PixelsToTwipsY(e.Y)
    End Sub
    Private Sub List3_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles List3.MouseDown
        Dim Button As Short = e.Button \ &H100000
        Dim Shift As Short = System.Windows.Forms.Control.ModifierKeys \ &H10000
        Dim X As Single = VB6.PixelsToTwipsX(e.X)
        Dim Y As Single = VB6.PixelsToTwipsY(e.Y)
    End Sub
    Private Sub List4_MouseMove(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List4_MouseDown(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List5_MouseMove(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List5_MouseDown(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List6_MouseMove(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub
    Private Sub List6_MouseDown(ByRef Button As Short, ByRef Shift As Short, ByRef X As Single, ByRef Y As Single)
    End Sub

    Private Sub Picture1_Click()
    End Sub
    Private Sub OpenURL(ByRef strURL As String)
    End Sub



    Private Sub Text1_GotFocus()
    End Sub
    Private Sub cmdOn(ByVal Index As Short)
    End Sub
    Private Sub cmdOff(ByVal Index As Short)
    End Sub

    Private Sub Text1_KeyPress(ByRef KeyAscii As Short)
    End Sub


    Private Sub Text1_LostFocus()
    End Sub

    Private Sub Timer1_Timer()
    End Sub
    Private Sub COM_Click()
    End Sub


    Private Sub Text11_Click()
    End Sub

    Private Sub Timer2_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer2.Tick
    End Sub

    Private Sub Text15_Click()
    End Sub

    Private Sub Check7_Click()
    End Sub


    Private Sub Text15_KeyPress(ByRef KeyAscii As Short)
    End Sub


    Private Sub Text11_KeyPress(ByRef KeyAscii As Short)
    End Sub

End Class