object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 357
  Top = 136
  Height = 111
  Width = 241
  object q_tank: TOracleDataSet
    SQL.Strings = (
      
        'select factory_ksss,tank_park,tank_number,product_code,product_n' +
        'ame,'
      'product_ksss,status,gds_w,dead_w,free_w,inform,'
      
        'transit_w,tech_w,store_obj_id,kod_own_kc,supply_ksss,src_categor' +
        'y_id'
      'from v_rez_unp_esb'
      'where date_zamer=TO_DATE(:TimeStamp,'#39'YYYY-MM-DD'#39')')
    Variables.Data = {
      03000000010000000A0000003A54494D455354414D5005000000000000000000
      0000}
    QBEDefinition.QBEFieldDefs = {
      040000000C0000000A000000444154455F5A414D45520100000000000C000000
      464143544F52595F4B5353530100000000000900000054414E4B5F5041524B01
      00000000000B00000054414E4B5F4E554D4245520100000000000C0000005052
      4F445543545F434F44450100000000000C00000050524F445543545F4E414D45
      0100000000000C00000050524F445543545F4B53535301000000000006000000
      535441545553010000000000050000004744535F570100000000000600000044
      4541445F5701000000000006000000465245455F570100000000000600000049
      4E464F524D010000000000}
    Session = ora_Session
    Left = 72
    Top = 12
  end
  object ora_Session: TOracleSession
    DesignConnection = True
    LogonUsername = 'MASTER'
    LogonPassword = 'MASTER'
    LogonDatabase = 'BUH'
    Connected = True
    Left = 16
    Top = 12
  end
end
