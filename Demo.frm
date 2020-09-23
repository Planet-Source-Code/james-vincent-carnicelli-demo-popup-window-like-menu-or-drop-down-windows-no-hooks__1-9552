VERSION 5.00
Begin VB.Form Demo 
   Caption         =   "Form1"
   ClientHeight    =   1170
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3795
   LinkTopic       =   "Form1"
   ScaleHeight     =   1170
   ScaleWidth      =   3795
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton InvokePopup 
      Caption         =   "Popup Demo"
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   315
      Width           =   2715
   End
End
Attribute VB_Name = "Demo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub InvokePopup_Click()
    Dim NewPopup As New Popup
    NewPopup.PopupNow Me, InvokePopup
End Sub
