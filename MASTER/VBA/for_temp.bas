Option Explicit

Function GetAsNum(pVariName As String, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pVariId As Integer = 0) As Double

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.GET_AS_NUM"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adDouble, adParamReturnValue)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = pAppName

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pUnitName

  Set param4 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param4
  param4.Value = pVariId

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  If VarType(cmd(0)) <> vbNull Then
    GetAsNum = cmd(0)
  Else
    GetAsNum = 0
  End If
  cn.Close

End Function

Function GetAsDate(pVariName As String, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pVariId As Integer = 0) As Date

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.GET_AS_DATE"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adDate, adParamReturnValue)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = pAppName

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pUnitName

  Set param4 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param4
  param4.Value = pVariId

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  If VarType(cmd(0)) <> vbNull Then
    GetAsDate = cmd(0)
  Else
    GetAsDate = vbEmpty
  End If
  cn.Close

End Function

Function GetAsChar(pVariName As String, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pVariId As Integer = 0) As String

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.GET_AS_CHAR"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adChar, adParamReturnValue, 240)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = pAppName

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pUnitName

  Set param4 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param4
  param4.Value = pVariId

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  If VarType(cmd(0)) <> vbNull Then
    GetAsChar = Trim(cmd(0))
  Else
    GetAsChar = ""
  End If
  cn.Close

End Function


Function SetVariNum(pVariName As String, PVariValue As Double, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pTime As Integer = 1) As Double

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.SET_VARI"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adInteger, adParamReturnValue)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adDouble, adParamInput)
  cmd.Parameters.Append param2
  param2.Value = PVariValue

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pAppName

  Set param4 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param4
  param4.Value = pUnitName

  Set param5 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param5
  param5.Value = pTime

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  SetVariNum = cmd(0)
  cn.Close

End Function

Function SetVariChar(pVariName As String, PVariValue As String, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pTime As Integer = 1) As Double

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.SET_VARI"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adInteger, adParamReturnValue)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = PVariValue

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pAppName

  Set param4 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param4
  param4.Value = pUnitName

  Set param5 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param5
  param5.Value = pTime

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  SetVariChar = cmd(0)
  cn.Close

End Function

Function SetVariDate(pVariName As String, PVariValue As Date, Optional pAppName As String = "", Optional pUnitName As String = "", Optional pTime As Integer = 1) As Double

  Dim cn As New ADODB.Connection
  Dim cmd As New ADODB.Command
  Dim rs As New ADODB.Recordset
  Dim param1 As ADODB.Parameter, param2 As ADODB.Parameter, param3 As ADODB.Parameter
  Dim param4 As ADODB.Parameter, param5 As ADODB.Parameter
  Dim res As ADODB.Parameter
  
  ' Connect
  cn.ConnectionString = "Provider=MSDAORA.1;Password=MASTER;User ID=MASTER;Data Source=BUH;Persist Security Info=False"
  cn.Open
  
  ' Set up a command object for the stored procedure.
  Set cmd.ActiveConnection = cn
  cmd.CommandText = "FOR_TEMP.SET_VARI"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adInteger, adParamReturnValue)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pVariName

  Set param2 = cmd.CreateParameter("Input", adDate, adParamInput)
  cmd.Parameters.Append param2
  param2.Value = PVariValue

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pAppName

  Set param4 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param4
  param4.Value = pUnitName

  Set param5 = cmd.CreateParameter("Input", adInteger, adParamInput)
  cmd.Parameters.Append param5
  param5.Value = pTime

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  SetVariDate = cmd(0)
  cn.Close

End Function
