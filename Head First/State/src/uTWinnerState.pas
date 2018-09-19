unit uTWinnerState;

interface

uses uIState, uGumballMachine;

type
  TWinnerState = class(TinterfacedObject, IState)
  private
    gumballMachine: TGumballMachine;
  public
    constructor Create(gumballMachine: TGumballMachine);
    procedure insertQuarter();
    procedure ejectQuarter();
    procedure turnCrank();
    procedure dispense();
  end;

implementation

{ TWinnerState }

uses uFuncoes;

constructor TWinnerState.Create(gumballMachine: TGumballMachine);
begin
  Self.gumballMachine := gumballMachine;
end;

procedure TWinnerState.insertQuarter;
begin
  WriteLine('Please wait, we´re already giving you a gumball');
end;

procedure TWinnerState.ejectQuarter;
begin
  WriteLine('Sorry, you already turned the crank');
end;

procedure TWinnerState.turnCrank;
begin
  WriteLine('Turning twice doesn´t get you another gumball');
end;

procedure TWinnerState.dispense;
begin
  gumballMachine.releaseBall();
  If (gumballMachine.getCount() = 0) Then
    gumballMachine.setState(gumballMachine.getSoldOutState())
  Else
  Begin
    gumballMachine.releaseBall();
    WriteLine('YOU´RE A WINNER! You get two gumballs for your quarter');
    if (gumballMachine.getCount() > 0) then
      gumballMachine.setState(gumballMachine.getNoQuarterState())
    else
    begin
      WriteLine('Oops, out of gumballs!');
      gumballMachine.setState(gumballMachine.getSoldOutState());
    end;
  End;
end;

end.
