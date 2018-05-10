VERSION 5.00
Begin VB.Form PRIJAVE 
   BackColor       =   &H8000000A&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Prijava na oratorij"
   ClientHeight    =   9150
   ClientLeft      =   5100
   ClientTop       =   1515
   ClientWidth     =   9990
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   9150
   ScaleWidth      =   9990
   Begin VB.Frame Frame4 
      Caption         =   "ISKALNIK"
      Height          =   975
      Left            =   5040
      TabIndex        =   88
      Top             =   1320
      Width           =   4815
      Begin VB.TextBox Text11 
         Height          =   288
         Left            =   840
         TabIndex        =   90
         Top             =   600
         Width           =   3855
      End
      Begin VB.TextBox Text15 
         Height          =   285
         Left            =   840
         TabIndex        =   89
         Top             =   240
         Width           =   3855
      End
      Begin VB.Label Label27 
         Caption         =   "Po kodi"
         Height          =   255
         Left            =   120
         TabIndex        =   92
         Top             =   600
         Width           =   855
      End
      Begin VB.Label Label15 
         Caption         =   "Po imenu"
         Height          =   255
         Left            =   120
         TabIndex        =   91
         Top             =   240
         Width           =   855
      End
   End
   Begin VB.PictureBox Picture2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   495
      Left            =   5040
      ScaleHeight     =   495
      ScaleWidth      =   4815
      TabIndex        =   79
      Top             =   720
      Width           =   4815
      Begin VB.PictureBox Picture1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   4320
         MousePointer    =   99  'Custom
         Picture         =   "Form1.frx":030A
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   80
         Top             =   0
         Width           =   495
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   18.75
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000001&
         Height          =   495
         Left            =   0
         TabIndex        =   81
         Top             =   0
         Width           =   4095
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "DELAVNICE"
      Height          =   3615
      Left            =   120
      TabIndex        =   40
      Top             =   5400
      Width           =   4815
      Begin VB.CheckBox Check4 
         Caption         =   "Samo enkrat"
         Height          =   195
         Left            =   3480
         TabIndex        =   83
         Top             =   2640
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.ListBox List8 
         Height          =   255
         Left            =   3000
         TabIndex        =   78
         Top             =   4440
         Width           =   615
      End
      Begin VB.CommandButton Com_print 
         Caption         =   "NATISNI"
         Height          =   255
         Left            =   3480
         TabIndex        =   77
         Top             =   2880
         Width           =   1215
      End
      Begin VB.ListBox List7 
         Height          =   255
         Left            =   2280
         TabIndex        =   76
         Top             =   4440
         Width           =   615
      End
      Begin VB.ListBox D0 
         Height          =   255
         Left            =   120
         TabIndex        =   74
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox D14 
         Height          =   255
         Left            =   1560
         TabIndex        =   73
         TabStop         =   0   'False
         Top             =   4440
         Width           =   615
      End
      Begin VB.ListBox D13 
         Height          =   255
         Left            =   840
         TabIndex        =   72
         TabStop         =   0   'False
         Top             =   4440
         Width           =   615
      End
      Begin VB.ListBox D12 
         Height          =   255
         Left            =   120
         TabIndex        =   71
         TabStop         =   0   'False
         Top             =   4440
         Width           =   615
      End
      Begin VB.ListBox D11 
         Height          =   255
         Left            =   3720
         TabIndex        =   70
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D10 
         Height          =   255
         Left            =   3000
         TabIndex        =   69
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D9 
         Height          =   255
         Left            =   2280
         TabIndex        =   68
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D8 
         Height          =   255
         Left            =   1560
         TabIndex        =   67
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D7 
         Height          =   255
         Left            =   840
         TabIndex        =   66
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D6 
         Height          =   255
         Left            =   120
         TabIndex        =   65
         TabStop         =   0   'False
         Top             =   4080
         Width           =   615
      End
      Begin VB.ListBox D5 
         Height          =   255
         Left            =   3720
         TabIndex        =   64
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox D4 
         Height          =   255
         Left            =   3000
         TabIndex        =   63
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox D3 
         Height          =   255
         Left            =   2280
         TabIndex        =   62
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox D2 
         Height          =   255
         Left            =   1560
         TabIndex        =   61
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox D1 
         Height          =   255
         Left            =   840
         TabIndex        =   60
         TabStop         =   0   'False
         Top             =   3720
         Width           =   615
      End
      Begin VB.ListBox List5 
         Height          =   2985
         Left            =   2880
         TabIndex        =   59
         TabStop         =   0   'False
         Top             =   480
         Width           =   495
      End
      Begin VB.CommandButton Command8 
         Caption         =   "POSODOBI"
         Height          =   255
         Left            =   3480
         TabIndex        =   29
         Top             =   3240
         Width           =   1215
      End
      Begin VB.TextBox Text13 
         Height          =   285
         Left            =   3480
         TabIndex        =   25
         Top             =   480
         Width           =   1215
      End
      Begin VB.TextBox Text10 
         Height          =   285
         Left            =   3480
         TabIndex        =   28
         Top             =   2280
         Width           =   735
      End
      Begin VB.TextBox Text8 
         Height          =   285
         Left            =   3480
         TabIndex        =   27
         Top             =   1680
         Width           =   735
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   3480
         TabIndex        =   26
         Top             =   1080
         Width           =   1215
      End
      Begin VB.ListBox List6 
         Height          =   2985
         Left            =   2400
         TabIndex        =   43
         TabStop         =   0   'False
         Top             =   480
         Width           =   495
      End
      Begin VB.ListBox List4 
         Height          =   2985
         Left            =   2040
         TabIndex        =   42
         TabStop         =   0   'False
         Top             =   480
         Width           =   375
      End
      Begin VB.ListBox List3 
         Height          =   2985
         Left            =   1680
         TabIndex        =   41
         TabStop         =   0   'False
         Top             =   480
         Width           =   375
      End
      Begin VB.ListBox List2 
         Height          =   2985
         Left            =   120
         TabIndex        =   24
         Top             =   480
         Width           =   1575
      End
      Begin VB.Label Label14 
         Alignment       =   2  'Center
         Caption         =   "MAX"
         Height          =   255
         Left            =   2400
         TabIndex        =   75
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label25 
         Caption         =   " Stanje"
         Height          =   255
         Left            =   2880
         TabIndex        =   52
         Top             =   240
         Width           =   495
      End
      Begin VB.Label Label24 
         Caption         =   "Od  -  Do"
         Height          =   255
         Left            =   1680
         TabIndex        =   51
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label23 
         Caption         =   "Danasnje delavnice"
         Height          =   255
         Left            =   120
         TabIndex        =   50
         Top             =   240
         Width           =   1455
      End
      Begin VB.Label Label22 
         Caption         =   "Ime delavnice:"
         Height          =   255
         Left            =   3480
         TabIndex        =   49
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label21 
         Caption         =   "LET"
         Height          =   255
         Left            =   4320
         TabIndex        =   48
         Top             =   2280
         Width           =   375
      End
      Begin VB.Label Label20 
         Caption         =   "Najvisja starost:"
         Height          =   255
         Left            =   3480
         TabIndex        =   47
         Top             =   2040
         Width           =   1215
      End
      Begin VB.Label Label19 
         Caption         =   "LET"
         Height          =   255
         Index           =   0
         Left            =   4320
         TabIndex        =   46
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label Label18 
         Caption         =   "Najnizja starost:"
         Height          =   255
         Left            =   3480
         TabIndex        =   45
         Top             =   1440
         Width           =   1215
      End
      Begin VB.Label Label17 
         Caption         =   "Max Prijav:"
         Height          =   255
         Left            =   3480
         TabIndex        =   44
         Top             =   840
         Width           =   1215
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "STANJE"
      Height          =   6615
      Left            =   5040
      TabIndex        =   32
      Top             =   2400
      Width           =   4815
      Begin VB.CommandButton Command5 
         Caption         =   "STANJE"
         Height          =   255
         Left            =   1080
         TabIndex        =   21
         Top             =   240
         Width           =   855
      End
      Begin VB.ComboBox Combo4 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "d.M.yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1060
            SubFormatType   =   3
         EndProperty
         Height          =   315
         Left            =   3480
         TabIndex        =   22
         Top             =   240
         Width           =   1215
      End
      Begin VB.CommandButton Command4 
         Caption         =   "SEZNAM"
         Height          =   255
         Left            =   120
         TabIndex        =   20
         Top             =   240
         Width           =   855
      End
      Begin VB.ListBox List1 
         Height          =   5520
         Left            =   120
         TabIndex        =   23
         Top             =   600
         Width           =   4575
      End
      Begin VB.Label Label28 
         BackColor       =   &H80000009&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   238
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   255
         Left            =   120
         TabIndex        =   93
         Top             =   6240
         Width           =   4575
      End
      Begin VB.Label Label26 
         Caption         =   "PRIJAVE NA DAN"
         Height          =   255
         Left            =   2040
         TabIndex        =   53
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "PRIJAVA"
      Height          =   4575
      Left            =   120
      TabIndex        =   0
      Top             =   720
      Width           =   4815
      Begin VB.CheckBox Check11 
         Caption         =   "Check"
         Enabled         =   0   'False
         Height          =   255
         Left            =   1200
         TabIndex        =   97
         Top             =   3360
         Width           =   855
      End
      Begin VB.CheckBox Check10 
         Caption         =   "Starost blokada"
         Height          =   255
         Left            =   3240
         TabIndex        =   96
         Top             =   4200
         Width           =   1455
      End
      Begin VB.CheckBox Check9 
         Caption         =   "Polno blokada"
         Height          =   255
         Left            =   1800
         TabIndex        =   95
         Top             =   4200
         Width           =   1815
      End
      Begin VB.CheckBox Check8 
         Caption         =   "Najmlajsi blokada"
         Height          =   255
         Left            =   120
         TabIndex        =   94
         Top             =   4200
         Width           =   1575
      End
      Begin VB.TextBox Text7 
         Height          =   285
         Left            =   1200
         TabIndex        =   11
         Top             =   2760
         Width           =   375
      End
      Begin VB.CheckBox Check6 
         Caption         =   "Delimo majce"
         Enabled         =   0   'False
         Height          =   255
         Left            =   3360
         TabIndex        =   87
         Top             =   3360
         Width           =   1335
      End
      Begin VB.CheckBox Check7 
         Caption         =   "Omogoci"
         Height          =   255
         Left            =   120
         TabIndex        =   86
         Top             =   3360
         Width           =   975
      End
      Begin VB.CheckBox Check5 
         Caption         =   "Bazen"
         Enabled         =   0   'False
         Height          =   255
         Left            =   2400
         TabIndex        =   85
         Top             =   3360
         Width           =   855
      End
      Begin VB.CommandButton Com2_print 
         Caption         =   "NATISNI"
         Height          =   375
         Left            =   120
         TabIndex        =   84
         Top             =   3000
         Width           =   975
      End
      Begin VB.CommandButton Command9 
         Caption         =   "RESEST"
         Height          =   315
         Left            =   3960
         Style           =   1  'Graphical
         TabIndex        =   58
         Top             =   240
         Width           =   735
      End
      Begin VB.CommandButton Command6 
         Caption         =   "ISCI"
         Height          =   375
         Left            =   1200
         TabIndex        =   17
         Top             =   3720
         Width           =   615
      End
      Begin VB.TextBox Text14 
         Height          =   285
         Left            =   3360
         TabIndex        =   6
         Top             =   1680
         Width           =   1335
      End
      Begin VB.ComboBox Combo2 
         Height          =   315
         ItemData        =   "Form1.frx":0614
         Left            =   1200
         List            =   "Form1.frx":0616
         TabIndex        =   10
         Top             =   2400
         Width           =   3495
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   2280
         TabIndex        =   8
         Top             =   2040
         Width           =   975
      End
      Begin VB.TextBox Text12 
         Height          =   285
         Left            =   1200
         TabIndex        =   5
         Top             =   1680
         Width           =   1455
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Vzel majico"
         Height          =   255
         Left            =   1200
         TabIndex        =   13
         Top             =   3120
         Width           =   1095
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Prijavnica"
         Height          =   255
         Left            =   3360
         TabIndex        =   15
         Top             =   3120
         Width           =   1215
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   3960
         TabIndex        =   9
         Top             =   2040
         Width           =   495
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Bazen"
         Height          =   255
         Left            =   2400
         TabIndex        =   14
         Top             =   3120
         Width           =   855
      End
      Begin VB.TextBox Text9 
         Height          =   285
         Left            =   1200
         TabIndex        =   4
         Top             =   1320
         Width           =   3495
      End
      Begin VB.CommandButton Command3 
         Caption         =   "NOV VPIS"
         Height          =   375
         Left            =   120
         TabIndex        =   19
         Top             =   3720
         Width           =   975
      End
      Begin VB.CommandButton Command2 
         Caption         =   "POSODOBI"
         Height          =   375
         Left            =   1920
         TabIndex        =   18
         Top             =   3720
         Width           =   1095
      End
      Begin VB.TextBox Text6 
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1060
            SubFormatType   =   1
         EndProperty
         Height          =   285
         Left            =   1200
         TabIndex        =   7
         Top             =   2040
         Width           =   375
      End
      Begin VB.TextBox Text5 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "H:mm:ss"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1060
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   1200
         TabIndex        =   3
         Top             =   960
         Width           =   3495
      End
      Begin VB.CommandButton Command1 
         Caption         =   "ROCNA PRIJAVA"
         Height          =   375
         Left            =   3120
         TabIndex        =   16
         Top             =   3720
         Width           =   1575
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1200
         TabIndex        =   2
         Top             =   600
         Width           =   3495
      End
      Begin VB.TextBox Text1 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1060
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   1200
         TabIndex        =   1
         Top             =   240
         Width           =   2655
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   2000
         Left            =   120
         Top             =   3000
      End
      Begin VB.ComboBox Combo3 
         Height          =   315
         Left            =   1680
         TabIndex        =   12
         Top             =   2760
         Width           =   3015
      End
      Begin VB.OLE OLE1 
         BackColor       =   &H80000000&
         Height          =   255
         Left            =   1200
         TabIndex        =   82
         Top             =   2760
         Width           =   375
      End
      Begin VB.Label Label10 
         Caption         =   "Tel.:"
         Height          =   255
         Left            =   2880
         TabIndex        =   56
         Top             =   1680
         Width           =   375
      End
      Begin VB.Label Label9 
         Caption         =   "Posta"
         Height          =   255
         Left            =   240
         TabIndex        =   55
         Top             =   1680
         Width           =   735
      End
      Begin VB.Label Label3 
         Caption         =   "€"
         Height          =   255
         Left            =   4560
         TabIndex        =   54
         Top             =   2040
         Width           =   135
      End
      Begin VB.Label Label12 
         Caption         =   "Skupina"
         Height          =   255
         Left            =   240
         TabIndex        =   39
         Top             =   2400
         Width           =   855
      End
      Begin VB.Label Label11 
         Caption         =   "Placal"
         Height          =   255
         Left            =   3360
         TabIndex        =   38
         Top             =   2040
         Width           =   495
      End
      Begin VB.Label Label4 
         Caption         =   "Majica"
         Height          =   255
         Left            =   1680
         TabIndex        =   37
         Top             =   2040
         Width           =   615
      End
      Begin VB.Label Label8 
         Caption         =   "Naslov"
         Height          =   255
         Left            =   240
         TabIndex        =   36
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Label7 
         Caption         =   "Delavnica"
         Height          =   255
         Left            =   240
         TabIndex        =   35
         Top             =   2760
         Width           =   855
      End
      Begin VB.Label Label6 
         Caption         =   "Starost"
         Height          =   255
         Left            =   240
         TabIndex        =   34
         Top             =   2040
         Width           =   735
      End
      Begin VB.Label Label5 
         Caption         =   "Priimek"
         Height          =   255
         Left            =   240
         TabIndex        =   33
         Top             =   960
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Ime"
         Height          =   255
         Left            =   240
         TabIndex        =   31
         Top             =   600
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "KODA"
         Height          =   255
         Left            =   240
         TabIndex        =   30
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   720
      Top             =   3720
   End
   Begin VB.Label Label13 
      Alignment       =   2  'Center
      BackColor       =   &H00008000&
      Caption         =   "PRIPRAVLJEN"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   21.75
         Charset         =   238
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   495
      Left            =   120
      TabIndex        =   57
      Top             =   120
      Width           =   9735
   End
