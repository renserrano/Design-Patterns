unit uGumballMachine;

interface

uses uFuncoes, uIState;

type
  TGumballMachine = class
  private
    souldOutState : IState;
    noQuarterState : IState;
    hasQuarterState : IState;
    soldState : IState;
    winnerState : IState;

    State : IState;
    Count : Integer;
    function GetStateStatus: String;
  public
    constructor Create(numGumballs: Integer);
    procedure insertQuarter();
    procedure ejectQuarter();
    procedure turnCrank();
    procedure dispensed();
    function ToString(): String; override;

    function getCount: Integer;
    function getHasQuarterState: IState;
    function getNoQuarterState: IState;
    function getSoldOutState: IState;
    function getSoldState: IState;
    function getWinnerState: IState;
    procedure releaseBall;
    procedure setState(State: IState);
  end;

implementation

uses
  System.SysUtils, uTHasQuarterState, uTNoQuarterState, uTSoldOutState,
  uTSoldState, uTWinnerState;

{ TGumballMachine }

constructor TGumballMachine.Create(numGumballs: Integer);
begin
  soldState := TSoldState.Create(Self);
  souldOutState := TSoldOutState.Create(Self);
  noQuarterState := TNoQuarterState.Create(Self);
  hasQuarterState := THasQuarterState.Create(Self);
  winnerState := TWinnerState.Create(Self);

  State := souldOutState;
  Self.Count := numGumballs;
  If (numGumballs > 0) Then
    State := noQuarterState;
end;

procedure TGumballMachine.insertQuarter();
begin
  State.insertQuarter();
end;

procedure TGumballMachine.ejectQuarter();
begin
  State.ejectQuarter();
end;

function TGumballMachine.getCount: Integer;
begin
  Result := Self.Count;
end;

function TGumballMachine.getHasQuarterState: IState;
begin
  Result := hasQuarterState;
end;

function TGumballMachine.getNoQuarterState: IState;
begin
  Result := noQuarterState;
end;

function TGumballMachine.getSoldOutState: IState;
begin
  Result := souldOutState;
end;

function TGumballMachine.getSoldState: IState;
begin
  Result := soldState;
end;

procedure TGumballMachine.releaseBall();
begin
  WriteLine('A gumball comes rolling out the slot...');
  If (Count <> 0) Then
    Count := Count - 1;
end;

procedure TGumballMachine.setState(State: IState);
begin
  Self.State := State;
end;

procedure TGumballMachine.turnCrank();
begin
  State.turnCrank();
end;

procedure TGumballMachine.dispensed();
begin
  State.dispense();
end;

function TGumballMachine.ToString: String;
begin
  Result := 'Mighty Gumball, Inc.' + sLineBreak +
            'Delphi-enabled Standing Gumball Model #2018' + sLineBreak +
            'Inventory: ' + IntToStr(Self.Count) + ' gumballs ' + sLineBreak +
            GetStateStatus();
end;

function TGumballMachine.GetStateStatus: String;
begin
  result := 'unknown state';
  if (State = getNoQuarterState()) then
    result := 'Machine is waiting for quarter'
  else if (State = getSoldOutState()) then
    result := 'Machine is sould out'
  else if (State = getHasQuarterState()) then
    result := 'Machine has a quarter'
  else if (State = getSoldState()) Then
    result := 'Machine is sould';
end;

function TGumballMachine.getWinnerState: IState;
begin
  result := winnerState;
end;

end.
