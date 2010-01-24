program WebSocketDemo;

uses
  Forms,
  uMain in 'source\uMain.pas' {frmServer},
  uWebSocket in '..\..\..\source\uWebSocket.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmServer, frmServer);
  Application.Run;
end.
