VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub ProcessSheet()
Dim x As String
For i = 2 To Cells(Rows.Count, 1).End(xlUp).Row Step 1


    x = Cells(i, 1)
        For j = 2 To Cells(Rows.Count, 8).End(xlUp).Row + 1 Step 1
            If Cells(j, 8) = x Then
                'Update Volume
                Cells(j, 11) = Cells(j, 11) + Cells(i, 7)
                'Update Change at end of Year
                Cells(j, 9) = Cells(i, 6) - Cells(j, 12)
                If Cells(j, 9) >= 0 Then
                    Cells(j, 9).Interior.ColorIndex = 4
                Else
                    Cells(j, 9).Interior.ColorIndex = 3
                End If
                    
                'Update Percent Change
                If ((Cells(i, 6) < 0) Or (Cells(i, 6) > 0)) Then
                        Cells(j, 10) = Cells(j, 12) / Cells(i, 6)
                Else
                End If
                'Termination Clause
                j = Cells(Rows.Count, 8).End(xlUp).Row + 1
            ElseIf Cells(j, 8) = "" Then
                'create row info
                Cells(j, 8) = x
                'create volume
                Cells(j, 11) = 0
                'create percent change
                Cells(j, 10) = 1
                'create change to date
                Cells(j, 9) = 0
                'Initialize Year Open
                Cells(j, 12) = Cells(i, 3)
            Else
                End If
        Next j
    Next i
End Sub