End
Attribute VB_Name = "PRIJAVE"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" ( _
    ByVal hWnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long

Public prepisi As Integer
Public mode As String
Public POZICIJA_PRIJAVE As String
Public popravljanje As String

Dim Index(300) As Integer




Private Sub Com_print_Click()

If List2.Text <> "" Then
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer
Set WS = DBEngine.Workspaces(0)
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")

If Combo4.Text <> "" Then
Izbrani_Datum = Combo4.Text
Else
Izbrani_Datum = Format(Date, "d.M.yyyy")
End If

Printer.CurrentY = 567 '1cm
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 25
Printer.Font.Bold = True
Printer.Print "Delavnica:   " & List2.Text
Printer.Font.Bold = False
Printer.Print "__________________________________________"
Printer.Font.Size = 14
Printer.Print ""
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 14
Printer.Print "Datum:   " & Format(Date, "dddd, d.M.yyyy")
If Combo4.Text = Format(Date, "d.M.yyyy") Then
Printer.Font.Size = 14
Printer.CurrentX = 567 '1cm
Printer.Print "ZA DANES"
End If
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 14
Printer.Print "Najnižja starost:   " & List3.Text & " let"
Printer.CurrentX = 567 '1cm
Printer.Print "Najvišja starost:   " & List4.Text & " let"
Printer.CurrentX = 567 '1cm
Printer.Print "Najveèje število prijav:   " & List6.Text
Printer.CurrentX = 567 '1cm
Printer.Print "Število prijavljenih:   " & List5.Text
Printer.Font.Size = 25
Printer.Print "__________________________________________"
Printer.Font.Size = 14
Printer.Print
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 16
Printer.Font.Bold = True
Printer.Print "Animatorji:"
Printer.Font.Bold = False

