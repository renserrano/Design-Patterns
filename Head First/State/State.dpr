program State;

uses
  Vcl.Forms,
  uMain in 'src\uMain.pas' {Form1},
  uGumballMachine in 'src\uGumballMachine.pas',
  uFuncoes in 'src\uFuncoes.pas',
  uTGumballMachineTestDrive in 'src\tests\uTGumballMachineTestDrive.pas',
  uIState in 'src\uIState.pas',
  uTHasQuarterState in 'src\uTHasQuarterState.pas',
  uTNoQuarterState in 'src\uTNoQuarterState.pas',
  uTSoldOutState in 'src\uTSoldOutState.pas',
  uTSoldState in 'src\uTSoldState.pas',
  uTWinnerState in 'src\uTWinnerState.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
