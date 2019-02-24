program ACSProfitCalc;







uses
  Forms,
  ACSMain in 'ACSMain.pas' {Form1},
  ACSCiclagem in 'ACSCiclagem.pas' {Recursos2},
  ACSFrota in 'ACSFrota.pas' {Editarfrota},
  ACSResult in 'ACSResult.pas' {Resultados},
  ACSVaga in 'ACSVaga.pas' {Recursos},
  Vcl.Themes,
  Vcl.Styles;

{$R *.RES}

begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TRecursos2, Recursos2);
  Application.CreateForm(TEditarfrota, Editarfrota);
  Application.CreateForm(TResultados, Resultados);
  Application.CreateForm(TRecursos, Recursos);
  Application.Run;
end.