Set Rs2 = DB.OpenRecordset("ANIMATORJI", dbOpenTable)
Max2 = Rs2.RecordCount
Rs2.Move BOF

For i = 1 To Max2
    If Rs2("DELAVNICA") = List2.Text Then
    Printer.CurrentX = 567 '1cm
    Printer.Font.Size = 12
    Printer.Print Rs2("IME") & " " & Rs2("PRIIMEK")
    End If
    Rs2.MoveNext
Next i


Printer.Font.Size = 14
Printer.Print
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 16
Printer.Font.Bold = True
Printer.Print "Udeleženci:"
Printer.Font.Bold = False

Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
j = 0
For i = 1 To Max
    If Rs("DATUM_STR") = Izbrani_Datum And Rs("DELAVNICA") = List2.Text And Rs("SKUPINA") <> "A" Then
    j = j + 1
    Printer.CurrentX = 567 '1cm
    Printer.Font.Size = 12
    Printer.Print j & " " & Rs("IME") & " " & Rs("PRIIMEK")
    End If
    Rs.MoveNext
Next i
Rs.Close
DB.Close

Printer.EndDoc
Else
MsgBox "Izberi delavnico in dan", , "Napaka"
End If
End Sub
Private Sub Com2_print_Click()

If Combo2.Text <> "" Then
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer
Set WS = DBEngine.Workspaces(0)
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")

Izbrani_Datum = Format(Date, "d.M.yyyy")


Printer.CurrentY = 567 '1cm
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 25
Printer.Font.Bold = True
Printer.Print "Skupina:   " & Combo2.Text
Printer.Font.Bold = False
Printer.Print "__________________________________________"
Printer.Font.Size = 14
Printer.Print ""
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 14
Printer.Print "Datum:   " & Format(Date, "dddd, d.M.yyyy")
If Combo4.Text = Format(Date, "d.M.yyyy") Then
Printer.Font.Size = 14
Printer.CurrentX = 567 '1cm
Printer.Print "ZA DANES"
End If
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 25
Printer.Print "__________________________________________"
Printer.Font.Size = 14
Printer.Print
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 16
Printer.Font.Bold = True
Printer.Print "Animatorji:"

Printer.Font.Bold = False

Set Rs2 = DB.OpenRecordset("ANIMATORJI", dbOpenTable)
Max2 = Rs2.RecordCount
Rs2.Move BOF

For i = 1 To Max2
    If Rs2("SKUPINA") = Combo2.Text Then
    Printer.CurrentX = 567 '1cm
    Printer.Font.Size = 12
    Printer.Print Rs2("IME") & " " & Rs2("PRIIMEK")
    End If
    Rs2.MoveNext
Next i

Printer.Font.Size = 14
Printer.Print
Printer.CurrentX = 567 '1cm
Printer.Font.Size = 16
Printer.Font.Bold = True
Printer.Print "Udeleženci ki so dnes prišli"
Printer.Font.Bold = False

Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
j = 0
For i = 1 To Max
    If Rs("DATUM_STR") = Izbrani_Datum And Rs("SKUPINA2") = Combo2.Text Then
    j = j + 1
    Printer.CurrentX = 567 '1cm
    Printer.Font.Size = 12
    Printer.Print j & " " & Rs("IME") & " " & Rs("PRIIMEK")
    End If
    Rs.MoveNext
Next i
Rs.Close
DB.Close

Printer.EndDoc
Else
MsgBox "Izberi skupino in dan", , "Napaka"
End If
End Sub


Private Sub Combo4_Click()
List (Combo4.Text)
Text1.Text = ""
 Text2.Text = ""
        Text5.Text = ""
        Text6.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text7.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Combo3.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
        Label13.Caption = "UREJANJE"
        Label13.BackColor = &HFF8080
                cmdOff (2)
                cmdOff (0)
                cmdOff (1)
        Command3.Enabled = True
Command2.Enabled = False
Command3.Caption = "NOV VPIS"
End Sub

Private Sub Command1_Click()
Command3.Enabled = True
Command2.Enabled = False

Text1_KeyPress (vbKeyReturn)
Text1.SetFocus


End Sub

Private Sub Command3_Click()

Text1.SetFocus
Command2.Enabled = False
If Command3.Caption = "NOV VPIS" Then
Command3.Caption = "SHRANI"
Command2.Enabled = "False"
Label13.Caption = "NOV VPIS"
        Label13.BackColor = &HFF8080
        cmdOff (1)
        cmdOff (0)
        cmdOff (2)
        
        List_Podatki
        Text1.Text = ""
        Text2.Text = ""
        Text5.Text = ""
        Text6.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text7.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Combo3.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
Else

If Text1.Text = "" Or _
Text2.Text = "" Or _
Text5.Text = "" Or _
Text3.Text = "" Or _
Text12.Text = "" Or _
Text9.Text = "" Or _
Text14.Text = "" Or _
Text6.Text = "" Or _
Combo1.Text = "" Or _
Combo2.Text = "" Then

MsgBox "IZPOLNI VSA POLJA"
Command3.Caption = "SHRANI"
Else

