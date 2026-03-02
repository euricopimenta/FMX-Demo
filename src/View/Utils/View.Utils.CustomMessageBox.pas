unit View.Utils.CustomMessageBox;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Effects, System.ImageList, System.Skia, FMX.Skia,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ImgList;

type
  TMsgKind = (mkInformation, mkWarning, mkSuccess, mkError, mkQuestion);
  TMsgButtons = (BtnYes, BtnNo, BtnOK);

  TvMessageBox = class(TForm)
    MessageTxt: TText;
    LytButtons: TLayout;
    Titulo: TLabel;
    imgLottie: TSkAnimatedImage;
    shadowFrame: TShadowEffect;
    Rectangle1: TRectangle;
    RectPanelFrame: TRectangle;
    RectBtnOk: TRectangle;
    BtnOkText: TLabel;
    ShadowEffect3: TShadowEffect;
    procedure RectBtnOkClick(Sender: TObject);
  private
    FOnClose: TProc;
    procedure ConfigLayout(const AMessage: string; AKind: TMsgKind; const AButtons: array of string);
    procedure OnBtnClick(Sender: TObject);
  public
    class function Execute(const AMessage: string; AKind: TMsgKind; const AButtons: array of string): Integer;
    property OnClose: TProc read FOnClose write FOnClose;
  end;

var
  vMessageBox: TvMessageBox;

implementation


{$R *.fmx}

procedure TvMessageBox.ConfigLayout(const AMessage: string; AKind: TMsgKind;
  const AButtons: array of string);
var
  LResName: string;
  LStream: TResourceStream;
  LBytes: TBytes;
  I: Integer;
  Btn: TButton;
begin
  MessageTxt.Text := AMessage;

  case AKind of
    mkInformation:
      begin
       LResName := 'ANIM_INFORMATION';
       shadowFrame.ShadowColor := $FF00B9FF;
       Titulo.FontColor := $FF00B9FF;
       Titulo.Text := 'Informação';
      end;

    mkWarning:
      begin
        LResName := 'ANIM_WARNING';
        shadowFrame.ShadowColor := $FFF6A712;
        Titulo.FontColor := $FFF6A712;
        Titulo.Text := 'Aviso';
      end;

    mkSuccess:
      begin
        LResName := 'ANIM_SUCCESS';
        shadowFrame.ShadowColor := $FF039818;
        Titulo.FontColor := $FF039818;
        Titulo.Text := 'Sucesso !';
      end;

    mkError:
      begin
        LResName := 'ANIM_ERROR';
        shadowFrame.ShadowColor := $FFF61212;
        Titulo.FontColor := $FFF61212;
        Titulo.Text := 'Erro :(';
      end;

    mkQuestion:
      begin
        LResName := 'ANIM_QUESTION';
        shadowFrame.ShadowColor := $FF00B9FF;
      end;

  end;

  LStream := TResourceStream.Create(HInstance, LResName, RT_RCDATA);
  try
    SetLength(LBytes, LStream.Size);
    LStream.ReadBuffer(LBytes[0], LStream.Size);
    imgLottie.Source.Data := LBytes;

  finally
    LStream.Free;
  end;
  imgLottie.Animation.Start;

  for I := Low(AButtons) to High(AButtons) do
  begin
    Btn := TButton.Create(Self);
    Btn.Parent := lytButtons;
    Btn.Text := AButtons[I];
    Btn.Align := TAlignLayout.Right;
    Btn.Margins.Left := 5;
    Btn.Tag := I;
    Btn.OnClick := OnBtnClick;
  end;


end;

class function TvMessageBox.Execute(const AMessage: string; AKind: TMsgKind;
  const AButtons: array of string): Integer;
var
  Frm: TvMessageBox;
begin
  Frm := TvMessageBox.Create(nil);
  try
    Frm.ConfigLayout(AMessage, AKind, AButtons);
    Result := Frm.ShowModal; // Retorna o ModalResult (índice do botão)
  finally
    Frm.DisposeOf;
  end;
end;

procedure TvMessageBox.OnBtnClick(Sender: TObject);
begin
  Self.ModalResult := TButton(Sender).Tag;
end;

procedure TvMessageBox.RectBtnOkClick(Sender: TObject);
begin
  Self.Close;
end;


end.
