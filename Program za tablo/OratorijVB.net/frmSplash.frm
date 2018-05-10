VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   4440
   ClientLeft      =   6135
   ClientTop       =   3135
   ClientWidth     =   8220
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "frmSplash.frx":030A
   ScaleHeight     =   4440
   ScaleWidth      =   8220
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture2 
      Height          =   1215
      Left            =   2880
      Picture         =   "frmSplash.frx":0350
      ScaleHeight     =   1155
      ScaleWidth      =   4875
      TabIndex        =   2
      Top             =   1200
      Width           =   4935
   End
   Begin VB.PictureBox Picture1 
      Height          =   2295
      Left            =   240
      Picture         =   "frmSplash.frx":13476
      ScaleHeight     =   2235
      ScaleWidth      =   2355
      TabIndex        =   1
      Top             =   600
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "Licenca za: ORATORIJ Litija                                      Copyright:2009                                        S/N:0000"
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   3840
      Width           =   7455
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
