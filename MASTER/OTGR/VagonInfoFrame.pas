unit VagonInfoFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, RxLookup;

type
  TSvedVagonInfoFrame = class(TFrame)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    lcKalibr: TRxDBLookupCombo;
    edVes_cist: TEdit;
    Edit1: TEdit;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    UpDown2: TUpDown;
    edCapacity: TEdit;
    edAxes: TEdit;
    UpDown1: TUpDown;
    edCIS: TEdit;
    lcVagontype: TRxDBLookupCombo;
    edNum_vagon: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
