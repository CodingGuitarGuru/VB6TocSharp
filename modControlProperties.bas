Attribute VB_Name = "modControlProperties"
Option Explicit

Public Function ConvertControlProperty(ByVal Src As String, ByVal vProp As String, ByVal cType As String) As String
If IsInStr(vProp, "SetF") Then Stop
  Select Case vProp
    Case "Visible": ConvertControlProperty = "Visibility"
    Case "Enabled": ConvertControlProperty = "IsEnabled"
    Case "TabStop": ConvertControlProperty = "IsTabStop"
    Case "SelStart": ConvertControlProperty = "SelectionStart"
    Case "SelLength": ConvertControlProperty = "SelectionLength"
    Case "Caption"
      If cType = "VB.Label" Then ConvertControlProperty = "Content"
    Case "Value"
      If cType = "VB.CheckBox" Then ConvertControlProperty = "Checked"
    Case ""
      Select Case cType
        Case "VB.Caption": ConvertControlProperty = "Content"
        Case "VB.TextBox": ConvertControlProperty = "Text"
        Case "VB.ComboBox": ConvertControlProperty = "Text"
        Case "VB.RadioButton": ConvertControlProperty = "IsChecked"
        Case "VB.CheckBox": ConvertControlProperty = "IsChecked"
        Case Else: ConvertControlProperty = "DefaultProperty"
      End Select
    Case Else: ConvertControlProperty = vProp
  End Select
End Function