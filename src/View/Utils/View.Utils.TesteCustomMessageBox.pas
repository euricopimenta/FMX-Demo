unit View.Utils.TesteCustomMessageBox;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListBox, FMX.Edit, FMX.Controls.Presentation, FMX.Effects, FMX.Objects,
  FMX.Layouts;

type
  TTesteMsgBox = class(TFrame)
    lblMensagem: TLabel;
    edtMSG: TEdit;
    cmbTipo: TComboBox;
    lblTipo: TLabel;
    LytButtons: TLayout;
    RectBtnOk: TRectangle;
    BtnOkText: TLabel;
    ShadowEffect3: TShadowEffect;
    RectBtnGerar: TRectangle;
    Label1: TLabel;
    ShadowEffect1: TShadowEffect;
    procedure RectBtnOkClick(Sender: TObject);
    procedure RectBtnGerarClick(Sender: TObject);
  private
    { Private declarations }
    FOnClose : TProc;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property OnClose : TProc read FOnClose write FOnClose;
  end;

implementation

uses
  View.Utils.CustomMessageBox;

{$R *.fmx}


{ TTesteMsgBox }

constructor TTesteMsgBox.Create(AOwner: TComponent);
begin
  inherited;
  Self.Align := TAlignLayout.Client;
end;

procedure TTesteMsgBox.RectBtnGerarClick(Sender: TObject);
var
  LMessageBox : Integer;
begin
  LMessageBox := TvMessageBox.Execute(edtMSG.Text, TMsgkind(cmbTipo.ItemIndex),[]);
end;

procedure TTesteMsgBox.RectBtnOkClick(Sender: TObject);
begin
  if Assigned(FOnClose) then
    FOnClose;
end;

end.
