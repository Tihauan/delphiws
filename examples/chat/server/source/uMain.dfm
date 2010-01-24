object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'Delphi websockets chat demo server'
  ClientHeight = 249
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    480
    249)
  PixelsPerInch = 96
  TextHeight = 13
  object btnBroadcast: TButton
    Left = 384
    Top = 220
    Width = 88
    Height = 21
    Anchors = [akRight, akBottom]
    Caption = 'Broadcast'
    TabOrder = 0
    OnClick = btnBroadcastClick
  end
  object mmoMessages: TMemo
    Left = 8
    Top = 8
    Width = 464
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 1
  end
  object edtBroadcastMsg: TEdit
    Left = 8
    Top = 220
    Width = 370
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
  end
end
