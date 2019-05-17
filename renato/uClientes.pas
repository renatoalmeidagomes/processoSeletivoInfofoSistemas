unit uClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, DBClient, DBCtrls, Mask,
  ExtCtrls, IdMessage, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdMessageClient, IdSMTP, IdIOHandler, IdIOHandlerSocket,
  IdSSLOpenSSL;

type
  TFormCadCliente = class(TForm)
    CdsClientes: TClientDataSet;
    dsClientes: TDataSource;
    dbgrd1: TDBGrid;
    pnl1: TPanel;
    strngfldCdsClientesNOME: TStringField;
    strngfldCdsClientesIDENTIDADE: TStringField;
    strngfldCdsClientesCPF: TStringField;
    strngfldCdsClientesTELEFONE: TStringField;
    strngfldCdsClientesCEP: TStringField;
    strngfldCdsClientesENDERECO: TStringField;
    strngfldCdsClientesBAIRRO: TStringField;
    strngfldCdsClientesCIDADE: TStringField;
    strngfldCdsClientesUF: TStringField;
    strngfldCdsClientesPAIS: TStringField;
    pnl2: TPanel;
    lbl1: TLabel;
    dbedtNOME: TDBEdit;
    lbl2: TLabel;
    dbedtIDENTIDADE: TDBEdit;
    lbl3: TLabel;
    dbedtCPF: TDBEdit;
    lbl4: TLabel;
    dbedtTELEFONE: TDBEdit;
    lbl5: TLabel;
    dbedtEMAIL: TDBEdit;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl6: TLabel;
    dbedtCEP: TDBEdit;
    lbl7: TLabel;
    dbedtENDERECO: TDBEdit;
    lbl8: TLabel;
    dbedtBAIRRO: TDBEdit;
    lbl9: TLabel;
    dbedtCIDADE: TDBEdit;
    lbl10: TLabel;
    dbedtUF: TDBEdit;
    lbl11: TLabel;
    dbedtPAIS: TDBEdit;
    pnl5: TPanel;
    btnNovo: TBitBtn;
    btnBuscaCep: TButton;
    dbnvgr1: TDBNavigator;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnEnviaEmail: TBitBtn;
    strngfldCdsClientesEMAIL: TStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buscarCep(Sender: TObject);
    procedure btnBuscaCepClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEnviaEmailClick(Sender: TObject);
    procedure dbedtCEPChange(Sender: TObject);
    procedure dsClientesStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;

implementation

uses uEndereco;

{$R *.dfm}

procedure TFormCadCliente.btnNovoClick(Sender: TObject);
begin
   CdsClientes.Open;
   CdsClientes.Insert;
end;

procedure TFormCadCliente.FormShow(Sender: TObject);
begin
   if FileExists('C:\clientes.xml') then
      CdsClientes.LoadFromFile('C:\clientes.xml');
end;

procedure TFormCadCliente.buscarCep(Sender: TObject);

var
  _rEndereco: TEndereco;
begin
   dbedtENDERECO.Clear;
   dbedtBAIRRO.Clear;
   dbedtCIDADE.Clear;
   dbedtUF.Clear;
   dbedtPAIS.Clear;

   if dbedtCEP.Text = EmptyStr then
      Exit;

   _rEndereco := TEndereco.Create(dbedtCEP.Text);
   try
      dbedtENDERECO.Text := _rEndereco.Logradouro;
      dbedtBAIRRO.Text   := _rEndereco.Bairro;
      dbedtCIDADE.Text   := _rEndereco.Cidade;
      dbedtUF.Text       := _rEndereco.UF;
      dbedtPAIS.Text     := 'Brasil';
   finally
      _rEndereco.Free;
   end;
end;

procedure TFormCadCliente.btnBuscaCepClick(Sender: TObject);
begin
   buscarCep(Self);
end;

procedure TFormCadCliente.btnSalvarClick(Sender: TObject);
begin
   CdsClientes.Post;
   CdsClientes.SaveToFile('C:\clientes.xml');
end;

procedure TFormCadCliente.btnExcluirClick(Sender: TObject);
begin
   CdsClientes.Delete;
   CdsClientes.SaveToFile('C:\clientes.xml');
end;

procedure TFormCadCliente.btnEnviaEmailClick(Sender: TObject);
var
   // objetos necessários para o funcionamento
   IdSSLIOHandlerSocket: TIdSSLIOHandlerSocket;
   IdSMTP: TIdSMTP;
   IdMessage: TIdMessage;
   CaminhoAnexo: string;
   cont,i,j,k : integer;
   Porta, Host, Username, Password : string;
begin
   // instanciação dos objetos
   IdSSLIOHandlerSocket := TIdSSLIOHandlerSocket.Create(Self);
   IdSMTP := TIdSMTP.Create(Self);
   IdMessage := TIdMessage.Create(Self);

   try
      // Configuração do SSL
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

         // Configuração do SMTP
      IdSMTP.IOHandler := IdSSLIOHandlerSocket;
      IdSMTP.AuthenticationType := atLogin;
      IdSMTP.Port := 465;
      IdSMTP.Host := 'smtp.gmail.com';
      IdSMTP.Username := inputbox('Informe seu gmail para autenticar','Informe seu gmail','seunome@gmail.com');
      IdSMTP.Password := inputbox('Informe a senha do seu gmail', 'Informe a senha do seu gmail', 'Senha do Gmail');

      // Tentativa de conexão e autenticação
      try
         IdSMTP.Connect;
         IdSMTP.Authenticate;
      except
         on E:Exception do
         begin
            IdSMTP.Connect;
            IdSMTP.Authenticate;
         end;
      end;

      // Configuração da mensagem
      IdMessage.From.Address := IdSMTP.Username;
      IdMessage.From.Name := Copy(IdSMTP.Username,1,Pos(IdSMTP.Username,'@'));
      IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;
      IdMessage.Recipients.EMailAddresses := dbedtEMAIL.Text;
      IdMessage.Subject := 'BK do cadastro de clientes';
      IdMessage.Body.Text := 'Segue anexo bk de dados de clientes inserios até o momento';

      // Anexo da mensagem (opcional)
      CaminhoAnexo := 'C:\clientes.xml';
      if FileExists(CaminhoAnexo) then
         TIdAttachment.Create(IdMessage.MessageParts, CaminhoAnexo);

      // Envio da mensagem
      try
        IdSMTP.Send(IdMessage);
        MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);

        MessageDlg(inttostr(cont) + ' Enviado por ' + IdMessage.From.Name  + ' para ' + dbedtEMAIL.Text, mtInformation, [mbOK], 0);
      except
         On E:Exception do
            MessageDlg('Erro ao enviar a mensagem: ' + E.Message, mtWarning, [mbOK], 0);
      end;
   finally
      // liberação dos objetos da memória
      FreeAndNil(IdMessage);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(IdSMTP);
   end;
end;

procedure TFormCadCliente.dbedtCEPChange(Sender: TObject);
begin
   buscarCep(Self);
end;

procedure TFormCadCliente.dsClientesStateChange(Sender: TObject);
begin
   if dsClientes.State = dsInsert then
   begin
      btnNovo.Enabled := False;
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;
      btnExcluir.Enabled := False;
   end
   else
   if dsClientes.State = dsEdit then
   begin
      btnNovo.Enabled := False;
      btnSalvar.Enabled := True;
      btnCancelar.Enabled := True;
      btnExcluir.Enabled := True;
   end
   else
   begin
      btnNovo.Enabled := True;
      btnSalvar.Enabled := False;
      btnCancelar.Enabled := False;
      btnExcluir.Enabled := True;
   end
end;

end.
