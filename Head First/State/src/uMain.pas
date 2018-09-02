unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    btnTestDrive: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTestDriveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uFuncoes, uTGumballMachineTestDrive;

procedure TForm1.btnTestDriveClick(Sender: TObject);
  var
    gumballMachineTestDrive : TGumballMachineTestDrive;
begin
  Memo1.Lines.Clear;

  gumballMachineTestDrive := TGumballMachineTestDrive.Create;
  try
    gumballMachineTestDrive.Teste;
  finally
    gumballMachineTestDrive.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  uFuncoes.MemoConsole := Memo1;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  uFuncoes.MemoConsole := Nil;
end;

end.
