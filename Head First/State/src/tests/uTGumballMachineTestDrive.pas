unit uTGumballMachineTestDrive;

interface

type
  TGumballMachineTestDrive = class
  public
    procedure Teste();
  end;

implementation

{ TGumballMachineTestDrive }

uses uGumballMachine, uFuncoes;

procedure TGumballMachineTestDrive.Teste;
  Var
    gumballMachine : TGumballMachine;
begin
  gumballMachine := TGumballMachine.Create(5);
  try
    WriteLn(gumballMachine.ToString);
    WriteLn('');

    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    WriteLn('');

    WriteLn(gumballMachine.ToString);
    WriteLn('');

    gumballMachine.insertQuarter();
    gumballMachine.ejectQuarter();
    gumballMachine.turnCrank();
    WriteLn('');

    WriteLn(gumballMachine.ToString);
    WriteLn('');

    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.ejectQuarter();
    WriteLn('');

    WriteLn(gumballMachine.ToString);
    WriteLn('');

    gumballMachine.insertQuarter();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    WriteLn('');

    WriteLn(gumballMachine.ToString);
  finally
    gumballMachine.Free;
  end;
end;

end.
