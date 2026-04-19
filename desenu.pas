unit desenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Spin, Buttons;

type
  TFDesen = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    ScrollBox1: TScrollBox;
    Panel2: TPanel;
    Splitter1: TSplitter;
    TopBox: TPaintBox;
    LeftBox: TPaintBox;
    InBox: TPaintBox;
    ScrollBox2: TScrollBox;
    OrguBox: TPaintBox;
    Splitter2: TSplitter;
    ScrollBox3: TScrollBox;
    Image1: TImage;
    ColorDialog1: TColorDialog;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    SpinEdit2: TSpinEdit;
    Label2: TLabel;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    SpinEdit4: TSpinEdit;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TLBoxPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure InBoxPaint(Sender: TObject);
    procedure TopBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LeftBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure OrguBoxPaint(Sender: TObject);
    procedure OrguBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    LeftIp : TList ;
    TopIp  : TList ;
    Orgu   : Array Of String ;
    procedure BuildGraph;
  public
    { Public declarations }
  end;

 Procedure NewDesen ;


implementation

{$R *.dfm}


 Procedure NewDesen ;
  Begin
   TFDesen.Create(Application);
  end;

 Const
  MaxIp  = 999 ;
  MaxWH  = 10  ;
  MaxO   = 999 ;
  MaxOWH = 10  ;

Type
 IpC = Class
  Color : TColor ;
  ColNm : String ;
  Ne    : String ;
  IpNm  : String ;
  Active: Boolean;
  Constructor Create;
 End;

Constructor IpC.Create;
begin
 Color :=0;
 ColNm :='';
 Ne    :='';
 IpNm  :='';
 Active:=False;
end;

procedure TFDesen.BuildGraph;

 Var
  Rw,Rh,Ow,Oh : Integer ;
  X,Y         : Integer ;
  Col         : TColor  ;

 Function OrguP(Xx,Yy:Integer):Boolean;

  begin
   Result:=Orgu[Yy Mod Oh][Xx Mod Ow+1]='X';
  end;

 Function AtkiC(Yy:Integer):TColor;

  Begin
   Result:=IpC(LeftIP[Yy Mod Rh]).Color;
  end;


 Function CozguC(Xx:Integer):TColor;

  Begin
   Result:=IpC(TopIP[Xx Mod Rw]).Color;
  end;


 begin
  Rw:=SpinEdit1.Value;Rh:=SpinEdit2.Value;
  Ow:=SpinEdit3.Value;Oh:=SpinEdit4.Value;
  Image1.Canvas.Brush.Style:=bsSolid;
  Image1.Canvas.Pen.Width:=1;
  For Y:=0 To Image1.Height Div 2 Do
   For X:=0 To Image1.Width Div 2 Do
    begin
     If OrguP(X,Y) Then Col:=CozguC(X)
                   Else Col:=AtkiC(Y);
     Image1.Canvas.Pixels[X*2,Y*2]:=Col;
     Image1.Canvas.Pixels[X*2+1,Y*2]:=Col;
     Image1.Canvas.Pixels[X*2,Y*2+1]:=Col;
     Image1.Canvas.Pixels[X*2+1,Y*2+1]:=Col;
    end;
 end;

procedure TFDesen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TFDesen.FormCreate(Sender: TObject);
var i : Integer ;
begin
 Randomize;
 TopBox.Left:=MaxWH;
 TopBox.Top:=0;
 TopBox.Height:=MaxWH;
 TopBox.Width:=MaxIP*MaxWH;
 LeftBox.Left:=0;
 LeftBox.Top:=MaxWH;
 LeftBox.Height:=MaxIP*MaxWH;
 LeftBox.Width:=MaxWH;
 LeftIP:=TList.Create;
 LeftIP.Capacity:=MaxIP;
 TopIP:=TList.Create;
 TopIP.Capacity:=MaxIP;
 InBox.Top:=MaxWH;
 InBox.Left:=MaxWH;
 InBox.Width:=MaxIP*MaxWH;
 InBox.Height:=MaxIP*MaxWH;
 For I:=0 To MaxIP-1 Do
  begin
   LeftIP.Add(IpC.Create);
   TopIP.Add(IpC.Create);
  end;

 OrguBox.Left:=0;
 OrguBox.Top:=0;
 OrguBox.Height:=MaxOWH*MaxO;
 OrguBox.Width:=MaxOWH*MaxO;

 SetLength(Orgu,MaxO);
 For I:=0 To MaxO-1 Do
  begin
   SetLenGth(Orgu[I],MaxO);
   FillChar(Orgu[I][1],MaxO,' ');
  end; 
end;

