unit View.MainMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ExtCtrls, FMX.TreeView, FMX.ImgList, FMX.Filter.Effects, FMX.Ani,
  FMX.Styles.Objects,

  View.Cadastro.ClientesFrame,
  View.Utils.CustomMessageBox,
  View.Utils.TesteCustomMessageBox;

type
  TfrmMainMenu = class(TForm)
    Rectangle1: TRectangle;
    panelClientFrame: TRectangle;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    btnCliente: TRectangle;
    ShadowEffect3: TShadowEffect;
    Rectangle7: TRectangle;
    ShadowEffect7: TShadowEffect;
    Logo: TRectangle;
    iconCliente: TRectangle;
    txtCliente: TText;
    panelSideButtons: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Text1: TText;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Text2: TText;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Text3: TText;
    ShadowEffect4: TShadowEffect;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    Text4: TText;
    Text5: TText;
    btnSair: TRectangle;
    Rectangle11: TRectangle;
    Text6: TText;
    ShadowEffect8: TShadowEffect;
    RectBtnTesteMsg: TRectangle;
    Rectangle12: TRectangle;
    Text7: TText;
    ShadowEffect9: TShadowEffect;
    lblAuthor: TLabel;
    ControlsDragBar: TRectangle;
    BtnRect_Close: TRectangle;
    btnRect_Maximize: TRectangle;
    btnRect_Minimize: TRectangle;
    GlowEffect1: TGlowEffect;
    GlowEffect2: TGlowEffect;
    GlowEffect3: TGlowEffect;
    procedure Rectangle9Click(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure RectBtnTesteMsgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRect_MaximizeClick(Sender: TObject);
    procedure BtnRect_CloseClick(Sender: TObject);
    procedure btnRect_MinimizeClick(Sender: TObject);
    procedure ControlsDragBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LockPanels(AState:Boolean);
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.fmx}


procedure TfrmMainMenu.btnClienteClick(Sender: TObject);
var
  FrameClientes : TfrmCadClientesFrame;
begin
  FrameClientes := TfrmCadClientesFrame.Create(Self);
  LockPanels(True);
  try
    FrameClientes.Parent := panelClientFrame;
    FrameClientes.Align := TAlignLayout.Center;
  finally
    FrameClientes.OnClose := procedure
    begin
      LockPanels(False);
      FrameClientes.DisposeOf;
    end;
  end;
end;

procedure TfrmMainMenu.BtnRect_CloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMainMenu.btnRect_MaximizeClick(Sender: TObject);
begin
  If WindowState = TWindowState.wsMaximized then
    WindowState := TWindowState.wsNormal
  else
    WindowState := TWindowState.wsMaximized;

end;

procedure TfrmMainMenu.btnRect_MinimizeClick(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
end;

procedure TfrmMainMenu.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMainMenu.ControlsDragBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  Self.StartWindowDrag;
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  BorderStyle := TFmxFormBorderStyle.None;

end;

procedure TfrmMainMenu.LockPanels(AState: Boolean);
begin
  panelSideButtons.Enabled := not AState;
end;

procedure TfrmMainMenu.Rectangle9Click(Sender: TObject);
var
  LResposta : Integer;
begin
  LResposta := TvMessageBox.Execute('Teste de Mensagem', mkWarning,['Sim','Talvez']);

end;

procedure TfrmMainMenu.RectBtnTesteMsgClick(Sender: TObject);
var
 LFrameTeste : TTesteMsgBox;
begin
  LFrameTeste := TTesteMsgBox.Create(Self);
  LockPanels(True);
  Try
    LFrameTeste.Parent := panelClientFrame;
    LFrameTeste.Align := TAlignLayout.Center;
  Finally
    LFrameTeste.OnClose := procedure
    begin
      LockPanels(False);
      LFrameTeste.DisposeOf;
    end;
  End;
end;

end.
