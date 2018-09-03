unit uTSoldOutState;

interface

uses uIState, uGumballMachine;

type
  TSoldOutState = class(TinterfacedObject, IState)
  private
    gumballMachine: TGumballMachine;
  public
    constructor Create(GumballMachineRefact: TGumballMachine);
    procedure insertQuarter();
    procedure ejectQuarter();
    procedure turnCrank();
    procedure dispense();
  end;

implementation

{ TSoldOutState }

uses uFuncoes;

constructor TSoldOutState.Create(GumballMachineRefact: TGumballMachine);
begin
  Self.gumballMachine := GumballMachineRefact;
end;

procedure TSoldOutState.insertQuarter();
begin
  WriteLine('You can´t insert a quarter, the machine is sold out');
end;

procedure TSoldOutState.ejectQuarter();
begin
  WriteLine('You can´t eject, you haven´t inserted a quarter yet');
end;

procedure TSoldOutState.turnCrank();
begin
  WriteLine('You turned, but there are no gumballs');
end;

procedure TSoldOutState.dispense();
begin
  WriteLine('No gumball dispensed');
end;

end.
