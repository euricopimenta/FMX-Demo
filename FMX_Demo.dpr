program FMX_Demo;

{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  View.MainMenu in 'View.MainMenu.pas' {frmMainMenu},
  View.Cadastro.ClientesFrame in 'src\View\Cadastro\View.Cadastro.ClientesFrame.pas' {frmCadClientesFrame: TFrame},
  View.Utils.CustomMessageBox in 'src\View\Utils\View.Utils.CustomMessageBox.pas' {vMessageBox},
  View.Utils.TesteCustomMessageBox in 'src\View\Utils\View.Utils.TesteCustomMessageBox.pas' {TesteMsgBox: TFrame},
  Model.Entity.Interfaces in 'src\Model\Entity\Model.Entity.Interfaces.pas',
  Model.Entity.Impl.TPessoa in 'src\Model\Entity\Impl\Model.Entity.Impl.TPessoa.pas',
  Connection.DataModule in 'src\Data\Connection.DataModule.pas' {DMConnection: TDataModule},
  Repository.Pessoa in 'src\Repository\Repository.Pessoa.pas',
  Repository.Interfaces in 'src\Repository\Repository.Interfaces.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  Application.Initialize;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TvMessageBox, vMessageBox);
  Application.CreateForm(TDMConnection, DMConnection);
  Application.Run;
end.
