program Processo_Seletivo;

uses
  Forms,
  uEndereco in 'buscaCep-master\uEndereco.pas',
  uClientes in 'uClientes.pas' {FormCadCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormCadCliente, FormCadCliente);
  Application.Run;
end.
