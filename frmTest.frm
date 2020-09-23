VERSION 5.00
Begin VB.Form frmTest 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1800
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "frmTest"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    ' Mark!!! To set key in registry enter first SubFolder then your key
    ' Like this: "Software\Testing\subkey"
    modRegSettings.CreateRegistryKey HKEY_LOCAL_MACHINE, "Software\Testing\subkey"
    
    'Now enter the key value you want to save.
    modRegSettings.SetRegValue HKEY_LOCAL_MACHINE, "Software\Testing\Subkey", "Subkey1", "Hello"
    
    'Now delete the key value you have created.
    modRegSettings.DeleteValue HKEY_LOCAL_MACHINE, "Software\Testing\Subkey", "Subkey1"
    
    'Now delete the subfolder you created
    modRegSettings.DeleteRegistryKey HKEY_LOCAL_MACHINE, "Software\Testing\Subkey"
    
    ' Now do the total cleanup in registry.
    ' This is the only way to prevent the Windows registry to be exhausted
    ' by undeleted registry values. Use it and windows will not be slower.
    modRegSettings.DeleteRegistryKey HKEY_LOCAL_MACHINE, "Software\Testing"
End Sub

