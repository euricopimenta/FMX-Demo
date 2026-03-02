unit Connection.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  System.IOUtils ;

type
  TDMConnection = class(TDataModule)
    FDConnectionSQLite: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Connect;
  end;

var
  DMConnection: TDMConnection;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

{ TDMConnection }

procedure TDMConnection.Connect;
begin
  FDConnectionSQLite.Connected := True;
end;

end.
