object FormCadCliente: TFormCadCliente
  Left = 244
  Top = 105
  Width = 931
  Height = 546
  Caption = 'Cadastro de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrd1: TDBGrid
    Left = 0
    Top = 378
    Width = 915
    Height = 130
    Align = alClient
    DataSource = dsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 33
    Align = alTop
    Caption = 'Dados Cadastrais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnl2: TPanel
    Left = 0
    Top = 33
    Width = 915
    Height = 144
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 32
      Height = 13
      Caption = 'NOME'
      FocusControl = dbedtNOME
    end
    object lbl2: TLabel
      Left = 8
      Top = 88
      Width = 66
      Height = 13
      Caption = 'IDENTIDADE'
      FocusControl = dbedtIDENTIDADE
    end
    object lbl3: TLabel
      Left = 288
      Top = 88
      Width = 20
      Height = 13
      Caption = 'CPF'
      FocusControl = dbedtCPF
    end
    object lbl4: TLabel
      Left = 8
      Top = 48
      Width = 56
      Height = 13
      Caption = 'TELEFONE'
      FocusControl = dbedtTELEFONE
    end
    object lbl5: TLabel
      Left = 288
      Top = 48
      Width = 32
      Height = 13
      Caption = 'EMAIL'
      FocusControl = dbedtEMAIL
    end
    object dbedtNOME: TDBEdit
      Left = 8
      Top = 24
      Width = 905
      Height = 21
      DataField = 'NOME'
      DataSource = dsClientes
      TabOrder = 0
    end
    object dbedtIDENTIDADE: TDBEdit
      Left = 8
      Top = 104
      Width = 264
      Height = 21
      DataField = 'IDENTIDADE'
      DataSource = dsClientes
      TabOrder = 3
    end
    object dbedtCPF: TDBEdit
      Left = 288
      Top = 104
      Width = 273
      Height = 21
      DataField = 'CPF'
      DataSource = dsClientes
      TabOrder = 4
    end
    object dbedtTELEFONE: TDBEdit
      Left = 8
      Top = 64
      Width = 264
      Height = 21
      DataField = 'TELEFONE'
      DataSource = dsClientes
      TabOrder = 1
    end
    object dbedtEMAIL: TDBEdit
      Left = 288
      Top = 64
      Width = 625
      Height = 21
      DataField = 'EMAIL'
      DataSource = dsClientes
      TabOrder = 2
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 177
    Width = 915
    Height = 24
    Align = alTop
    Caption = 'Endere'#231'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object pnl4: TPanel
    Left = 0
    Top = 201
    Width = 915
    Height = 144
    Align = alTop
    TabOrder = 4
    object lbl6: TLabel
      Left = 16
      Top = 8
      Width = 21
      Height = 13
      Caption = 'CEP'
      FocusControl = dbedtCEP
    end
    object lbl7: TLabel
      Left = 16
      Top = 48
      Width = 60
      Height = 13
      Caption = 'ENDERECO'
      FocusControl = dbedtENDERECO
    end
    object lbl8: TLabel
      Left = 576
      Top = 48
      Width = 41
      Height = 13
      Caption = 'BAIRRO'
      FocusControl = dbedtBAIRRO
    end
    object lbl9: TLabel
      Left = 16
      Top = 88
      Width = 40
      Height = 13
      Caption = 'CIDADE'
      FocusControl = dbedtCIDADE
    end
    object lbl10: TLabel
      Left = 296
      Top = 88
      Width = 14
      Height = 13
      Caption = 'UF'
      FocusControl = dbedtUF
    end
    object lbl11: TLabel
      Left = 576
      Top = 88
      Width = 24
      Height = 13
      Caption = 'PAIS'
      FocusControl = dbedtPAIS
    end
    object dbedtCEP: TDBEdit
      Left = 16
      Top = 24
      Width = 264
      Height = 21
      DataField = 'CEP'
      DataSource = dsClientes
      TabOrder = 0
      OnChange = dbedtCEPChange
    end
    object dbedtENDERECO: TDBEdit
      Left = 16
      Top = 64
      Width = 545
      Height = 21
      DataField = 'ENDERECO'
      DataSource = dsClientes
      TabOrder = 1
    end
    object dbedtBAIRRO: TDBEdit
      Left = 576
      Top = 64
      Width = 337
      Height = 21
      DataField = 'BAIRRO'
      DataSource = dsClientes
      TabOrder = 2
    end
    object dbedtCIDADE: TDBEdit
      Left = 16
      Top = 104
      Width = 264
      Height = 21
      DataField = 'CIDADE'
      DataSource = dsClientes
      TabOrder = 3
    end
    object dbedtUF: TDBEdit
      Left = 296
      Top = 104
      Width = 264
      Height = 21
      DataField = 'UF'
      DataSource = dsClientes
      TabOrder = 4
    end
    object dbedtPAIS: TDBEdit
      Left = 576
      Top = 104
      Width = 264
      Height = 21
      DataField = 'PAIS'
      DataSource = dsClientes
      TabOrder = 5
    end
    object btnBuscaCep: TButton
      Left = 296
      Top = 21
      Width = 57
      Height = 25
      Caption = 'Buscar '
      TabOrder = 6
      OnClick = btnBuscaCepClick
    end
  end
  object pnl5: TPanel
    Left = 0
    Top = 345
    Width = 915
    Height = 33
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object btnNovo: TBitBtn
      Left = 14
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object dbnvgr1: TDBNavigator
      Left = 336
      Top = 4
      Width = 224
      Height = 25
      DataSource = dsClientes
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 1
    end
    object btnSalvar: TBitBtn
      Left = 93
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnExcluir: TBitBtn
      Left = 253
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnCancelar: TBitBtn
      Left = 173
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnEnviaEmail: TBitBtn
      Left = 800
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Enviar e-mail'
      TabOrder = 5
      OnClick = btnEnviaEmailClick
    end
  end
  object CdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'IDENTIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CPF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 552
    Top = 432
    Data = {
      3C0100009619E0BD01000000180000000B0000000000030000003C01044E4F4D
      4501004900000001000557494454480200020014000A4944454E544944414445
      0100490000000100055749445448020002001400034350460100490000000100
      0557494454480200020014000854454C45464F4E450100490000000100055749
      4454480200020014000343455001004900000001000557494454480200020014
      0008454E44455245434F01004900000001000557494454480200020014000642
      414952524F010049000000010005574944544802000200140006434944414445
      0100490000000100055749445448020002001400025546010049000000010005
      5749445448020002001400045041495301004900000001000557494454480200
      0200140005454D41494C01004900000001000557494454480200020064000000}
    object strngfldCdsClientesNOME: TStringField
      FieldName = 'NOME'
    end
    object strngfldCdsClientesIDENTIDADE: TStringField
      FieldName = 'IDENTIDADE'
    end
    object strngfldCdsClientesCPF: TStringField
      FieldName = 'CPF'
    end
    object strngfldCdsClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
    object strngfldCdsClientesCEP: TStringField
      FieldName = 'CEP'
    end
    object strngfldCdsClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
    end
    object strngfldCdsClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object strngfldCdsClientesCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object strngfldCdsClientesUF: TStringField
      FieldName = 'UF'
    end
    object strngfldCdsClientesPAIS: TStringField
      FieldName = 'PAIS'
    end
    object strngfldCdsClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object dsClientes: TDataSource
    DataSet = CdsClientes
    OnStateChange = dsClientesStateChange
    Left = 496
    Top = 432
  end
end
