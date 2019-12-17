VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserForm1 
   Caption         =   "ќтчет"
   ClientHeight    =   1080
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7500
   OleObjectBlob   =   "UserForm1.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "UserForm1"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Dim db As Database
Dim rst As Recordset
Dim CurrRow As Integer
Dim FirstPos As Integer
Dim TotalPos As Integer
Dim ColumnCnt As Integer
Dim Awb As String
Dim wb As String
Dim i As Integer
Dim TipRep As String
Dim mon As String
Dim mon1 As String
Dim begin_date As Date
Dim end_date As Date
Dim rep_title As String
Dim rep_id As Integer
Dim Rep_Query As String
Dim XLSName As String

Dim LastGrp As String
Dim LastGrpRow As Integer
Dim LastSubGrp As String
Dim LastSubGrpRow As Integer

Sub Fill_Report()

'  онстанты
XLSName = "TranObl.xls"
FirstPos = 5
CurrRow = 5
TotalPos = 4
ColumnCnt = 6

' »нициализаци€ переменных
LastGrp = " "
LastGrpRow = 0
LastSub = " "
LastSubRow = 0

Set db = Workspaces(0).OpenDatabase(ActiveWorkbook.Path + "\fin_rep.mdb")
Set rst = db.OpenRecordset("SELECT * FROM V_MASTER_REPORTS WHERE UCASE(report_file) = UCASE('" & XLSName & "')", dbOpenSnapshot)
If rst.EOF Then
  begin_date = Now
  end_date = Now
  rep_title = "ќтчет"
  rep_id = 0
Else
  begin_date = rst!begin_date
  end_date = rst!end_date
  rep_title = rst!report_title
  rep_id = rst!rep_id
End If
rst.Close

CommandButton1.Caption = "Just wait..."
UserForm1.Repaint

Select Case Month(end_date)
    Case 1
      mon = "€нвар€"
      mon1 = "€нварь"
    Case 2
      mon = "феврал€"
      mon1 = "февраль"
    Case 3
      mon = "марта"
      mon1 = "март"
    Case 4
      mon = "апрел€"
      mon1 = "апрель"
    Case 5
      mon = "ма€"
      mon1 = "май"
    Case 6
      mon = "июн€"
      mon1 = "июнь"
    Case 7
      mon = "июл€"
      mon1 = "июль"
    Case 8
      mon = "августа"
      mon1 = "август"
    Case 9
      mon = "сент€бр€"
      mon1 = "сент€брь"
    Case 10
      mon = "окт€бр€"
      mon1 = "окт€брь"
    Case 11
      mon = "но€бр€"
      mon1 = "но€брь"
    Case 12
      mon = "декабр€"
      mon1 = "декабрь"
End Select
Cells(2, 2) = rep_title & " с " & Str(Day(begin_date)) & "." & Str(Month(begin_date)) & "." & Str(Year(begin_date)) & " по " & Str(Day(end_date)) & "." & Str(Month(end_date)) & "." & Str(Year(end_date))

Rep_Query = "??????????"
    
Set rst = db.QueryDefs(Rep_Query).OpenRecordset

CommandButton1.Caption = "Almost Ok!"
UserForm1.Repaint
Application.ScreenUpdating = False

While Not rst.EOF
  If LastGrp <> rst![field_grp] Then
    EndSubGrp
    EndGrp
    NewGrp
    NewSubGrp
  Else
    If LastSubGrp <> rst![field_sub_grp] Then
      EndSubGrp
      NewSubGrp
    End If
  End If
  
  Cells(CurrRow, 1) = rst![field1]
  Cells(CurrRow, 2) = rst![field2]
  
  CurrRow = CurrRow + 1
  rst.MoveNext
Wend

EndSubGrp
EndGrp

