program State;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {Form1},
  uGumballMachine in 'src\uGumballMachine.pas',
  uFuncoes in 'src\uFuncoes.pas',
  uTGumballMachineTestDrive in 'src\tests\uTGumballMachineTestDrive.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
