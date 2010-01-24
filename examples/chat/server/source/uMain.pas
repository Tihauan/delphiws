unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uWebSocket;

type
  TfrmServer = class(TForm)
    btnBroadcast: TButton;
    mmoMessages: TMemo;
    edtBroadcastMsg: TEdit;
    procedure FormDestroy(Sender: TObject);
    procedure btnBroadcastClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  protected
    procedure Broadcast(AMessage: string);
  private
    FWebSocketServer: TWebSocketServer;
    function GetWebSocketServer: TWebSocketServer;
    procedure MessageReceived(AConnection: TWebSocketConnection; const AMessage: string);
    procedure NewConnection(AConnection: TWebSocketConnection);
    procedure ConnectionClosed(AConnection: TWebSocketConnection);
    property WebSocketServer: TWebSocketServer read GetWebSocketServer;
  public
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmServer.Broadcast(AMessage: string);
begin
  // Preconditions
  Assert(WebSocketServer.Active);

  // Send AMessage to all clients
  if AMessage <> '' then
  begin
    WebSocketServer.Broadcast(AMessage);
    mmoMessages.Lines.Add('Broadcast: ' + AMessage);
  end;
end;

procedure TfrmServer.btnBroadcastClick(Sender: TObject);
begin
  Broadcast(edtBroadcastMsg.Text);
  edtBroadcastMsg.Text := '';
end;

procedure TfrmServer.ConnectionClosed(AConnection: TWebSocketConnection);
begin
  Broadcast(AConnection.PeerIP + ' disconnected!');
end;

procedure TfrmServer.FormCreate(Sender: TObject);
begin
  with WebSocketServer do
  begin
    // Assign events
    OnMessageReceived := MessageReceived;
    OnConnect := NewConnection;
    OnDisconnect := ConnectionClosed;

    // Start listening for connections
    Active := True;
  end;
end;

procedure TfrmServer.FormDestroy(Sender: TObject);
begin
  FWebSocketServer.Free;
end;

function TfrmServer.GetWebSocketServer: TWebSocketServer;
begin
  if not Assigned(FWebSocketServer) then
  begin
    FWebSocketServer := TWebSocketServer.Create(7000);
  end;

  Result := FWebSocketServer;  
end;

procedure TfrmServer.MessageReceived(AConnection: TWebSocketConnection; const AMessage: string);
begin
  Broadcast(AConnection.PeerIP + ': ' + AMessage);
end;

procedure TfrmServer.NewConnection(AConnection: TWebSocketConnection);
begin
  Broadcast(AConnection.PeerIP + ' connected!');
end;

end.
