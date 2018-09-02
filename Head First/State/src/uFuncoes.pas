unit uFuncoes;

interface

uses Vcl.StdCtrls;

procedure WriteLine(Value: String);

var
  MemoConsole : TMemo;

implementation

procedure WriteLine(Value: String);
begin
  MemoConsole.Lines.Add(Value);
end;

end.
