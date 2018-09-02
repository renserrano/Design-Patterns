unit uTNoQuarterState;

interface

uses uIState, uGumballMachine;

type
  TNoQuarterState = class(TinterfacedObject, IState)
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

{ TNoQuarterState }

uses uFuncoes;

constructor TNoQuarterState.Create(GumballMachineRefact: TGumballMachine);
begin
  Self.gumballMachine := GumballMachineRefact;
end;

procedure TNoQuarterState.insertQuarter();
begin
  gumballMachine.setState(gumballMachine.getHasQuarterState());
  WriteLine('You inserted a quarter');
end;

procedure TNoQuarterState.ejectQuarter();
begin
  WriteLine('You haven´t inserted a quarter');
end;

procedure TNoQuarterState.turnCrank();
begin
  WriteLine('You turned but there´s no quarter');
end;

procedure TNoQuarterState.dispense();
begin
  WriteLine('You need to pay first');
end;

end.
