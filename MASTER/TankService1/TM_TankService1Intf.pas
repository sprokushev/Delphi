{ Invokable interface ITM_TankService1 }

unit TM_TankService1Intf;

interface

uses InvokeRegistry, Types, XSBuiltIns;

type

  { Invokable interfaces must derive from IInvokable }
  ITM_TankService1 = interface(IInvokable)
  ['{EDAC9605-17C2-43FB-A1BE-3F670F661FFA}']

    { Methods of Invokable interface must not use the default }
    { calling convention; stdcall is recommended }
    function GetTanksData (dt: string): OleVariant; stdcall;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ITM_TankService1),InvString('http://lukoil.ru/ds/tanks'),InvString('utf-8'));

end.
 