If Text6.Text = "3" Or Text6.Text = "4" Or Text6.Text = "5" Or Text6.Text = "6" Or Text6.Text = "7" Or Text6.Text = "8" Or _
Text6.Text = "9" Or Text6.Text = "10" Or Text6.Text = "11" Or Text6.Text = "12" Or Text6.Text = "13" Or Text6.Text = "14" Or _
Text6.Text = "15" Or Text6.Text = "16" Or Text6.Text = "17" Or Text6.Text = "18" Or Text6.Text = "19" Or Text6.Text = "20" Or _
Text6.Text = "21" Or Text6.Text = "22" Or Text6.Text = "23" Or Text6.Text = "24" Or Text6.Text = "26" Or Text6.Text = "27" Or _
Text6.Text = "28" Or Text6.Text = "29" Or Text6.Text = "30" Or Text6.Text = "31" Or Text6.Text = "32" Or Text6.Text = "33" Or _
Text6.Text = "34" Or Text6.Text = "35" Or Text6.Text = "36" Or Text6.Text = "37" Or Text6.Text = "38" Or Text6.Text = "39" Or _
Text6.Text = "40" Or Text6.Text = "41" Or Text6.Text = "42" Or Text6.Text = "43" Or Text6.Text = "44" Or Text6.Text = "45" Or _
Text6.Text = "46" Or Text6.Text = "47" Or Text6.Text = "48" Or Text6.Text = "49" Or Text6.Text = "50" Or Text6.Text = "51" Or _
Text6.Text = "52" Or Text6.Text = "53" Or Text6.Text = "54" Or Text6.Text = "55" Or Text6.Text = "56" Or Text6.Text = "57" Or _
Text6.Text = "58" Or Text6.Text = "59" Or Text6.Text = "60" Or Text6.Text = "61" Or Text6.Text = "62" Or Text6.Text = "63" Then


Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)

Max = Rs.RecordCount
Rs.Move BOF

For i = 1 To Max
    If Int(Text1.Text) = Rs("ST_IZKAZNICE") Then
        vpisi = False
    Else
        vpisi = True
    End If
    Rs.MoveNext
Next i

If vpisi = True Then

Rs.AddNew
    
    'change the info
    Rs("ST_IZKAZNICE") = Text1.Text
    Rs("IME") = Text2.Text
    Rs("PRIIMEK") = Text5.Text
    Rs("PLACAL") = Text3.Text
    Rs("POSTA") = Text12.Text
    Rs("NASLOV") = Text9.Text
    Rs("TEL") = Text14.Text
    Rs("STAROST") = Text6.Text
    Rs("VELIKOST_MAJICE") = Combo1.Text
    Rs("SKUPINA") = Combo2.Text
    Rs("MAJICA") = Check3.Value
    Rs("BAZEN") = Check1.Value
    Rs("PRIJAVNICA") = Check2.Value
    'Update the DB
    Rs.Update
    
    Label13.Caption = "SHRANJENO"
        Label13.BackColor = &H8000&
        cmdOff (2)
        cmdOff (0)
        cmdOff (1)
     Command3.Caption = "NOV VPIS"
        Timer2.Enabled = True

Else

Label13.Caption = "TA KODA ŽE OBSTAJA"
        Label13.BackColor = &HFF&
        cmdOff (2)
        cmdOff (0)
        cmdOff (1)
Command3.Caption = "SHRANI"

End If
    
DB.Close
List_Podatki

Else
MsgBox "STAROST NI PRAVILNA (3 - 63 LET)"
Command3.Caption = "SHRANI"
End If
End If
End If

End Sub

Private Sub Command4_Click()
List_Podatki
Text1.Text = ""
 Text2.Text = ""
        Text5.Text = ""
        Text6.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text7.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Combo3.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
        Label13.Caption = "UREJANJE"
        Label13.BackColor = &HFF8080
        cmdOff (1)
        cmdOff (0)
        cmdOff (2)
        Command3.Enabled = True
Command2.Enabled = False
Command3.Caption = "NOV VPIS"
End Sub





Private Sub Command8_Click()

If List2.SelCount = 1 Then

Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("DELAVNICE", dbOpenTable)

i = List2.ListIndex
k = List2.ListIndex
Rs.Move i


Rs.Edit
    
    'change the info
    If Text4.Text = "" Then
        Rs("MAX_PRIJAV") = 0
    Else
        Rs("MAX_PRIJAV") = Text4.Text
    End If
    If Text13.Text = "" Then
        Rs("IME") = "prazno"
    Else
        Rs("IME") = Text13.Text
    End If
    If Text8.Text = "" Then
        Rs("MIN_STAROST") = 0
    Else
        Rs("MIN_STAROST") = Text8.Text
    End If
    If Text10.Text = "" Then
        Rs("MAX_STAROST") = 0
    Else
        Rs("MAX_STAROST") = Text10.Text
    End If
    
        
    'Update the DB
    Rs.Update
    
