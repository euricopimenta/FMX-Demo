unit Repository.Pessoa;

interface

uses

  Connection.DataModule,
  FireDAC.Comp.Client,
  System.Generics.Collections,
  Model.Entity.Interfaces,
  Repository.Interfaces;

type
  TPessoaRepository = class(TInterfacedObject, IPessoaRepository)
  private
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function Insert(APessoa: IPessoa): Integer;
    function List: TList<IPessoa>;
  end;

implementation

{ TPessoaRepository }

constructor TPessoaRepository.Create(AConn: TFDConnection);
begin

end;

function TPessoaRepository.Insert(APessoa: IPessoa): Integer;
var
  Q: TFDQuery;
begin
  Q := TFDQuery.Create(nil);
  try
    Q.Connection := FConn;
    Q.SQL.Text := 'insert into pessoa (nome) values (:nome)';
    Q.ParamByName('nome').AsString := APessoa.Nome;
    Q.ExecSQL;

    Result := FConn.ExecSQLScalar('select last_insert_rowid()');
  finally
    Q.Free;
  end;

end;

function TPessoaRepository.List: TList<IPessoa>;
begin

end;

end.
