unit Repository.Interfaces;

interface

uses
  System.Generics.Collections,
  Model.Entity.Interfaces;
type
  IPessoaRepository = interface
    function Insert(APessoa: IPessoa): Integer;
    function List: TList<IPessoa>;
  end;

implementation

end.
