unit uGumballMachine;

interface

uses uFuncoes;

const
  SOLD_OUT : Integer = 0;
  NO_QUARTER : Integer = 1;
  HAS_QUARTER : Integer = 2;
  SOLD : Integer = 3;

type
  TGumballMachine = class
  private
    State : Integer;
    Count : Integer;
    function GetStateStatus: String;
  public
    constructor Create(Count: Integer);
    procedure insertQuarter();
    procedure ejectQuarter();
    procedure turnCrank();
    procedure dispensed();
    function ToString(): String; override;
  end;

implementation

uses
  System.SysUtils;

{ TGumballMachine }

constructor TGumballMachine.Create(Count: Integer);
begin
  State := SOLD_OUT;
  Self.Count := Count;
  If (Count > 0) Then
    State := NO_QUARTER;
end;

procedure TGumballMachine.insertQuarter();
begin
  if (State = HAS_QUARTER) Then
    WriteLn('You can´t insert another quarter')
  else if (State = NO_QUARTER) then
  begin
    State := HAS_QUARTER;
    WriteLn('You inserted a quarter');
  end
  Else If (State = SOLD_OUT) Then
  Begin
    WriteLn('You can´t insert a quarter, the machine is sold out');
  End
  Else If (State = SOLD) Then
    WriteLn('Please wait, we´re already giving you a gumball');
end;

procedure TGumballMachine.ejectQuarter();
begin
  If (State = HAS_QUARTER) Then
  begin
    WriteLn('Quarter returned');
    State := NO_QUARTER;
  end
  else if (State = NO_QUARTER) then
  begin
    WriteLn('You haven´t inserted a quarter');
  end
  Else If (State = SOLD) Then
  Begin
    WriteLn('Sorry, you already turned the crank');
  End
  Else If (State = SOLD_OUT) Then
    WriteLn('You can´t eject, you haven´t inserted a quarter yet');
end;

procedure TGumballMachine.turnCrank;
begin
  if (State = SOLD) then
    WriteLn('Turning twice doesn´t get you another gumball')
  else if (State = NO_QUARTER) then
    WriteLn('You turned but there´s no quarter')
  else if (State = SOLD_OUT) then
    WriteLn('You turned, but there are no gumballs')
  else if (State = HAS_QUARTER) then
  begin
    WriteLn('You turned...');
    State := SOLD;
    dispensed();
  end;
end;

procedure TGumballMachine.dispensed;
begin
  if (State = SOLD) then
  begin
    WriteLn('A gumball comes rolling out the slot');
    Count := Count -1;

    if (Count = 0) then
    begin
      WriteLn('Oops, out of gumballs!');
      State := SOLD_OUT;
    end
    else
      State := NO_QUARTER;
  end
  else if (State = NO_QUARTER) then
    WriteLn('You need to pay first')
  else If (state = SOLD_OUT) then
    WriteLn('No gumball dispensed')
  else if (state = HAS_QUARTER) then
    WriteLn('No gumball dispensed');
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

  if (State = NO_QUARTER) then
    result := 'Machine is waiting for quarter'
  else if (State = SOLD_OUT) then
    result := 'Machine is sould out'
  else if (State = HAS_QUARTER) then
    result := 'Machine has a quarter'
  else if (State = SOLD) Then
    result := 'Machine is sould';
end;

end.