Combo3.Clear
List2.Clear
List3.Clear
List4.Clear
List6.Clear
Set Rs = DB.OpenRecordset("DELAVNICE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
For i = 1 To Max
    Combo3.AddItem Rs!IME
    List2.AddItem Rs!IME
    List3.AddItem Rs!MIN_STAROST
    List4.AddItem Rs!MAX_STAROST
    List6.AddItem Rs!MAX_PRIJAV
    Rs.MoveNext
Next i

List2.ListIndex = k
List3.ListIndex = k
List4.ListIndex = k
List5.ListIndex = k
List6.ListIndex = k
Combo3.AddItem "*"
    
DB.Close

End If


End Sub

Public Sub Form_Load()

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

popravljanje = "False"

'Delavnice
Set WS = DBEngine.Workspaces(0)
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
Set Rs = DB.OpenRecordset("DELAVNICE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
For i = 1 To Max
    Combo3.AddItem Rs!IME
    List2.AddItem Rs!IME
    List3.AddItem Rs!MIN_STAROST
    List4.AddItem Rs!MAX_STAROST
    List6.AddItem Rs!MAX_PRIJAV
    Rs.MoveNext
Next i

Combo3.AddItem "*"

'Skupine
Set Rs = DB.OpenRecordset("SKUPINE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
For i = 1 To Max
    Combo2.AddItem Rs!SKUPINE
    Rs.MoveNext
Next i

'Prijave
Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
For i = 1 To Max
    If DATUMx <> Rs!DATUM_STR Then
    Combo4.AddItem Rs!DATUM_STR
    End If
    DATUMx = Rs!DATUM_STR
    Rs.MoveNext
Next i

Combo4.Text = Format(Date, "d.M.yyyy")

'close the database
DB.Close

DATUMx = Format(Date, "d.M.yyyy")
List (DATUMx)
    
'Velikost majice
Combo1.AddItem "XS"
Combo1.AddItem "S"
Combo1.AddItem "M"
Combo1.AddItem "L"
Combo1.AddItem "XL"
Combo1.AddItem "XXL"

Command3.Enabled = True
Command2.Enabled = False

End Sub




Public Function Add()
'This function will show you how to add a record to the database which
'i have created already with access 2000

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)

If Text2.Text <> "" And Text1.Text <> "" And Combo3.Text <> "" Then

'Tells the database we want to add a new record to the recordset
Rs.AddNew

'Put the data in the proper fields
'RS is your recordset and ("field_name") points to the field you want to
'set the data for
Rs("ST_IZKAZNICE") = Text1.Text
Rs("IME") = Text2.Text
Rs("PRIIMEK") = Text5.Text
Rs("DELAVNICA") = Combo3.Text
Rs("ST_DELAVNICE") = Combo3.ListIndex
Rs("DATUM") = Date
Rs("DATUM_STR") = Format(Date, "d.M.yyyy")
Rs("SKUPINA2") = Combo2.Text
Rs("URA") = Time
If Combo2.Text = "ANIMATOR" Then
Rs("SKUPINA") = "A"
Else
Rs("SKUPINA") = "."
End If

'Update the database. If you dont, the database will add it, but
'it wont be visible
Rs.Update
Else
Combo3.Text = ""
If Text2.Text = "" And Text1.Text <> "" Then
Label13.Caption = "KODE NI V BAZI !"
        Label13.BackColor = &HFF&
        cmdOn (2)
        cmdOff (0)
        cmdOff (1)
Timer2.Enabled = True
End If
End If
'close the database
DB.Close

End Function


Private Sub Command2_Click()


'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max

    
    
    If Rs!ST_IZKAZNICE = Text1.Text Then
            Label13.Caption = "PODATKI SPREMNJENI"
        Label13.BackColor = &H8000&
    Rs.Edit
    
        Rs!IME = Text2.Text
        Rs!PRIIMEK = Text5.Text
        Rs!PLACAL = Text3.Text
        Rs!POSTA = Text12.Text
        Rs!NASLOV = Text9.Text
         Rs!TEL = Text14.Text
        Rs!starost = Text6.Text
       Rs!VELIKOST_MAJICE = Combo1.Text
        Rs!SKUPINA = Combo2.Text
       Rs!MAJICA = Check3.Value
         Rs!BAZEN = Check1.Value
        Rs!PRIJAVNICA = Check2.Value
        
               Rs.Update
        i = Max
        
        
    Timer2.Enabled = True
    

    End If
  
    Rs.MoveNext
Next i

      ' Close recordset
      Rs.Close
      



End Sub

Private Function List(Izbrani_Datum)
'This function will show you how to list all of the records
'in a table

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

mode = "PRIJAVE"

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)

'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF

'clear the list
List1.Clear
List7.Clear
D0.Clear
D1.Clear
D2.Clear
D3.Clear
D4.Clear
D5.Clear
D6.Clear
D7.Clear
D8.Clear
D9.Clear
D10.Clear
D11.Clear
D12.Clear
D13.Clear
D14.Clear

'do the loop
For i = 1 To Max
    If Rs("DATUM_STR") = Izbrani_Datum Then
    j = j + 1
    List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA") & "  ::  " & Rs("SKUPINA")
    List7.AddItem Rs("ST_IZKAZNICE")
        If Rs("ST_DELAVNICE") = 0 Then D0.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 1 Then D1.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 2 Then D2.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 3 Then D3.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 4 Then D4.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 5 Then D5.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 6 Then D6.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 7 Then D7.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 8 Then D8.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 9 Then D9.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 10 Then D10.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 11 Then D11.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 12 Then D12.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 13 Then D13.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
        If Rs("ST_DELAVNICE") = 14 Then D14.AddItem Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("SKUPINA")
    End If
    
    'move to next record. You can do different things such as
    'RS.MoveNext or RS.Move i, i will use
    Rs.MoveNext
Next i

Combo4.Text = Izbrani_Datum
List5.Clear
List5.AddItem D0.ListCount
List5.AddItem D1.ListCount
List5.AddItem D2.ListCount
List5.AddItem D3.ListCount
List5.AddItem D4.ListCount
List5.AddItem D5.ListCount
List5.AddItem D6.ListCount
List5.AddItem D7.ListCount
List5.AddItem D8.ListCount
List5.AddItem D9.ListCount
List5.AddItem D10.ListCount
List5.AddItem D11.ListCount
List5.AddItem D12.ListCount
List5.AddItem D13.ListCount
List5.AddItem D14.ListCount
List5.ListIndex = List2.ListIndex

Text1.Enabled = True
    Text2.Enabled = True
    Text5.Enabled = True
    Text6.Enabled = True
    Text3.Enabled = True
    Text12.Enabled = True
    Text9.Enabled = True
    Text14.Enabled = True
    Text7.Enabled = True
    Combo1.Enabled = True
    Combo2.Enabled = True
    Check3.Enabled = True
    Check1.Enabled = True
    Check2.Enabled = True
    Command2.Enabled = True
    Command3.Enabled = True
    Command6.Enabled = True
    Command1.Caption = "ROCNA PRIJAVA"

End Function

Function List_Podatki()
'This function will show you how to list all of the records
'in a table

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

mode = "PODATKI"

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)

'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF

'clear the list
List1.Clear


'do the loop
For i = 1 To Max
    ' If Rs("DATUM_STR") = Izbrani_Datum Then
    j = j + 1
    Index(j) = i
    List1.AddItem j & "  ::  " & Rs("ST_IZKAZNICE") & "  ::  " & Rs("IME") & " " & Rs("PRIIMEK") & "  ::  " & Rs("STAROST")
    ' End If
    
    'move to next record. You can do different things such as
    'RS.MoveNext or RS.Move i, i will use
    Rs.MoveNext
Next i

Text1.Text = ""
Combo4.Text = Izbrani_Datum

Text1.Enabled = True
    Text2.Enabled = True
    Text5.Enabled = True
    Text6.Enabled = True
    Text3.Enabled = True
    Text12.Enabled = True
    Text9.Enabled = True
    Text14.Enabled = True
    Text7.Enabled = True
    Combo1.Enabled = True
    Combo2.Enabled = True
    Check3.Enabled = True
    Check1.Enabled = True
    Check2.Enabled = True
    Command2.Enabled = False
    Command3.Enabled = True
    Command6.Enabled = True
    Command1.Caption = "ROCNA PRIJAVA"

End Function

Private Function List_Stanje(Izbrani_Datum)
'This function will show you how to list all of the records
'in a table

If Izbrani_Datum = "" Then
Combo4.Text = Format(Date, "d.M.yyyy")
Izbrani_Datum = Format(Date, "d.M.yyyy")
End If

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long

mode = "ISCI_PRIJAVE"

'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)

'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF

'clear the list
List1.Clear
List7.Clear

'do the loop
For i = 1 To Max

If Text5.Text <> "" Then

If Combo3.Text = "*" Then
  If Rs("DATUM_STR") = Izbrani_Datum And Rs("PRIIMEK") = Text5.Text Then
    If Text2.Text <> "" Then
        If Rs("IME") = Text2.Text Then
        j = j + 1
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        List7.AddItem Rs("ST_IZKAZNICE")
        End If
    Else
        j = j + 1
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        List7.AddItem Rs("ST_IZKAZNICE")
    End If
  End If
Else
    If Rs("DATUM_STR") = Izbrani_Datum And Rs("DELAVNICA") = Combo3.Text And Rs("PRIIMEK") = Text5.Text Then
    If Text2.Text <> "" Then
        If Rs("IME") = Text2.Text Then
        j = j + 1
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        List7.AddItem Rs("ST_IZKAZNICE")
        End If
    Else
        j = j + 1
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        List7.AddItem Rs("ST_IZKAZNICE")
    End If
    End If
End If

Else

If Combo3.Text = "*" Then
  If Rs("DATUM_STR") = Izbrani_Datum Then
    If Text2.Text <> "" Then
        If Rs("IME") = Text2.Text Then
        j = j + 1
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        List7.AddItem Rs("ST_IZKAZNICE")
        End If
    Else
        j = j + 1
        List7.AddItem Rs("ST_IZKAZNICE")
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
    End If
  End If
Else
    If Rs("DATUM_STR") = Izbrani_Datum And Rs("DELAVNICA") = Combo3.Text Then
    j = j + 1
    If Text2.Text <> "" Then
        If Rs("IME") = Text2.Text Then
        j = j + 1
        List7.AddItem Rs("ST_IZKAZNICE")
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
        End If
    Else
        j = j + 1
        List7.AddItem Rs("ST_IZKAZNICE")
        List1.AddItem j & "  ::  " & Rs("URA") & "  ::  " & Rs!IME & " " & Rs("PRIIMEK") & "  ::  " & Rs("DELAVNICA")
    End If
    End If