procedure TFDesen.FormDestroy(Sender: TObject);
Var I : Integer ;
begin
 For I:=0 To MaxIP-1 Do
  Begin
   IPC(LeftIP[I]).Free;
   IPC(TopIP[I]).Free;
  End;
 LeftIP.Free;
 TopIP.Free; 
end;


procedure TFDesen.TLBoxPaint(Sender: TObject);
var
 I : Integer ;
 IC: IPC ;
begin
 With Sender as TPaintBox Do
  begin
   Canvas.Pen.Width:=1;
   Canvas.Pen.Color:=clBlack;
   For I:=0 To MaxIp-1 Do
    begin
     If Tag=1 Then IC:=IPC(TopIP[I])
      Else IC:=IPC(LeftIP[I]);
     Case IC.Active Of
      True : Begin
       Canvas.Brush.Style:=bsSolid;
       Canvas.Brush.Color:=Ic.Color;
      end;
      False : Begin
       Canvas.Brush.Style:=bsDiagCross;
       Canvas.Brush.Color:=clWhite;
      End;
     end;
     If Tag=1 Then Canvas.Rectangle(I*MaxWH,0,(I+1)*MaxWH,MaxWH)
      Else Canvas.Rectangle(0,I*MaxWH,MaxWH,(I+1)*MaxWH);
    End;
  end;
end;

procedure TFDesen.InBoxPaint(Sender: TObject);
var
 I : Integer ;
 IC: IPC ;

begin
 With InBox Do
  begin
   Canvas.Pen.Width:=1;
   Canvas.Pen.Color:=clBlack;
   For I:=0 To MaxIp-1 Do
    begin
     IC:=IPC(LeftIP[I]);
     If IC.Active Then
      Begin
       Canvas.Brush.Style:=bsSolid;
       Canvas.Brush.Color:=Ic.Color;
       Canvas.Rectangle(0,I*MaxWH+1,Width,(I+1)*MaxWH-1);
      End;
    end;
   For I:=0 To MaxIp-1 Do
    begin
     IC:=IPC(TopIP[I]);
     If IC.Active Then
      Begin
       Canvas.Brush.Style:=bsSolid;
       Canvas.Brush.Color:=Ic.Color;
       Canvas.Rectangle(I*MaxWH+1,0,(I+1)*MaxWH-1,Height);
      End;
    end;
  end;
end;

procedure TFDesen.TopBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
  I : Integer ;
  IC: IpC ;
begin
 If Button<>mbLeft Then Exit;
 If Not ColorDialog1.Execute Then Exit;
 I:=X Div MaxWH;
 IC:=IpC(TopIP[I]);
 IC.Color:=ColorDialog1.Color;
 IC.Active:=True;
 ScrollBox1.Invalidate;
end;

procedure TFDesen.LeftBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 var
  I : Integer ;
  IC: IpC ;
begin
 If Button<>mbLeft Then Exit;
 If Not ColorDialog1.Execute Then Exit;
 I:=Y Div MaxWH;
 IC:=IpC(LeftIP[I]);
 IC.Color:=ColorDialog1.Color;
 IC.Active:=True;
 ScrollBox1.Invalidate;
end;

procedure TFDesen.OrguBoxPaint(Sender: TObject);

Var
 I,J : Integer ;
 St  : String  ;
 
begin
 With OrguBox Do
  begin
   Canvas.Brush.Style:=bsSolid;
   Canvas.Brush.Color:=clWhite ;
   Canvas.Pen.Width:=1;
   Canvas.Pen.Color:=clBlack;
//   Canvas.FillRect(Canvas.ClipRect);
//   Canvas.Brush.Color:=clBlack;

   For I:=0 To MaxO-1 Do
    begin
     Canvas.MoveTo(0,I*MaxOWH);
     Canvas.LineTo(Height,I*MaxOWH);
     Canvas.MoveTo(I*MaxOWH,0);
     Canvas.LineTo(I*MaxOWH,Width);
     St:=Orgu[I];
     For J:=1 To MaxO Do
      If St[J]='X' Then
       Canvas.Rectangle((J-1)*MaxOWH,I*MaxOWH,J*MaxOWH,(I+1)*MaxOWH);
    end;
  end;  
end;

procedure TFDesen.OrguBoxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Xx,Yy : Integer ;
begin
 If Button<>mbLeft Then Exit;
 Xx:=X div MaxOWH+1;
 YY:=Y div MaxOWH;
 If Orgu[YY][XX]='X' Then
  Orgu[YY][XX]:=' '
   Else Orgu[YY][XX]:='X';
 ScrollBox2.Invalidate;  
end;

procedure TFDesen.Image1Click(Sender: TObject);
begin
 BuildGraph;
end;

end.
