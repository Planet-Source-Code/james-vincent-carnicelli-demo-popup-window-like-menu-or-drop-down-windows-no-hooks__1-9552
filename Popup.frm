VERSION 5.00
Begin VB.Form Popup 
   BackColor       =   &H80000015&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   1425
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2220
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1425
   ScaleWidth      =   2220
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Doodad 
      Height          =   1140
      Left            =   45
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Popup.frx":0000
      Top             =   45
      Width           =   2130
   End
   Begin VB.Timer FocusChecker 
      Interval        =   50
      Left            =   855
      Top             =   765
   End
End
Attribute VB_Name = "Popup"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'Windows API Declarations
Private Type POINTAPI
        x As Long
        y As Long
End Type
Private Declare Function ClientToScreen Lib "user32" (ByVal hwnd As Long, lpPoint As POINTAPI) As Long
Private Declare Function GetActiveWindow Lib "user32" () As Integer

Private MyWindow As Integer
Private WithEvents MyParentForm As Form

Public Sub PopupNow(ParentForm As Form, ParentControl As Control)
    Dim NewPopup As New Popup, Point As POINTAPI
    Set MyParentForm = ParentForm
    
    ClientToScreen ParentControl.hwnd, Point
    Me.Left = Point.x * Screen.TwipsPerPixelX
    Me.Top = Point.y * Screen.TwipsPerPixelY + ParentControl.Height
    Me.Width = ParentControl.Width
    Me.Show
    MyWindow = GetActiveWindow
End Sub

Public Sub Done()
    Unload Me
End Sub



Private Sub FocusChecker_Timer()
    If GetActiveWindow <> MyWindow Then
        Done
    End If
End Sub

Private Sub Form_Resize()
    Doodad.Width = Me.Width - 2 * Doodad.Left
    Doodad.Height = Me.Height - 2 * Doodad.Top
End Sub

Private Sub MyParentForm_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Done
End Sub