End If

End If
    Rs.MoveNext
Next i
Text1.Text = ""
Combo4.Text = Izbrani_Datum

Text1.Enabled = True
    Text2.Enabled = True
    Text5.Enabled = True
    Text6.Enabled = True
    Text3.Enabled = True
    Text12.Enabled = True
    Text9.Enabled = True
    Text14.Enabled = True
    Text7.Enabled = True
    Combo1.Enabled = True
    Combo2.Enabled = True
    Check3.Enabled = True
    Check1.Enabled = True
    Check2.Enabled = True
    Command2.Enabled = True
    Command3.Enabled = True
    Command6.Enabled = True
    Command1.Caption = "ROCNA PRIJAVA"

End Function

Public Function Delete()
'This function will show how to delete records

'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim i As Long

If List1.SelCount = 1 Then
    i = List1.ListIndex
    
    'This sets a workspace for the database
    Set WS = DBEngine.Workspaces(0)
    'this opens the database
    Set DB = WS.OpenDatabase(App.Path & "\dbtut.mdb")
    'this opens a table inside the database
    Set Rs = DB.OpenRecordset("email", dbOpenTable)
    
    'Move to the record
    Rs.Move i
    
    'Tell the Database you want to delete the record
    Rs.Delete
    'Simple isnt it?!
           
    'close the database
    DB.Close
Else
    MsgBox "Select a name from the list box"
    Exit Function
End If

End Function

Private Sub Command5_Click()
DATUMx = Format(Date, "d.M.yyyy")
List (DATUMx)
Text1.Text = ""
 Text2.Text = ""
        Text5.Text = ""
        Text6.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text7.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Combo3.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
        Label13.Caption = "UREJANJE"
        Label13.BackColor = &HFF8080
        cmdOff (1)
        cmdOff (0)
        cmdOff (2)
        Command3.Enabled = True
Command2.Enabled = False
Command3.Caption = "NOV VPIS"
End Sub

Private Sub Command6_Click()
If Combo3.Text = "" Then
    List_Podatki
Else
    List_Stanje (Combo4.Text)
End If


Command3.Caption = "NOV VPIS"
Command3.Enabled = True
Command2.Enabled = False
End Sub

Private Sub Command9_Click()
Text1.Text = ""
Text11.Text = ""
Text15.Text = ""
Command3.Caption = "NOV VPIS"
Command3.Enabled = True
Command2.Enabled = False
Text1_KeyPress (vbKeyReturn)

Text1.SetFocus
mode = "novo"

End Sub

Public Function List1_klik()

Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
If mode = "PODATKI" Then
Label13.Caption = "UREJANJE"
        Label13.BackColor = &HFF8080
        Command3.Caption = "NOV VPIS"
        cmdOff (1)
        cmdOff (0)
        cmdOff (2)
Command3.Enabled = False
Command2.Enabled = True
'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)

i = Index(List1.ListIndex)
Rs.Move i
        Text1.Text = Rs!ST_IZKAZNICE
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        
        
DB.Close

Else


Set WS = DBEngine.Workspaces(0)
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
List7.ListIndex = List1.ListIndex
n = 0
For i = 1 To Max
    If Rs("DATUM_STR") = Combo4.Text And Rs("ST_IZKAZNICE") = Int(List7.Text) Then
    pozicija = i
    n = n + 1
    End If
    Rs.MoveNext
Next i

Set Rs = DB.OpenRecordset("PRIJAVE", dbOpenTable)
Max = Rs.RecordCount
Rs.Move BOF
POZICIJA_PRIJAVE = pozicija - 1
Rs.Move POZICIJA_PRIJAVE
st_izk = Rs("ST_IZKAZNICE")

Set Rs5 = DB.OpenRecordset("PODATKI", dbOpenTable)

Max5 = Rs5.RecordCount
Rs5.Move BOF

For i = 1 To Max5
    If st_izk = Rs5("ST_IZKAZNICE") Then
        Text1.Text = Rs5!ST_IZKAZNICE
        Text2.Text = Rs5!IME
        Text5.Text = Rs5!PRIIMEK
        Text3.Text = Rs5!PLACAL
        Text12.Text = Rs5!POSTA
        Text9.Text = Rs5!NASLOV
        Text14.Text = Rs5!TEL
        Text6.Text = Rs5!starost
        Combo1.Text = Rs5!VELIKOST_MAJICE
        Combo2.Text = Rs5!SKUPINA
        Check3.Value = Rs5!MAJICA
        Check1.Value = Rs5!BAZEN
        Check2.Value = Rs5!PRIJAVNICA
    End If
    Rs5.MoveNext
Next i

If mode = "PRIJAVE" Then
If Rs!DELAVNICA <> Null Then
Combo3.Text = Rs!DELAVNICA
End If
End If

    
    
    Text1.Enabled = False
    Text2.Enabled = False
    Text5.Enabled = False
    Text6.Enabled = False
    Text3.Enabled = False
    Text12.Enabled = False
    Text9.Enabled = False
    Text14.Enabled = False
    Text7.Enabled = False
    Combo1.Enabled = False
    Combo2.Enabled = False
    Check3.Enabled = False
    Check1.Enabled = False
    Check2.Enabled = False
    Command2.Enabled = False
    Command3.Enabled = False
    Command6.Enabled = False
    Command1.Caption = "POPRAVI"
    
    Label13.Caption = "DRUGA DELAVNICA ?"
    Label13.BackColor = &HFF8080
    cmdOff (1)
    cmdOff (0)
    cmdOff (2)
    Combo3.SetFocus
    
DB.Close
End If


End Function

Private Sub List1_Click()
List1_klik
End Sub

Private Sub List2_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List2.ListIndex
List4.ListIndex = List2.ListIndex
List5.ListIndex = List2.ListIndex
List6.ListIndex = List2.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List2_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List2.ListIndex
List4.ListIndex = List2.ListIndex
List5.ListIndex = List2.ListIndex
List6.ListIndex = List2.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List3_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List2.ListIndex = List3.ListIndex
List4.ListIndex = List3.ListIndex
List5.ListIndex = List3.ListIndex
List6.ListIndex = List3.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List3_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
List2.ListIndex = List3.ListIndex
List4.ListIndex = List3.ListIndex
List5.ListIndex = List3.ListIndex
List6.ListIndex = List3.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List4_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List4.ListIndex
List2.ListIndex = List4.ListIndex
List5.ListIndex = List4.ListIndex
List6.ListIndex = List4.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List4_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List4.ListIndex
List2.ListIndex = List4.ListIndex
List5.ListIndex = List4.ListIndex
List6.ListIndex = List4.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List5_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List5.ListIndex
List4.ListIndex = List5.ListIndex
List2.ListIndex = List5.ListIndex
List6.ListIndex = List5.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List5_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List5.ListIndex
List4.ListIndex = List5.ListIndex
List2.ListIndex = List5.ListIndex
List6.ListIndex = List5.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List6_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List6.ListIndex
List4.ListIndex = List6.ListIndex
List2.ListIndex = List6.ListIndex
List5.ListIndex = List6.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub
Private Sub List6_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
List3.ListIndex = List6.ListIndex
List4.ListIndex = List6.ListIndex
List2.ListIndex = List6.ListIndex
List5.ListIndex = List6.ListIndex
Text13.Text = List2.Text
Text4.Text = List6.Text
Text8.Text = List3.Text
Text10.Text = List4.Text
End Sub

Private Sub Picture1_Click()
OpenURL ("http://oratorij.litija.org/")
End Sub
Private Sub OpenURL(strURL As String)

    ShellExecute Me.hWnd, "open", strURL, vbNullString, "C:\", ByVal 1&
End Sub



