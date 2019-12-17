Option Explicit

   Public Type PRINTER_DEFAULTS
       pDatatype As Long
       pDevmode As Long
       DesiredAccess As Long
   End Type

   Public Type PRINTER_INFO_2
       pServerName As Long
       pPrinterName As Long
       pShareName As Long
       pPortName As Long
       pDriverName As Long
       pComment As Long
       pLocation As Long
       pDevmode As Long       ' Pointer to DEVMODE
       pSepFile As Long
       pPrintProcessor As Long
       pDatatype As Long
       pParameters As Long
       pSecurityDescriptor As Long  ' Pointer to SECURITY_DESCRIPTOR
       Attributes As Long
       Priority As Long
       DefaultPriority As Long
       StartTime As Long
       UntilTime As Long
       Status As Long
       cJobs As Long
       AveragePPM As Long
   End Type

   Public Type DEVMODE
       dmDeviceName As String * 32

       dmSpecVersion As Integer
       dmDriverVersion As Integer
       dmSize As Integer
       dmDriverExtra As Integer
       dmFields As Long
       dmOrientation As Integer
       dmPaperSize As Integer
       dmPaperLength As Integer
       dmPaperWidth As Integer
       dmScale As Integer
       dmCopies As Integer
       dmDefaultSource As Integer
       dmPrintQuality As Integer
       dmColor As Integer
       dmDuplex As Integer
       dmYResolution As Integer
       dmTTOption As Integer
       dmCollate As Integer
       dmFormName As String * 32
       dmUnusedPadding As Integer
       dmBitsPerPel As Integer
       dmPelsWidth As Long
       dmPelsHeight As Long
       dmDisplayFlags As Long
       dmDisplayFrequency As Long
       dmICMMethod As Long
       dmICMIntent As Long
       dmMediaType As Long
       dmDitherType As Long
       dmReserved1 As Long
       dmReserved2 As Long
   End Type

   Const DM_DUPLEX = &H1000
   Const DM_IN_BUFFER = 8

   Const DM_OUT_BUFFER = 2
   Const PRINTER_ACCESS_ADMINISTER = &H4
   Const PRINTER_ACCESS_USE = &H8
   Const STANDARD_RIGHTS_REQUIRED = &HF0000
   Const PRINTER_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or _
             PRINTER_ACCESS_ADMINISTER Or PRINTER_ACCESS_USE)

   Public Declare Function ClosePrinter Lib "winspool.drv" _
    (ByVal hPrinter As Long) As Long
   Public Declare Function DocumentProperties Lib "winspool.drv" _
     Alias "DocumentPropertiesA" (ByVal hwnd As Long, _
     ByVal hPrinter As Long, ByVal pDeviceName As String, _
     ByVal pDevModeOutput As Long, ByVal pDevModeInput As Long, _
     ByVal fMode As Long) As Long
   Public Declare Function GetPrinter Lib "winspool.drv" Alias _
     "GetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, _
     pPrinter As Byte, ByVal cbBuf As Long, pcbNeeded As Long) As Long
   Public Declare Function OpenPrinter Lib "winspool.drv" Alias _
     "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, _
     pDefault As PRINTER_DEFAULTS) As Long
   Public Declare Function SetPrinter Lib "winspool.drv" Alias _
     "SetPrinterA" (ByVal hPrinter As Long, ByVal Level As Long, _
     pPrinter As Byte, ByVal Command As Long) As Long

   Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
    (pDest As Any, pSource As Any, ByVal cbLength As Long)
 
   ' ==================================================================
   ' SetPrinterDuplex
   '
   '  Программное включение дуплекса у принтера
   '
   '  Returns:
   '       1 = None
   '       2 = Duplex on long edge (book)
   '       3 = Duplex on short edge (legal)
   '
   '  Parameters:
   '    sPrinterName - Название принтера
   '
   '    nDuplexSetting - One of the following standard settings:
   '       1 = None
   '       2 = Duplex on long edge (book)
   '       3 = Duplex on short edge (legal)
   '
   ' ==================================================================
   Public Function SetPrinterDuplex(ByVal sPrinterName As String, ByVal nDuplexSetting As Long) As Long

      Dim hPrinter As Long
      Dim pd As PRINTER_DEFAULTS
      Dim pinfo As PRINTER_INFO_2
      Dim dm As DEVMODE
   
      Dim yDevModeData() As Byte
      Dim yPInfoMemory() As Byte
      Dim nBytesNeeded As Long
      Dim nRet As Long, nJunk As Long
   
      SetPrinterDuplex = 1
      
      On Error GoTo cleanup
   
      If (nDuplexSetting < 1) Or (nDuplexSetting > 3) Then
         MsgBox "Error: dwDuplexSetting is incorrect."
         Exit Function
      End If
      
      pd.DesiredAccess = PRINTER_ALL_ACCESS
      nRet = OpenPrinter(sPrinterName, hPrinter, pd)
      If (nRet = 0) Or (hPrinter = 0) Then
         'If Err.LastDllError = 5 Then
            MsgBox "Ошибка доступа к принтеру " & sPrinterName
         'Else
         '   MsgBox "Cannot open the printer specified " & _
         '     "(make sure the printer name is correct)."
         'End If
         Exit Function
      End If
   
      nRet = DocumentProperties(0, hPrinter, sPrinterName, 0, 0, 0)
      If (nRet < 0) Then
         MsgBox "Cannot get the size of the DEVMODE structure."
         GoTo cleanup
      End If
   
      ReDim yDevModeData(nRet + 100) As Byte
      nRet = DocumentProperties(0, hPrinter, sPrinterName, _
                  VarPtr(yDevModeData(0)), 0, DM_OUT_BUFFER)
      If (nRet < 0) Then
         MsgBox "Cannot get the DEVMODE structure."
         GoTo cleanup
      End If
   
      Call CopyMemory(dm, yDevModeData(0), Len(dm))
   
      If Not CBool(dm.dmFields And DM_DUPLEX) Then
         MsgBox "Выбранный принтер " & sPrinterName & " не имеет дуплекса"
         GoTo cleanup
      End If
   
      dm.dmDuplex = nDuplexSetting
      Call CopyMemory(yDevModeData(0), dm, Len(dm))
   
      nRet = DocumentProperties(0, hPrinter, sPrinterName, _
        VarPtr(yDevModeData(0)), VarPtr(yDevModeData(0)), _
        DM_IN_BUFFER Or DM_OUT_BUFFER)

      If (nRet < 0) Then
        MsgBox "Не возможно включить дуплекс у принтера " & sPrinterName
        GoTo cleanup
      End If
   
      Call GetPrinter(hPrinter, 2, 0, 0, nBytesNeeded)
      If (nBytesNeeded = 0) Then GoTo cleanup
   
      ReDim yPInfoMemory(nBytesNeeded + 100) As Byte

      nRet = GetPrinter(hPrinter, 2, yPInfoMemory(0), nBytesNeeded, nJunk)
      If (nRet = 0) Then
         MsgBox "Unable to get shared printer settings."
         GoTo cleanup
      End If
   
      Call CopyMemory(pinfo, yPInfoMemory(0), Len(pinfo))
      pinfo.pDevmode = VarPtr(yDevModeData(0))
      pinfo.pSecurityDescriptor = 0
      Call CopyMemory(yPInfoMemory(0), pinfo, Len(pinfo))
   
      nRet = SetPrinter(hPrinter, 2, yPInfoMemory(0), 0)
      If (nRet = 0) Then
         MsgBox "Unable to set shared printer settings."
      End If
   
      SetPrinterDuplex = CBool(nRet)

cleanup:
      If (hPrinter <> 0) Then Call ClosePrinter(hPrinter)

   End Function







Private Sub CommandButton1_Click()
Dim s As String
's = Printer.DeviceName
s = Application.ActivePrinter
s = "Тест"
If SetPrinterDuplex(s, 1) Then
  ActiveSheet.PrintOut Copies:=1, Collate:=True, ActivePrinter:=s
Else
  MsgBox "НЕ Успешно"
End If
End Sub
