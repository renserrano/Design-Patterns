unit uTHasQuarterState;

interface

uses uIState, uGumballMachine;

type
  THasQuarterState = class(TinterfacedObject, IState)
  private
    GumballMachine: TGumballMachine;
  public
    constructor Create(GumballMachine: TGumballMachine);
    procedure insertQuarter();
    procedure ejectQuarter();
    procedure turnCrank();
    procedure dispense();
  end;

implementation

{ THasQuarterState }

uses uFuncoes, Math;

constructor THasQuarterState.Create(GumballMachine: TGumballMachine);
begin
  Self.GumballMachine := GumballMachine;
end;

procedure THasQuarterState.insertQuarter();
begin
  WriteLine('You can´t insert another quarter');
end;

procedure THasQuarterState.ejectQuarter();
begin
  WriteLine('Quarter returned');
  GumballMachine.setState(GumballMachine.getNoQuarterState());
end;

procedure THasQuarterState.turnCrank();
  var
    intWinner : Integer;
begin
  WriteLine('You turned...');

  Randomize();
  intWinner := RandomRange(0, 10);

  if ((intWinner = 0) and (GumballMachine.getCount() >1)) then
    GumballMachine.setState(GumballMachine.getWinnerState())
  else
    GumballMachine.setState(GumballMachine.getSoldState());

  GumballMachine.dispensed();
end;

procedure THasQuarterState.dispense();
begin
  WriteLine('No gumball dispensed');
end;

end.
