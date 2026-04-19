program sting;

uses
  Forms,
  main in 'main.pas' {FMain},
  desenu in 'desenu.pas' {FDesen};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