Private Sub Text1_GotFocus()
If Command3.Caption = "NOV VPIS" Then
If Text1.Text = "" And _
Text2.Text = "" And _
Text5.Text = "" And _
Text3.Text = "" And _
Text12.Text = "" And _
Text9.Text = "" And _
Text14.Text = "" And _
Text6.Text = "" And _
Combo1.Text = "" And _
Combo2.Text = "" Then
Label13.Caption = "PRIPRAVLJEN"
        Label13.BackColor = &H80C0FF

cmdOn (0)
cmdOff (1)
cmdOff (2)

End If
End If
End Sub
Private Sub cmdOn(Index As Integer)
' prizge diode na tipkovnici
   GetSetKS False, IIf(Index = 0, 1, 0), IIf(Index = 1, 1, 0), IIf(Index = 2, 1, 0)
End Sub
Private Sub cmdOff(Index As Integer)
 ' ugasne diode na tipkovnici
   GetSetKS False, IIf(Index = 0, 2, 0), IIf(Index = 1, 2, 0), IIf(Index = 2, 2, 0)
End Sub

Private Sub Text1_KeyPress(KeyAscii As Integer)
If Check5.Value = 0 And Check6.Value = 0 And Check11.Value = 0 Then
If Command3.Caption = "NOV VPIS" Then

  If KeyAscii = vbKeyReturn Then
'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how many records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!ST_IZKAZNICE = Text1.Text Then
         
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        

        
        If Combo3.Text = "" Then
        Label13.Caption = "IZBERI DELAVNICO !"
        Label13.BackColor = &HFF&
        cmdOn (1)
        cmdOff (0)
        cmdOff (2)
        
        Else
        starost = 0
        polno = 0
        If Combo3.ListIndex <> 15 And Rs!SKUPINA <> "ANIMATOR" Then
        List6.ListIndex = Combo3.ListIndex
        List3.ListIndex = Combo3.ListIndex
        List4.ListIndex = Combo3.ListIndex
        List5.ListIndex = Combo3.ListIndex
        List2.ListIndex = Combo3.ListIndex
        If List6.ListIndex = 0 And D0.ListCount >= List6.Text Then
        polno = 1
        
       End If
        If List6.ListIndex = 1 And D1.ListCount >= List6.Text Then
        polno = 1
        
        End If
        If List6.ListIndex = 2 And D2.ListCount >= List6.Text Then
        polno = 1
       
        End If
        If List6.ListIndex = 3 And D3.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 4 And D4.ListCount >= List6.Text Then
        polno = 1
                
        End If
        If List6.ListIndex = 5 And D5.ListCount >= List6.Text Then
        polno = 1
                
        End If
        If List6.ListIndex = 6 And D6.ListCount >= List6.Text Then
        polno = 1
                
        End If
        If List6.ListIndex = 7 And D7.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 8 And D8.ListCount >= List6.Text Then
        polno = 1
                
        End If
        If List6.ListIndex = 9 And D8.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 10 And D10.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 11 And D11.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 12 And D12.ListCount >= List6.Text Then
        polno = 1
                
        End If
        If List6.ListIndex = 13 And D13.ListCount >= List6.Text Then
        polno = 1
               
        End If
        If List6.ListIndex = 14 And D14.ListCount >= List6.Text Then
        polno = 1
               
        End If
        minimalna_starost = Int(List3.Text)
        maximalna_starost = Int(List4.Text)
        If Rs!starost < minimalna_starost Then starost = 1
        If Rs!starost > maximalna_starost Then starost = 2
       
        End If
        
        

                                
        
        If starost = 1 And Check10.Value = 0 Then
        
        Label13.Caption = "PREMLAD SI !"
        Label13.BackColor = &HFF&
        cmdOn (1)
        cmdOff (0)
        cmdOff (2)
        Combo3.Text = ""
        Else
        If starost = 2 And Check10.Value = 0 Then
        Label13.Caption = "PRESTAR SI !"
        Label13.BackColor = &HFF&
        cmdOn (1)
        cmdOff (0)
        cmdOff (2)
        Combo3.Text = ""
        Else
        If polno = 1 And Check9.Value = 0 Then
        Label13.Caption = "DELAVNICA JE POLNA"
        Label13.BackColor = &HFF&
        cmdOn (1)
        cmdOff (0)
        cmdOff (2)
        Combo3.Text = ""
        MsgBox "DELAVNICA POLNA PRIŽGI RDECO LUC", , "Napaka"
        Else
        Label13.Caption = "PRIJAVA USPELA"
        Label13.BackColor = &H8000&
        cmdOff (1)
        cmdOff (0)
        cmdOff (2)

        End If
        End If
        End If
        End If
        
        i = Max
        
        Timer2.Enabled = True
    
    Else
        
        Text2.Text = ""
        Text5.Text = ""
        Text6.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text7.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
        Label13.Caption = "PRIPRAVLJEN"
        Label13.BackColor = &H80C0FF
        cmdOn (0)
        cmdOff (1)
        cmdOff (2)
         Command3.Enabled = True
Command2.Enabled = False
    End If
    
    Rs.MoveNext
Next i

        Dim Rs1 As Recordset
        Set Rs1 = DB.OpenRecordset("DELAVNICE", dbOpenTable)
        Max1 = Rs1.RecordCount
        Rs1.Move BOF
        For i = 1 To Max1
            If Text7.Text = Rs1!KODA Then
                Combo3.ListIndex = Rs1!ST
            End If
        Rs1.MoveNext
        Next i

        
        Dim Rs2 As Recordset
        Set Rs2 = DB.OpenRecordset("PRIJAVE", dbOpenTable)
        Max2 = Rs2.RecordCount
        Rs2.Move BOF
        For i = 1 To Max2
        


        
            If Text1.Text = Rs2("ST_IZKAZNICE") And Combo3.Text = Rs2("DELAVNICA") And Rs2("SKUPINA") = "." And Check4 = 1 And Combo3.Text <> "Najmlajsi" Then
    
        
                Label13.Caption = "SI ŽE BIL NA TEJ DELAVNICI"
                
                Label13.BackColor = &HFF&
                MsgBox "JE ZE BIL NA TEJ DELAVNICI", , "Napaka"
                
                cmdOff (0)
                cmdOff (1)
                cmdOn (2)
               
                Combo3.Text = ""
            End If
            
            If Combo2.Text = "Najmlajsi" And Combo3.Text <> "Najmlajsi" And Check8.Value = 0 Then
                Label13.Caption = "NAJMLAJSI SE NI PRIJAVIL PRAVILNO"
                Label13.BackColor = &HFF&
                
            Combo3.Text = ""
End If
                        If Text1.Text = Rs2("ST_IZKAZNICE") And Date = Rs2("DATUM") And Combo3.Text <> "" Then
    

                Label13.Caption = "DELAVNICA SPREMENJENA"
                Label13.BackColor = &HFF&
                                
               Rs2.Delete

                
            End If
                

        
        Rs2.MoveNext
        Next i

      
      ' Close recordset
      Rs.Close
      
      
'Add to the DB
Add

DATUMx = Format(Date, "d.M.yyyy")
List (DATUMx)

Else
If KeyAscii < 48 Or KeyAscii > 57 Then
prepisi = 1
End If
End If
Command3.Enabled = True
Command2.Enabled = False
Else
If KeyAscii = vbKeyReturn Then
Text2.SetFocus
End If
End If
End If

If Check5.Value = 1 And Check6.Value = 0 And Check11.Value = 0 Then
  If KeyAscii = vbKeyReturn Then


'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!ST_IZKAZNICE = Text1.Text Then
    
        Text1.Text = Rs!ST_IZKAZNICE
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        
        If Rs!BAZEN = "1" Then
        Label13.Caption = "SI SE ŽE PRIJAVIL NA BAZEN"
        Label13.BackColor = &HC000C0
        End If
        
       If Rs!BAZEN = "0" Then
        Label13.Caption = "PRIJAVA NA BAZEN USPRLA"
        Label13.BackColor = &HC000C0
        Rs.Edit
        Rs!BAZEN = "1"
        Rs.Update
        End If
        
        
        i = Max
        
        
        Timer2.Enabled = True

        
    

    End If
    
    Rs.MoveNext
