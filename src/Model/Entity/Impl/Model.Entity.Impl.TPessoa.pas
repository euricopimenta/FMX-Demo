unit Model.Entity.Impl.TPessoa;

interface

uses
  Model.Entity.Interfaces;

type
  TPessoa = Class(TInterfacedObject, iPessoa)
    private
      FCodigo   : Integer;
      FNome     : String;
      FTelefone : String;
      FEmail    : String;

    public
      class function New : iPessoa;

      function Codigo: Integer;
      function Nome: String;
      function Telefone: String;
      function Email: String;

      function SetCodigo (const AValue : Integer) : iPessoa;
      function SetNome (const AValue : String) : iPessoa;
      function SetTelefone (const AValue : String) : iPessoa;
      function SetEmail (const AValue : String) : iPessoa;

  End;

implementation

{ TPessoa }

class function TPessoa.New: iPessoa;
begin
  Result := Self.Create;
end;

function TPessoa.SetCodigo(const AValue: Integer): iPessoa;
begin
  Result := Self;
  FCodigo := AValue;
end;

function TPessoa.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TPessoa.SetNome(const AValue: String): iPessoa;
begin
  Result := Self;
  FNome := AValue;
end;

function TPessoa.Nome: String;
begin
  Result := FNome;
end;

function TPessoa.SetTelefone(const AValue: String): iPessoa;
begin
  Result := Self;
  FTelefone := AValue;
end;

function TPessoa.Telefone: String;
begin
  Result := FTelefone;
end;

function TPessoa.SetEmail(const AValue: String): iPessoa;
begin
  Result := Self;
  FEmail := AValue;
end;

function TPessoa.Email: String;
begin
  Result := FEmail;
end;

end.