Cells(TotalPos, 3).FormulaR1C1 = "=SUBTOTAL(9,R[1]C[0]:R[" & Trim(Str(CurrRow - FirstPos)) & "]C[0])"
Range(Cells(TotalPos, 4), Cells(TotalPos, ColumnCnt)).FormulaR1C1 = Cells(TotalPos, 3).FormulaR1C1
Range(Cells(TotalPos, 3), Cells(CurrRow, 3)).NumberFormat = "### ### ### ##0"
Range(Cells(TotalPos, 4), Cells(CurrRow, 4)).NumberFormat = "### ### ### ##0.000"
Range(Cells(TotalPos, 5), Cells(CurrRow, ColumnCnt)).NumberFormat = "### ### ### ##0.00"

With Range(Cells(FirstPos, 1), Cells(CurrRow - 1, ColumnCnt))
  .Borders(xlDiagonalDown).LineStyle = xlNone
  .Borders(xlDiagonalUp).LineStyle = xlNone
  With .Borders(xlEdgeLeft)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
  End With
  With .Borders(xlEdgeTop)
        .LineStyle = xlContinuous
        .Weight = xlMedium
        .ColorIndex = xlAutomatic
  End With
  With .Borders(xlEdgeBottom)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
  End With
  With .Borders(xlEdgeRight)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
  End With
  With .Borders(xlInsideVertical)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
  End With
  With .Borders(xlInsideHorizontal)
        .LineStyle = xlContinuous
        .Weight = xlThin
        .ColorIndex = xlAutomatic
  End With
End With

Awb = ActiveWorkbook.Name
ActiveWorkbook.Sheets(1).Activate
Cells.Copy
wb = Workbooks.Add.Name
ActiveSheet.Paste Destination:=Range("a1")

With Workbooks(wb).ActiveSheet.PageSetup
  .LeftMargin = Application.InchesToPoints(0.7)
  .RightMargin = Application.InchesToPoints(0.7)
  .TopMargin = Application.InchesToPoints(0.7)
  .BottomMargin = Application.InchesToPoints(0.7)
  .Orientation = xlLandscape
  .FitToPagesWide = 1
  .FitToPagesTall = 3
  .Zoom = False
End With
Range("a5").Select
Windows(XLSName).Activate
Range("a1").Copy
Workbooks(wb).Activate
Workbooks(Awb).Close False
Application.ScreenUpdating = True

End Sub

Sub EndGrp()
Dim i As Integer
  If LastGrp <> " " Then
    Cells(CurrRow, 1) = "»того по " & LastGrp
    For i = 3 To ColumnCnt
      Cells(CurrRow, i).FormulaR1C1 = "=Subtotal(9,R[-1]C[0]:R[" & Trim(Str(LastGrpRow - CurrRow)) & "]C[0])"
    Next i
    Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Size = 10
    Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Italic = True
    CurrRow = CurrRow + 1
  End If
End Sub

Sub NewGrp()
'  CurrRow = CurrRow + 1
  LastGrpRow = CurrRow
  LastGrp = rst![field_grp]
'  Cells(CurrRow, 1) = LastGrp
  Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Size = 10
  Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Bold = True
  CurrRow = CurrRow + 1
  LastSubGrp = " "
  LastSubGrpRow = 0
End Sub

Sub EndSubGrp()
Dim i As Integer
  If LastSubGrp <> " " Then
    For i = 3 To ColumnCnt
      Cells(LastSubGrpRow, i).FormulaR1C1 = "=Subtotal(9,R[1]C[0]:R[" & Trim(Str(CurrRow - LastSubGrpRow - 1)) & "]C[0])"
    Next i
  End If
End Sub

Sub NewSubGrp()
  LastSubGrpRow = CurrRow
  LastSubGrp = rst!field_sub_grp
  Cells(CurrRow, 2) = rst!field_sub_grp
  Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Size = 10
  Range(Cells(CurrRow, 1), Cells(CurrRow, ColumnCnt)).Font.Bold = True
  CurrRow = CurrRow + 1
End Sub

Private Sub CommandButton1_Click()
  Fill_Report
End Sub

