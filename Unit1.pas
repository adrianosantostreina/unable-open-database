unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  MultiDetailAppearanceU, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ListView, FMX.StdCtrls,
  FMX.Controls.Presentation,

  System.IOUtils;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    ListView1: TListView;
    fdConn: TFDConnection;
    qryContatos: TFDQuery;
    qryContatosID: TIntegerField;
    qryContatosFIRSTNAME: TStringField;
    qryContatosLASTNAME: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    procedure Button1Click(Sender: TObject);
    procedure fdConnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  qryContatos.Open('SELECT * FROM CONTATOS');
end;

procedure TForm1.fdConnBeforeConnect(Sender: TObject);
begin
  //'.\assets\internal\Clientes.sqlite' ERRADO
  {$IFDEF MSWINDOWS}
    fdConn.Params.Values['Database'] := '$(TESTE_TDEVROCKS)';
  {$ELSE}
    fdConn.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'Clientes.sqlite');
    fdConn.Params.Values['OpenMode'] := 'ReadWrite';
  {$ENDIF}
end;

end.
