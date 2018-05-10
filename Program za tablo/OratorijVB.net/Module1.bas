Attribute VB_Name = "Module1"
' Declares
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Sub keybd_event Lib "user32" (ByVal bVK As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
   
' Function to get or set keyboard states
Public Function GetSetKS(ByVal bolGetSetKS As Boolean, _
                                 Optional ByVal intGetSetKSNumLock As Integer = 0, _
                                 Optional ByVal intGetSetKSScrollLock As Integer = 0, _
                                 Optional ByVal intGetSetKSCapsLock As Integer = 0) As String

   ' Check if get or set keystate
   If bolGetSetKS = True Then ' Get keystate
      GetSetKS = IIf(CBool(GetKeyState(vbKeyNumlock) And 1) = False, 1, 0) & "," & _
                         IIf(CBool(GetKeyState(vbKeyScrollLock) And 1) = True, 1, 0) & "," & _
                         IIf(CBool(GetKeyState(vbKeyCapital) And 1) = True, 1, 0)
   Else ' Set keystate
      ' Num lock
      Select Case intGetSetKSNumLock
         Case 1 ' On

         Case 2 ' Off

         Case 3 ' Toggle

      End Select
      ' Scroll lock
      Select Case intGetSetKSScrollLock
         Case 1 ' On

         Case 2 ' Off

         Case 3 ' Toggle

      End Select
      ' Caps lock
      Select Case intGetSetKSCapsLock
         Case 1 ' On
        
         Case 2 ' Off
            
         Case 3 ' Toggle
            
      End Select
      ' Let windows have resources
      DoEvents
   End If
End Function




Sub Main()
    Dim fLogin As New frmLogin
    fLogin.Show vbModal
    If Not fLogin.OK Then
        'Login Failed so exit app
        End
    End If
    Unload fLogin


    frmSplash.Show
    frmSplash.Refresh
frmSplash.Refresh
    Set fMainForm = New PRIJAVE
    Load fMainForm

    Unload frmSplash


    fMainForm.Show
End Sub

