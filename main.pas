unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList;

type
  TFMain = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    acNewDesen: TAction;
    Seenekler1: TMenuItem;
    YeniDesen1: TMenuItem;
    procedure acNewDesenExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses desenu;

{$R *.dfm}

procedure TFMain.acNewDesenExecute(Sender: TObject);
begin
NewDesen;
end;

end.
