unit View.Cadastro.ClientesFrame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Effects, FMX.Objects, FMX.Ani, FMX.Layouts,
  System.Rtti, FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.Edit;

type
  TfrmCadClientesFrame = class(TFrame)
    RectPnlControls: TRectangle;
    LytButtons: TLayout;
    RectBtnSair: TRectangle;
    BtnSairText: TLabel;
    ShadowEffect3: TShadowEffect;
    RectBtnExcluir: TRectangle;
    BtnExcluirText: TLabel;
    ShadowEffect1: TShadowEffect;
    RectBtnLimpar: TRectangle;
    BtnLimparText: TLabel;
    ShadowEffect2: TShadowEffect;
    RectBtnSalvar: TRectangle;
    BtnSalvarText: TLabel;
    ShadowEffect4: TShadowEffect;
    RectPanelClient: TRectangle;
    ShadowEffect6: TShadowEffect;
    RectPanelDados: TRectangle;
    ShadowEffect5: TShadowEffect;
    Edit2: TEdit;
    lblNome: TLabel;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    RectPanelEndereco: TRectangle;
    edtLogradouro: TEdit;
    lblLogradouro: TLabel;
    edtCEP: TEdit;
    lblCEP: TLabel;
    lblNumeroEndereco: TLabel;
    edtNumeroCEP: TEdit;
    Edit3: TEdit;
    lblCpfCnpj: TLabel;
    ShadowEffect7: TShadowEffect;
    lblRG_IE: TLabel;
    edtRG_IE: TEdit;
    edtBairro: TEdit;
    lblBairro: TLabel;
    lblCidade: TLabel;
    edtCidade: TEdit;
    lblEstadoUF: TLabel;
    edtEstadoUF: TEdit;
    edtComplemento: TEdit;
    lblComplemento: TLabel;
    RectPanelTitulo: TRectangle;
    lblTitulo: TLabel;
    procedure RectBtnSairClick(Sender: TObject);

  private
    { Private declarations }
    FOnClose: TProc;
  public
    { Public declarations }
    property OnClose: TProc read FOnClose write FOnClose;
  end;

implementation

{$R *.fmx}



procedure TfrmCadClientesFrame.RectBtnSairClick(Sender: TObject);
begin
  if Assigned(FOnClose) then
    FOnClose;
end;

end.
