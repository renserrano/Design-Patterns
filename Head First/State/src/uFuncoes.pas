unit uFuncoes;

interface

uses Vcl.StdCtrls;

procedure WriteLn(Value: String);

var
  MemoConsole : TMemo;

implementation

procedure WriteLn(Value: String);
begin
  MemoConsole.Lines.Add(Value);
end;

end.