Next i

      ' Close recordset
      Rs.Close
      


End If
End If


If Check6.Value = 1 And Check5.Value = 0 And Check11.Value = 0 Then

  If KeyAscii = vbKeyReturn Then



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!ST_IZKAZNICE = Text1.Text Then
    
        ' Text1.Text = Rs!ST_IZKAZNICE
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        
        
        If Rs!MAJICA = "1" Then
        Label13.Caption = "SI ŽE VZEL MAJICO"
        Label13.BackColor = &H8000000D
        End If
        
      If Rs!MAJICA = "0" Then
      Label13.Caption = "IMAS NOVO MAJCO"
        Label13.BackColor = &H8000000D
        Rs.Edit
        Rs!MAJICA = "1"
        Rs.Update
        End If
        
        
        i = Max
        
        
        Timer2.Enabled = True

        
    

    End If
    
    Rs.MoveNext
Next i

      ' Close recordset
      Rs.Close
      End If
      End If
      
      If Check6.Value = 0 And Check5.Value = 0 And Check11.Value = 1 Then

  If KeyAscii = vbKeyReturn Then



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!ST_IZKAZNICE = Text1.Text Then
    
        ' Text1.Text = Rs!ST_IZKAZNICE
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        
        
        If Rs!IZLET = "1" Then
        Label13.Caption = "SI ŽE SEL NA IZLET"
        Label13.BackColor = &H8000000D
        End If
        
      If Rs!IZLET = "0" Then
      Label13.Caption = "GES NA IZLET"
        Label13.BackColor = &H8000000D
        Rs.Edit
        Rs!IZLET = "1"
        Rs.Update
        End If
        
        
        i = Max
        
        
        Timer2.Enabled = True

        
    

    End If
    
    Rs.MoveNext
Next i

      ' Close recordset
      Rs.Close
      End If
      End If
      
      Label28.Caption = "     PRIJAVILO SE JIH JE " & List1.ListCount & " OD " & Max
      Label28.FontBold = True

End Sub


Private Sub Text1_LostFocus()
If Command3.Caption = "NOV VPIS" Then
Label13.Caption = "UREJANJE"
        Label13.BackColor = &HFF8080
                cmdOff (2)
                cmdOff (0)
                cmdOff (1)
End If
End Sub

Private Sub Timer1_Timer()
'Updates the time on the title bar
        Dim DB As Database
        Dim Rs As Recordset
        Dim WS As Workspace
        Dim Max As Long
        
        'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how many records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
        
    Me.Caption = "Prijava na oratorij BY ALEN dne " & Format(Date, "dddd, d.M.yyyy") & "  " & Format(Time, "h.mm.ss")
    Label16.Caption = "" & Format(Date, "d.M.yyyy") & " - " & Format(Time, "h.mm.ss")
    Label16.FontBold = True
 Label28.Caption = "     PRIJAVILO SE JIH JE " & List1.ListCount & " OD " & Max
 Label28.FontBold = True


    If prepisi = 1 Then

        


        'Delavnice
        Set WS = DBEngine.Workspaces(0)
        Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
        Set Rs = DB.OpenRecordset("DELAVNICE", dbOpenTable)
        Max = Rs.RecordCount
        Rs.Move BOF
        For i = 1 To Max
            If Text1.Text = Rs!KODA Then
                Combo3.ListIndex = Rs!ST
                i = Max
            Else
                Combo3.Text = ""
            End If
        Rs.MoveNext
        Next i

        'close the database
        DB.Close
        
        Text7.Text = Text1.Text
        Text1.Text = ""
        prepisi = 0
        
    End If
End Sub
Private Sub COM_Click()
    Form1.Show vbModal, Me
End Sub


Private Sub text11_click()
  Label13.Caption = "ISKANJE PO KODI"
        Label13.BackColor = &HFF0000
List_Podatki
Command2.Enabled = True

End Sub

Private Sub Timer2_Timer()
Text1.Text = ""
Text1_KeyPress (vbKeyReturn)
Text1.Enabled = True
Text1.SetFocus
Timer2.Enabled = False
        
        Text5.Text = ""
        Text2.Text = ""
        Text3.Text = ""
        Text12.Text = ""
        Text9.Text = ""
        Text14.Text = ""
        Text6.Text = ""
        Combo1.Text = ""
        Combo2.Text = ""
        Check3.Value = 0
        Check1.Value = 0
        Check2.Value = 0
        Text11.Text = ""
        Text15.Text = ""
       Check8.Value = 0
       Check9.Value = 0
       Check10.Value = 0
        
        
                Label13.Caption = "PRIPRAVLJEN"
        Label13.BackColor = &H80C0FF
        
       
        
End Sub

Private Sub Text15_click()
If Command3.Caption = "NOV VPIS" Then

Label13.Caption = "ISKANJE PO IMENU"
Label13.BackColor = &H8000000D
End If

End Sub

Private Sub check7_click()
If Check7.Value = 1 Then
Check5.Enabled = True
Check6.Enabled = True
Check11.Enabled = True
Else
Check5.Enabled = False
Check6.Enabled = False
Check11.Enabled = False
Check5.Value = 0
Check6.Value = 0
Check11.Value = 0
End If

End Sub


Private Sub Text15_KeyPress(KeyAscii As Integer)
If Command3.Caption = "NOV VPIS" Then

  If KeyAscii = vbKeyReturn Then
'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!IME & " " & Rs!PRIIMEK = Text15.Text Then
    
    
        Text2.Text = Rs!IME
        Text1.Text = Rs!ST_IZKAZNICE
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
              
        
        
        i = Max
 Timer2.Enabled = False

 
 
 
        
    

    
    
    End If
    Rs.MoveNext
Next i
        
      
      ' Close recordset
      Rs.Close
Command2.Enabled = True

End If
End If
   
End Sub


Private Sub Text11_KeyPress(KeyAscii As Integer)
If Command3.Caption = "NOV VPIS" Then

  If KeyAscii = vbKeyReturn Then
'Dim our variables
Dim DB As Database
Dim Rs As Recordset
Dim WS As Workspace
Dim Max As Long
Dim starost As Integer



'This sets a workspace for the database
Set WS = DBEngine.Workspaces(0)
'this opens the database
Set DB = WS.OpenDatabase(App.Path & "\oratorij.mdb")
'this opens a table inside the database
Set Rs = DB.OpenRecordset("PODATKI", dbOpenTable)
'Get how manby records are in the table
Max = Rs.RecordCount

'Move to the begining of the file, or you can do
'RS.MoveFirst or RS.Move 1, but i prefer this
Rs.Move BOF
      
For i = 1 To Max
    
    If Rs!ST_IZKAZNICE = Text11.Text Then
        Text1.Text = Rs!ST_IZKAZNICE
        Text2.Text = Rs!IME
        Text5.Text = Rs!PRIIMEK
        Text3.Text = Rs!PLACAL
        Text12.Text = Rs!POSTA
        Text9.Text = Rs!NASLOV
        Text14.Text = Rs!TEL
        Text6.Text = Rs!starost
        Combo1.Text = Rs!VELIKOST_MAJICE
        Combo2.Text = Rs!SKUPINA
        Check3.Value = Rs!MAJICA
        Check1.Value = Rs!BAZEN
        Check2.Value = Rs!PRIJAVNICA
        
              
        i = Max
        
        
    Timer2.Enabled = False
    

    End If
    
    Rs.MoveNext
Next i

      ' Close recordset
      Rs.Close
      

End If
End If
   
End Sub
