unit Model.Entity.Interfaces;

interface
type
  iPessoa = Interface
    ['{1AF65683-0680-4B3F-9DB2-9C5DF985820D}']

    function Codigo: Integer;
    function Nome: string;
    function Telefone: string;
    function Email: string;

    function SetCodigo (const AValue : Integer) : iPessoa;
    function SetNome (const AValue : String) : iPessoa;
    function SetTelefone (const AValue : String) : iPessoa;
    function SetEmail (const AValue : String) : iPessoa;

  End;

implementation

end.
