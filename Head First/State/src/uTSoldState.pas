unit uTSoldState;

interface

uses uIState, uGumballMachine;

type
  TSoldState = class(TinterfacedObject, IState)
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

{ TSoldState }

uses uFuncoes;

constructor TSoldState.Create(GumballMachineRefact: TGumballMachine);
begin
  Self.gumballMachine := GumballMachineRefact;
end;

procedure TSoldState.insertQuarter();
begin
  WriteLine('Please wait, we´re already giving you a gumball');
end;

procedure TSoldState.ejectQuarter();
begin
  WriteLine('Sorry, you already turned the crank');
end;

procedure TSoldState.turnCrank();
begin
  WriteLine('Turning twice doesn´t get you another gumball');
end;

procedure TSoldState.dispense();
begin
  gumballMachine.releaseBall();
  If (gumballMachine.getCount() > 0) Then
    gumballMachine.setState(gumballMachine.getNoQuarterState())
  Else
  Begin
    WriteLine('Oops, out of gumballs!');
    gumballMachine.setState(gumballMachine.getSoldOutState());
  End;
end;

end.
