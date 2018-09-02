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
    WriteLine(gumballMachine.ToString);
    WriteLine('');

    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    WriteLine('');

    WriteLine(gumballMachine.ToString);
    WriteLine('');

    gumballMachine.insertQuarter();
    gumballMachine.ejectQuarter();
    gumballMachine.turnCrank();
    WriteLine('');

    WriteLine(gumballMachine.ToString);
    WriteLine('');

    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.ejectQuarter();
    WriteLine('');

    WriteLine(gumballMachine.ToString);
    WriteLine('');

    gumballMachine.insertQuarter();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    gumballMachine.insertQuarter();
    gumballMachine.turnCrank();
    WriteLine('');

    WriteLine(gumballMachine.ToString);
  finally
    gumballMachine.Free;
  end;
end;

end.
