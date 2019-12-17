Option Explicit

Function GetEnv(pAppName As String, pGrpName as String, pEnvName As String) As string

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
  cmd.CommandText = "FOR_ENVIRONMENT.GET_ENV_USER"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  Set res = cmd.CreateParameter("Return", adChar, adParamReturnValue, 240)
  cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pAppName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = pGrpName

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pEnvName

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  If VarType(cmd(0)) <> vbNull Then
    GetEnv = Trim(cmd(0))
  Else
    GetEnv = ""
  End If
  cn.Close

End Function


Sub SetEnv(pApplName As String, pGrpName As String, pEnvName As String,pEnvValue As String) 

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
  cmd.CommandText = "FOR_ENVIRONMENT.SET_ENV_USER"
  cmd.CommandType = adCmdStoredProc

  ' Set up a return parameter.
  'Set res = cmd.CreateParameter("Return", adInteger, adParamReturnValue)
  'cmd.Parameters.Append res

  ' Set up an input parameters.
  Set param1 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param1
  param1.Value = pApplName

  Set param2 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param2
  param2.Value = pGrpName

  Set param3 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param3
  param3.Value = pEnvName

  Set param4 = cmd.CreateParameter("Input", adChar, adParamInput, 240)
  cmd.Parameters.Append param4
  param4.Value = pEnvValue

  ' Execute command, and loop through recordset, printing out rows.
  Set rs = cmd.Execute

  'SetEnv = cmd(0)
  cn.Close

End Sub

