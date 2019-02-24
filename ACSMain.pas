unit ACSMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Frota1: TMemo;
    frota2: TMemo;
    frota3: TMemo;
    frota4: TMemo;
    frota5: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Panel1: TPanel;
    Memo1: TMemo;
    Label1: TLabel;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
    Label2: TLabel;
    Memo6: TMemo;
    Memo7: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Memo8: TMemo;
    Memo9: TMemo;
    Memo10: TMemo;
    Memo11: TMemo;
    Memo12: TMemo;
    Memo13: TMemo;
    Memo14: TMemo;
    Memo15: TMemo;
    Memo16: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Memo17: TMemo;
    Memo18: TMemo;
    Memo19: TMemo;
    Memo20: TMemo;
    Memo21: TMemo;
    Memo22: TMemo;
    Memo23: TMemo;
    Memo24: TMemo;
    Memo25: TMemo;
    Button11: TButton;
    Memo26: TMemo;
    Memo27: TMemo;
    Memo28: TMemo;
    Memo29: TMemo;
    Memo30: TMemo;
    Label5: TLabel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    RadioGroup1: TRadioGroup;
    TrackBar1: TTrackBar;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label11: TLabel;
    Edit2: TEdit;
    Button34: TButton;
    Label12: TLabel;
    Panel3: TPanel;
    Label13: TLabel;
    Memo31: TMemo;
    Memo32: TMemo;
    Memo33: TMemo;
    Memo34: TMemo;
    Memo35: TMemo;
    BalloonHint1: TBalloonHint;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure ResetFleet(Index:integer);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button11Click(Sender: TObject);
    procedure Save(index:integer);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Load(index:integer);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Addperdas(i: integer);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure RefreshTotals;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TShipValue = Record
    Number:int64;
    Metal:int64;
    Cristal:int64;
    Deutas:int64;
  end;
  TFrota = Record
    Nome_da_besta:ShortString;
    Cargo_pequeno:TShipValue;
    Cargo_grande:TShipValue;
    Caca_ligeiro:TShipValue;
    Caca_pesado:TShipValue;
    Cruzador:TShipValue;
    NB:TShipValue;
    NColonizacao:TShipValue;
    Reciclador:TShipValue;
    Sonda:TShipValue;
    Bombardeiro:TShipValue;
    Destruidor:TShipValue;
    EDM:TShipValue;
    Interceptor:TShipValue;
    MetalLoss:int64;
    CristalLoss:int64;
    DeutasLoss:int64;
    Gasoil:ShortString;
    CMetal:ShortString;
    CCristal:ShortString;
    RMetal:ShortString;
    RCristal:ShortString;
    RDeutas:ShortString;
  end;
  TRec = record
   metal:ShortString;
   cristal:ShortString;
  end;


var
  Form1: TForm1;
  Atacantes: array [1..5] of TFrota;
  nr_atacantes:integer;
  Frotas: array [1..5] of TFrota;
  pontosfrota: array [1..5] of int64;


implementation

uses ACSFrota, ACSResult, ACSVaga, ACSCiclagem;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FleetIndex:=1;
  frotasbox:=false;
  if not assigned(Editarfrota[1]) then
   Editarfrota[1]:=TEditarfrota.create(application);
  Editarfrota[1].Show;
  Editarfrota[1].Caption:= 'Frota 1 - Perdas';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FleetIndex:=2;
  frotasbox:=false;
  if not assigned(Editarfrota[2]) then
   Editarfrota[2]:=TEditarfrota.create(application);
  Editarfrota[2].Show;
  Editarfrota[2].Caption:= 'Frota 2 - Perdas';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FleetIndex:=3;
  frotasbox:=false;
  if not assigned(Editarfrota[3]) then
   Editarfrota[3]:=TEditarfrota.create(application);
  Editarfrota[3].Show;
  Editarfrota[3].Caption:= 'Frota 3 - Perdas';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  FleetIndex:=4;
  frotasbox:=false;
  if not assigned(Editarfrota[4]) then
   Editarfrota[4]:=TEditarfrota.create(application);
  Editarfrota[4].Show;
  Editarfrota[4].Caption:= 'Frota 4 - Perdas';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  FleetIndex:=5;
  frotasbox:=false;
  if not assigned(Editarfrota[5]) then
   Editarfrota[5]:=TEditarfrota.create(application);
  Editarfrota[5].Show;
  Editarfrota[5].Caption:= 'Frota 5 - Perdas';
end;

procedure TForm1.ResetFleet(Index:integer);
begin
  Atacantes[Index].Nome_da_besta:='';
  Atacantes[Index].Cargo_pequeno.Number:=0;
  Atacantes[Index].Cargo_grande.Number:=0;
  Atacantes[Index].Caca_ligeiro.Number:=0;
  Atacantes[Index].Caca_pesado.Number:=0;
  Atacantes[Index].Cruzador.Number:=0;
  Atacantes[Index].NB.Number:=0;
  Atacantes[Index].NColonizacao.Number:=0;
  Atacantes[Index].Reciclador.Number:=0;
  Atacantes[Index].Sonda.Number:=0;
  Atacantes[Index].Bombardeiro.Number:=0;
  Atacantes[Index].Destruidor.Number:=0;
  Atacantes[Index].EDM.Number:=0;
  Atacantes[Index].Interceptor.Number:=0;
  if Assigned(Editarfrota[Index]) then
    Editarfrota[Index].destroy;
  Editarfrota[Index]:=TEditarfrota.create(application);
  Frotas[Index].Nome_da_besta:='';
  Frotas[Index].Cargo_pequeno.Number:=0;
  Frotas[Index].Cargo_grande.Number:=0;
  Frotas[Index].Caca_ligeiro.Number:=0;
  Frotas[Index].Caca_pesado.Number:=0;
  Frotas[Index].Cruzador.Number:=0;
  Frotas[Index].NB.Number:=0;
  Frotas[Index].NColonizacao.Number:=0;
  Frotas[Index].Reciclador.Number:=0;
  Frotas[Index].Sonda.Number:=0;
  Frotas[Index].Bombardeiro.Number:=0;
  Frotas[Index].Destruidor.Number:=0;
  Frotas[Index].EDM.Number:=0;
  Frotas[Index].Interceptor.Number:=0;
  if Assigned(Frotatotal[Index]) then
    Frotatotal[Index].destroy;
  Frotatotal[Index]:=TEditarfrota.create(application);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Frota1.Lines.Clear;
  ResetFleet(1);
  memo1.Lines.Clear;
  memo6.Lines.Clear;
  memo7.Lines.Clear;
  memo16.Lines.Clear;
  memo17.Lines.Clear;
  memo26.Lines.Clear;
  RefreshTotals;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Frota2.Lines.Clear;
  ResetFleet(2);
  memo2.Lines.Clear;
  memo8.Lines.Clear;
  memo9.Lines.Clear;
  memo18.Lines.Clear;
  memo19.Lines.Clear;
  memo27.Lines.Clear;
  RefreshTotals;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Frota3.Lines.Clear;
  ResetFleet(3);
  memo3.Lines.Clear;
  memo10.Lines.Clear;
  memo11.Lines.Clear;
  memo20.Lines.Clear;
  memo21.Lines.Clear;
  memo28.Lines.Clear;
  RefreshTotals;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Frota4.Lines.Clear;
  ResetFleet(4);
  memo4.Lines.Clear;
  memo12.Lines.Clear;
  memo13.Lines.Clear;
  memo22.Lines.Clear;
  memo23.Lines.Clear;
  memo29.Lines.Clear;
  RefreshTotals;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
var
tempstr:string;
begin
  tempstr:=Tedit(sender).text;
  while Pos('.',tempstr ) > 0 do
   system.Delete(tempstr, Pos('.',tempstr ) ,1);

  Tedit(sender).text := tempstr;
  RefreshTotals;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  Frota5.Lines.Clear;
  ResetFleet(5);
  memo5.Lines.Clear;
  memo14.Lines.Clear;
  memo15.Lines.Clear;
  memo24.Lines.Clear;
  memo25.Lines.Clear;
  memo30.Lines.Clear;
  RefreshTotals;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
n:integer;
begin
 for n:=1 to 5 do
 begin
  Atacantes[n].Cargo_pequeno.Metal:=2000;
  Atacantes[n].Cargo_grande.Metal:=6000;
  Atacantes[n].Caca_ligeiro.Metal:=3000;
  Atacantes[n].Caca_pesado.Metal:=6000;
  Atacantes[n].Cruzador.Metal:=20000;
  Atacantes[n].NB.Metal:=45000;
  Atacantes[n].NColonizacao.Metal:=10000;
  Atacantes[n].Reciclador.Metal:=10000;
  Atacantes[n].Sonda.Metal:=0;
  Atacantes[n].Bombardeiro.Metal:=50000;
  Atacantes[n].Destruidor.Metal:=60000;
  Atacantes[n].EDM.Metal:=5000000;
  Atacantes[n].Interceptor.Metal:=30000;
  Atacantes[n].Cargo_pequeno.Cristal:=2000;
  Atacantes[n].Cargo_grande.Cristal:=6000;
  Atacantes[n].Caca_ligeiro.Cristal:=1000;
  Atacantes[n].Caca_pesado.Cristal:=4000;
  Atacantes[n].Cruzador.Cristal:=7000;
  Atacantes[n].NB.Cristal:=15000;
  Atacantes[n].NColonizacao.Cristal:=20000;
  Atacantes[n].Reciclador.Cristal:=6000;
  Atacantes[n].Sonda.Cristal:=1000;
  Atacantes[n].Bombardeiro.Cristal:=25000;
  Atacantes[n].Destruidor.Cristal:=50000;
  Atacantes[n].EDM.Cristal:=4000000;
  Atacantes[n].Interceptor.Cristal:=40000;
  Atacantes[n].Cargo_pequeno.Deutas:=0;
  Atacantes[n].Cargo_grande.Deutas:=0;
  Atacantes[n].Caca_ligeiro.Deutas:=0;
  Atacantes[n].Caca_pesado.Deutas:=0;
  Atacantes[n].Cruzador.Deutas:=2000;
  Atacantes[n].NB.Deutas:=0;
  Atacantes[n].NColonizacao.Deutas:=10000;
  Atacantes[n].Reciclador.Deutas:=2000;
  Atacantes[n].Sonda.Deutas:=0;
  Atacantes[n].Bombardeiro.Deutas:=15000;
  Atacantes[n].Destruidor.Deutas:=15000;
  Atacantes[n].EDM.Deutas:=1000000;
  Atacantes[n].Interceptor.Deutas:=15000;
  Atacantes[n].MetalLoss:=0;
  Atacantes[n].CristalLoss:=0;
  Atacantes[n].DeutasLoss:=0;

  Frotas[n].Cargo_pequeno.Metal:=2000;
  Frotas[n].Cargo_grande.Metal:=6000;
  Frotas[n].Caca_ligeiro.Metal:=3000;
  Frotas[n].Caca_pesado.Metal:=6000;
  Frotas[n].Cruzador.Metal:=20000;
  Frotas[n].NB.Metal:=45000;
  Frotas[n].NColonizacao.Metal:=10000;
  Frotas[n].Reciclador.Metal:=10000;
  Frotas[n].Sonda.Metal:=0;
  Frotas[n].Bombardeiro.Metal:=50000;
  Frotas[n].Destruidor.Metal:=60000;
  Frotas[n].EDM.Metal:=5000000;
  Frotas[n].Interceptor.Metal:=30000;
  Frotas[n].Cargo_pequeno.Cristal:=2000;
  Frotas[n].Cargo_grande.Cristal:=6000;
  Frotas[n].Caca_ligeiro.Cristal:=1000;
  Frotas[n].Caca_pesado.Cristal:=4000;
  Frotas[n].Cruzador.Cristal:=7000;
  Frotas[n].NB.Cristal:=15000;
  Frotas[n].NColonizacao.Cristal:=20000;
  Frotas[n].Reciclador.Cristal:=6000;
  Frotas[n].Sonda.Cristal:=1000;
  Frotas[n].Bombardeiro.Cristal:=25000;
  Frotas[n].Destruidor.Cristal:=50000;
  Frotas[n].EDM.Cristal:=4000000;
  Frotas[n].Interceptor.Cristal:=40000;
  Frotas[n].Cargo_pequeno.Deutas:=0;
  Frotas[n].Cargo_grande.Deutas:=0;
  Frotas[n].Caca_ligeiro.Deutas:=0;
  Frotas[n].Caca_pesado.Deutas:=0;
  Frotas[n].Cruzador.Deutas:=2000;
  Frotas[n].NB.Deutas:=0;
  Frotas[n].NColonizacao.Deutas:=10000;
  Frotas[n].Reciclador.Deutas:=2000;
  Frotas[n].Sonda.Deutas:=0;
  Frotas[n].Bombardeiro.Deutas:=15000;
  Frotas[n].Destruidor.Deutas:=15000;
  Frotas[n].EDM.Deutas:=1000000;
  Frotas[n].Interceptor.Deutas:=15000;
  Frotas[n].MetalLoss:=0;
  Frotas[n].CristalLoss:=0;
  Frotas[n].DeutasLoss:=0;
 end;
end;

procedure TForm1.Memo1Change;
var
tempstr:string;
begin
  tempstr:=TMemo(sender).Lines[0];
  while Pos('.',tempstr ) > 0 do
   system.Delete(tempstr, Pos('.',tempstr ) ,1);

  TMemo(sender).Lines[0] := tempstr;
  RefreshTotals;
end;

procedure TForm1.RefreshTotals;
begin
  //ciclagem metal
  memo31.Lines[0] :=  inttostr(strtoint64def(memo6.Lines.Strings[0],0)+
  strtoint64def(memo8.Lines.Strings[0],0)+
  strtoint64def(memo10.Lines.Strings[0],0)+
  strtoint64def(memo12.Lines.Strings[0],0)+
  strtoint64def(memo14.Lines.Strings[0],0)+
  strtoint64def(Edit1.Text,0));
  //ciclagem cristal
  memo32.Lines[0] :=  inttostr(strtoint64def(memo7.Lines.Strings[0],0)+
  strtoint64def(memo9.Lines.Strings[0],0)+
  strtoint64def(memo11.Lines.Strings[0],0)+
  strtoint64def(memo13.Lines.Strings[0],0)+
  strtoint64def(memo15.Lines.Strings[0],0)+
  strtoint64def(Edit2.Text,0));

  //roubo metal
  memo33.Lines[0] :=  inttostr(strtoint64def(memo16.Lines.Strings[0],0)+
  strtoint64def(memo18.Lines.Strings[0],0)+
  strtoint64def(memo20.Lines.Strings[0],0)+
  strtoint64def(memo22.Lines.Strings[0],0)+
  strtoint64def(memo24.Lines.Strings[0],0));
  //roubo cristal
  memo34.Lines[0] :=  inttostr(strtoint64def(memo17.Lines.Strings[0],0)+
  strtoint64def(memo19.Lines.Strings[0],0)+
  strtoint64def(memo21.Lines.Strings[0],0)+
  strtoint64def(memo23.Lines.Strings[0],0)+
  strtoint64def(memo25.Lines.Strings[0],0));
  //roubo deutério
  memo35.Lines[0] :=  inttostr(strtoint64def(memo26.Lines.Strings[0],0)+
  strtoint64def(memo27.Lines.Strings[0],0)+
  strtoint64def(memo28.Lines.Strings[0],0)+
  strtoint64def(memo29.Lines.Strings[0],0)+
  strtoint64def(memo30.Lines.Strings[0],0));
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9', #8]) then exit;
  if (GetKeyState(VK_LCONTROL)<0) then exit;

  Key := #0;
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  n:integer;

begin
  nr_atacantes:=0;
  if CompareStr('',Atacantes[1].Nome_da_besta)<>0 then
   begin
     inc(nr_atacantes);
     Addperdas(1);
     Lucro[nr_atacantes].nome:=Atacantes[1].Nome_da_besta;
     if CompareStr('',memo1.Lines[0])<>0 then
      Atacantes[1].DeutasLoss:=Atacantes[1].DeutasLoss+strtoint64(memo1.Lines[0]);
     if CompareStr('',memo6.Lines[0])<>0 then
      Atacantes[1].MetalLoss:=Atacantes[1].MetalLoss-strtoint64(memo6.Lines[0]);
     if CompareStr('',memo7.Lines[0])<>0 then
      Atacantes[1].CristalLoss:=Atacantes[1].CristalLoss-strtoint64(memo7.Lines[0]);
     if CompareStr('',memo16.Lines[0])<>0 then
      Atacantes[1].MetalLoss:=Atacantes[1].MetalLoss-strtoint64(memo16.Lines[0]);
     if CompareStr('',memo17.Lines[0])<>0 then
      Atacantes[1].CristalLoss:=Atacantes[1].CristalLoss-strtoint64(memo17.Lines[0]);
     if CompareStr('',memo26.Lines[0])<>0 then
      Atacantes[1].DeutasLoss:=Atacantes[1].DeutasLoss-strtoint64(memo26.Lines[0]);

     Lucro[nr_atacantes].Metal:=-Atacantes[1].MetalLoss;
     Lucro[nr_atacantes].Cristal:=-Atacantes[1].CristalLoss;
     Lucro[nr_atacantes].Deutas:=-Atacantes[1].DeutasLoss;
   end;

  if CompareStr('',Atacantes[2].Nome_da_besta)<>0 then
   begin
     inc(nr_atacantes);
     Addperdas(2);
     Lucro[nr_atacantes].nome:=Atacantes[2].Nome_da_besta;
     if CompareStr('',memo2.Lines[0])<>0 then
      Atacantes[2].DeutasLoss:=Atacantes[2].DeutasLoss+strtoint64(memo2.Lines[0]);
     if CompareStr('',memo8.Lines[0])<>0 then
      Atacantes[2].MetalLoss:=Atacantes[2].MetalLoss-strtoint64(memo8.Lines[0]);
     if CompareStr('',memo9.Lines[0])<>0 then
      Atacantes[2].CristalLoss:=Atacantes[2].CristalLoss-strtoint64(memo9.Lines[0]);
     if CompareStr('',memo18.Lines[0])<>0 then
      Atacantes[2].MetalLoss:=Atacantes[2].MetalLoss-strtoint64(memo18.Lines[0]);
     if CompareStr('',memo19.Lines[0])<>0 then
      Atacantes[2].CristalLoss:=Atacantes[2].CristalLoss-strtoint64(memo19.Lines[0]);
     if CompareStr('',memo27.Lines[0])<>0 then
      Atacantes[2].DeutasLoss:=Atacantes[2].DeutasLoss-strtoint64(memo27.Lines[0]);

     Lucro[nr_atacantes].Metal:=-Atacantes[2].MetalLoss;
     Lucro[nr_atacantes].Cristal:=-Atacantes[2].CristalLoss;
     Lucro[nr_atacantes].Deutas:=-Atacantes[2].DeutasLoss;
   end;

  if CompareStr('',Atacantes[3].Nome_da_besta)<>0 then
   begin
     inc(nr_atacantes);
     Addperdas(3);
     Lucro[nr_atacantes].nome:=Atacantes[3].Nome_da_besta;
     if CompareStr('',memo3.Lines[0])<>0 then
      Atacantes[3].DeutasLoss:=Atacantes[3].DeutasLoss+strtoint64(memo3.Lines[0]);
     if CompareStr('',memo10.Lines[0])<>0 then
      Atacantes[3].MetalLoss:=Atacantes[3].MetalLoss-strtoint64(memo10.Lines[0]);
     if CompareStr('',memo11.Lines[0])<>0 then
      Atacantes[3].CristalLoss:=Atacantes[3].CristalLoss-strtoint64(memo11.Lines[0]);
     if CompareStr('',memo20.Lines[0])<>0 then
      Atacantes[3].MetalLoss:=Atacantes[3].MetalLoss-strtoint64(memo20.Lines[0]);
     if CompareStr('',memo21.Lines[0])<>0 then
      Atacantes[3].CristalLoss:=Atacantes[3].CristalLoss-strtoint64(memo21.Lines[0]);
     if CompareStr('',memo28.Lines[0])<>0 then
      Atacantes[3].DeutasLoss:=Atacantes[3].DeutasLoss-strtoint64(memo28.Lines[0]);

     Lucro[nr_atacantes].Metal:=-Atacantes[3].MetalLoss;
     Lucro[nr_atacantes].Cristal:=-Atacantes[3].CristalLoss;
     Lucro[nr_atacantes].Deutas:=-Atacantes[3].DeutasLoss;
   end;

  if CompareStr('',Atacantes[4].Nome_da_besta)<>0 then
   begin
     inc(nr_atacantes);
     Addperdas(4);
     Lucro[nr_atacantes].nome:=Atacantes[4].Nome_da_besta;
     if CompareStr('',memo4.Lines[0])<>0 then
      Atacantes[4].DeutasLoss:=Atacantes[4].DeutasLoss+strtoint64(memo4.Lines[0]);
     if CompareStr('',memo12.Lines[0])<>0 then
      Atacantes[4].MetalLoss:=Atacantes[4].MetalLoss-strtoint64(memo12.Lines[0]);
     if CompareStr('',memo13.Lines[0])<>0 then
      Atacantes[4].CristalLoss:=Atacantes[4].CristalLoss-strtoint64(memo13.Lines[0]);
     if CompareStr('',memo22.Lines[0])<>0 then
      Atacantes[4].MetalLoss:=Atacantes[4].MetalLoss-strtoint64(memo22.Lines[0]);
     if CompareStr('',memo23.Lines[0])<>0 then
      Atacantes[4].CristalLoss:=Atacantes[4].CristalLoss-strtoint64(memo23.Lines[0]);
     if CompareStr('',memo29.Lines[0])<>0 then
      Atacantes[4].DeutasLoss:=Atacantes[4].DeutasLoss-strtoint64(memo29.Lines[0]);

     Lucro[nr_atacantes].Metal:=-Atacantes[4].MetalLoss;
     Lucro[nr_atacantes].Cristal:=-Atacantes[4].CristalLoss;
     Lucro[nr_atacantes].Deutas:=-Atacantes[4].DeutasLoss;
   end;

  if CompareStr('',Atacantes[5].Nome_da_besta)<>0 then
   begin
     inc(nr_atacantes);
     Addperdas(5);
     Lucro[nr_atacantes].nome:=Atacantes[5].Nome_da_besta;
     if CompareStr('',memo5.Lines[0])<>0 then
      Atacantes[5].DeutasLoss:=Atacantes[5].DeutasLoss+strtoint64(memo5.Lines[0]);
     if CompareStr('',memo14.Lines[0])<>0 then
      Atacantes[5].MetalLoss:=Atacantes[5].MetalLoss-strtoint64(memo14.Lines[0]);
     if CompareStr('',memo15.Lines[0])<>0 then
      Atacantes[5].CristalLoss:=Atacantes[5].CristalLoss-strtoint64(memo15.Lines[0]);
     if CompareStr('',memo24.Lines[0])<>0 then
      Atacantes[5].MetalLoss:=Atacantes[5].MetalLoss-strtoint64(memo24.Lines[0]);
     if CompareStr('',memo25.Lines[0])<>0 then
      Atacantes[5].CristalLoss:=Atacantes[5].CristalLoss-strtoint64(memo25.Lines[0]);
     if CompareStr('',memo30.Lines[0])<>0 then
      Atacantes[5].DeutasLoss:=Atacantes[5].DeutasLoss-strtoint64(memo30.Lines[0]);

     Lucro[nr_atacantes].Metal:=-Atacantes[5].MetalLoss;
     Lucro[nr_atacantes].Cristal:=-Atacantes[5].CristalLoss;
     Lucro[nr_atacantes].Deutas:=-Atacantes[5].DeutasLoss;
   end;

  if nr_atacantes>0 then
   begin
    Resultados:=TResultados.create(application);
    Resultados.Show;
   end;
  for n:=1 to 5 do
   begin
    Atacantes[n].MetalLoss:=0;
    Atacantes[n].CristalLoss:=0;
    Atacantes[n].DeutasLoss:=0;
   end;
end;

procedure TForm1.Save(index:integer);
var
  F : file of TFrota;
  S : file of TRec;
  recs:TRec;
begin
 case index of
  1:AssignFile(F,'frota1.dat') ;
  2:AssignFile(F,'frota2.dat') ;
  3:AssignFile(F,'frota3.dat') ;
  4:AssignFile(F,'frota4.dat') ;
  5:AssignFile(F,'frota5.dat') ;
  6:AssignFile(S,'reciclagens.dat') ;
  else exit;
  end;

 if index=6 then
  begin
   Rewrite(S) ;
   recs.metal:=edit1.text;
   recs.cristal:=edit2.text;
   Write (S, recs);
   CloseFile(S) ;
  end
 else
 if CompareStr('',Atacantes[index].Nome_da_besta)<>0 then
  begin
     Rewrite(F) ;
     case index of
     1: begin
      Atacantes[Index].Gasoil:= memo1.Lines.Strings[0];
      Atacantes[Index].CMetal:= memo6.Lines.Strings[0];
      Atacantes[Index].CCristal:= memo7.Lines.Strings[0];
      Atacantes[Index].RMetal:= memo16.Lines.Strings[0];
      Atacantes[Index].RCristal:= memo17.Lines.Strings[0];
      Atacantes[Index].RDeutas:= memo26.Lines.Strings[0];
     end;
     2: begin
      Atacantes[Index].Gasoil:= memo2.Lines.Strings[0];
      Atacantes[Index].CMetal:= memo8.Lines.Strings[0];
      Atacantes[Index].CCristal:= memo9.Lines.Strings[0];
      Atacantes[Index].RMetal:= memo18.Lines.Strings[0];
      Atacantes[Index].RCristal:= memo19.Lines.Strings[0];
      Atacantes[Index].RDeutas:= memo27.Lines.Strings[0];
     end;
     3: begin
      Atacantes[Index].Gasoil:= memo3.Lines.Strings[0];
      Atacantes[Index].CMetal:= memo10.Lines.Strings[0];
      Atacantes[Index].CCristal:= memo11.Lines.Strings[0];
      Atacantes[Index].RMetal:= memo20.Lines.Strings[0];
      Atacantes[Index].RCristal:= memo21.Lines.Strings[0];
      Atacantes[Index].RDeutas:= memo28.Lines.Strings[0];
     end;
     4: begin
      Atacantes[Index].Gasoil:= memo4.Lines.Strings[0];
      Atacantes[Index].CMetal:= memo12.Lines.Strings[0];
      Atacantes[Index].CCristal:= memo13.Lines.Strings[0];
      Atacantes[Index].RMetal:= memo22.Lines.Strings[0];
      Atacantes[Index].RCristal:= memo23.Lines.Strings[0];
      Atacantes[Index].RDeutas:= memo29.Lines.Strings[0];
     end;
     5: begin
      Atacantes[Index].Gasoil:= memo5.Lines.Strings[0];
      Atacantes[Index].CMetal:= memo14.Lines.Strings[0];
      Atacantes[Index].CCristal:= memo15.Lines.Strings[0];
      Atacantes[Index].RMetal:= memo24.Lines.Strings[0];
      Atacantes[Index].RCristal:= memo25.Lines.Strings[0];
      Atacantes[Index].RDeutas:= memo30.Lines.Strings[0];
     end;
    end;
   Write (F, Atacantes[index]);
   Write (F, Frotas[index]);
   CloseFile(F) ;
  end;

end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  form1.AlphaBlendValue:= 255-TrackBar1.Position;
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Save(1);
  ShowMessage('Frota 1 guardada com sucesso');
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Save(2);
  ShowMessage('Frota 2 guardada com sucesso');
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Save(3);
  ShowMessage('Frota 3 guardada com sucesso');
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Save(4);
  ShowMessage('Frota 4 guardada com sucesso');
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  Save(5);
  ShowMessage('Frota 5 guardada com sucesso');
end;

procedure TForm1.Button22Click(Sender: TObject);
var
n:integer;
begin
  for n:=1 to 6 do
   Save(n);

  ShowMessage('Frotas guardadas com sucesso');
end;

procedure TForm1.Load(index:integer);
var
  F : file of TFrota;
  S : file of TRec;
  recs:TRec;
begin
 case index of
  1:AssignFile(F,'frota1.dat') ;
  2:AssignFile(F,'frota2.dat') ;
  3:AssignFile(F,'frota3.dat') ;
  4:AssignFile(F,'frota4.dat') ;
  5:AssignFile(F,'frota5.dat') ;
  6:AssignFile(S,'reciclagens.dat') ;
  else exit;
 end;

  if index=6 then
   begin
   {$I-}
   reset(S);
   {$I+}
   If IOResult <> 0 then
    exit;
   if (filesize(S) = 0) then
    begin
     CloseFile(S);
     exit;
    end;
      Read(S, recs);
      CloseFile(S);
      edit1.Text:=recs.metal;
      edit2.Text:=recs.cristal;
   end
  else
  begin
  {$I-}
  reset(F);
  {$I+}
  If IOResult <> 0 then
   exit;
  if (filesize(F) = 0) then
   begin
    CloseFile(F);
    exit;
   end;


  Read(F, Atacantes[index]);
  Read(F, Frotas[index]);
  CloseFile(F);

     if not assigned(Editarfrota[index]) then
   Editarfrota[index]:=TEditarfrota.create(application);

   if CompareStr('',Atacantes[Index].Nome_da_besta)<>0 then
   Editarfrota[index].edit14.Text:=Atacantes[Index].Nome_da_besta
  else
   exit;
  Editarfrota[index].edit1.Text:=inttostr(Atacantes[Index].Cargo_pequeno.Number);
  Editarfrota[index].edit2.Text:=inttostr(Atacantes[Index].Cargo_grande.Number);
  Editarfrota[index].edit3.Text:=inttostr(Atacantes[Index].Caca_ligeiro.Number);
  Editarfrota[index].edit4.Text:=inttostr(Atacantes[Index].Caca_pesado.Number);
  Editarfrota[index].edit5.Text:=inttostr(Atacantes[Index].Cruzador.Number);
  Editarfrota[index].edit6.Text:=inttostr(Atacantes[Index].NB.Number);
  Editarfrota[index].edit7.Text:=inttostr(Atacantes[Index].NColonizacao.Number);
  Editarfrota[index].edit8.Text:=inttostr(Atacantes[Index].Reciclador.Number);
  Editarfrota[index].edit9.Text:=inttostr(Atacantes[Index].Sonda.Number);
  Editarfrota[index].edit10.Text:=inttostr(Atacantes[Index].Bombardeiro.Number);
  Editarfrota[index].edit11.Text:=inttostr(Atacantes[Index].Destruidor.Number);
  Editarfrota[index].edit12.Text:=inttostr(Atacantes[Index].EDM.Number);
  Editarfrota[index].edit13.Text:=inttostr(Atacantes[Index].Interceptor.Number);

  Atacantes[Index].MetalLoss:=(Atacantes[Index].Cargo_pequeno.Number*Atacantes[Index].Cargo_pequeno.Metal)
   +(Atacantes[Index].Cargo_grande.Number*Atacantes[Index].Cargo_grande.Metal)
   +(Atacantes[Index].Caca_ligeiro.Number*Atacantes[Index].Caca_ligeiro.Metal)
   +(Atacantes[Index].Caca_pesado.Number*Atacantes[Index].Caca_pesado.Metal)
   +(Atacantes[Index].Cruzador.Number*Atacantes[Index].Cruzador.Metal)
   +(Atacantes[Index].NB.Number*Atacantes[Index].NB.Metal)
   +(Atacantes[Index].NColonizacao.Number*Atacantes[Index].NColonizacao.Metal)
   +(Atacantes[Index].Reciclador.Number*Atacantes[Index].Reciclador.Metal)
   +(Atacantes[Index].Sonda.Number*Atacantes[Index].Sonda.Metal)
   +(Atacantes[Index].Bombardeiro.Number*Atacantes[Index].Bombardeiro.Metal)
   +(Atacantes[Index].Destruidor.Number*Atacantes[Index].Destruidor.Metal)
   +(Atacantes[Index].EDM.Number*Atacantes[Index].EDM.Metal)
   +(Atacantes[Index].Interceptor.Number*Atacantes[Index].Interceptor.Metal);

  Atacantes[Index].CristalLoss:=(Atacantes[Index].Cargo_pequeno.Number*Atacantes[Index].Cargo_pequeno.Cristal)
   +(Atacantes[Index].Cargo_grande.Number*Atacantes[Index].Cargo_grande.Cristal)
   +(Atacantes[Index].Caca_ligeiro.Number*Atacantes[Index].Caca_ligeiro.Cristal)
   +(Atacantes[Index].Caca_pesado.Number*Atacantes[Index].Caca_pesado.Cristal)
   +(Atacantes[Index].Cruzador.Number*Atacantes[Index].Cruzador.Cristal)
   +(Atacantes[Index].NB.Number*Atacantes[Index].NB.Cristal)
   +(Atacantes[Index].NColonizacao.Number*Atacantes[Index].NColonizacao.Cristal)
   +(Atacantes[Index].Reciclador.Number*Atacantes[Index].Reciclador.Cristal)
   +(Atacantes[Index].Sonda.Number*Atacantes[Index].Sonda.Cristal)
   +(Atacantes[Index].Bombardeiro.Number*Atacantes[Index].Bombardeiro.Cristal)
   +(Atacantes[Index].Destruidor.Number*Atacantes[Index].Destruidor.Cristal)
   +(Atacantes[Index].EDM.Number*Atacantes[Index].EDM.Cristal)
   +(Atacantes[Index].Interceptor.Number*Atacantes[Index].Interceptor.Cristal);

  Atacantes[Index].DeutasLoss:=(Atacantes[Index].Cargo_pequeno.Number*Atacantes[Index].Cargo_pequeno.Deutas)
   +(Atacantes[Index].Cargo_grande.Number*Atacantes[Index].Cargo_grande.Deutas)
   +(Atacantes[Index].Caca_ligeiro.Number*Atacantes[Index].Caca_ligeiro.Deutas)
   +(Atacantes[Index].Caca_pesado.Number*Atacantes[Index].Caca_pesado.Deutas)
   +(Atacantes[Index].Cruzador.Number*Atacantes[Index].Cruzador.Deutas)
   +(Atacantes[Index].NB.Number*Atacantes[Index].NB.Deutas)
   +(Atacantes[Index].NColonizacao.Number*Atacantes[Index].NColonizacao.Deutas)
   +(Atacantes[Index].Reciclador.Number*Atacantes[Index].Reciclador.Deutas)
   +(Atacantes[Index].Sonda.Number*Atacantes[Index].Sonda.Deutas)
   +(Atacantes[Index].Bombardeiro.Number*Atacantes[Index].Bombardeiro.Deutas)
   +(Atacantes[Index].Destruidor.Number*Atacantes[Index].Destruidor.Deutas)
   +(Atacantes[Index].EDM.Number*Atacantes[Index].EDM.Deutas)
   +(Atacantes[Index].Interceptor.Number*Atacantes[Index].Interceptor.Deutas);

  case index of
  1: begin
      memo1.Lines.Clear;
      memo1.Lines.Add(Atacantes[Index].Gasoil);
      memo1.SelStart := memo1.Perform(EM_LINEINDEX, 0, 0);
      memo1.SelLength := 0;
      memo6.Lines.Clear;
      memo6.Lines.Add(Atacantes[Index].CMetal);
      memo6.SelStart := memo6.Perform(EM_LINEINDEX, 0, 0);
      memo6.SelLength := 0;
      memo7.Lines.Clear;
      memo7.Lines.Add(Atacantes[Index].CCristal);
      memo7.SelStart := memo7.Perform(EM_LINEINDEX, 0, 0);
      memo7.SelLength := 0;
      memo16.Lines.Clear;
      memo16.Lines.Add(Atacantes[Index].RMetal);
      memo16.SelStart := memo16.Perform(EM_LINEINDEX, 0, 0);
      memo16.SelLength := 0;
      memo17.Lines.Clear;
      memo17.Lines.Add(Atacantes[Index].RCristal);
      memo17.SelStart := memo17.Perform(EM_LINEINDEX, 0, 0);
      memo17.SelLength := 0;
      memo26.Lines.Clear;
      memo26.Lines.Add(Atacantes[Index].RDeutas);
      memo26.SelStart := memo26.Perform(EM_LINEINDEX, 0, 0);
      memo26.SelLength := 0;
     end;
  2: begin
      memo2.Lines.Clear;
      memo2.Lines.Add(Atacantes[Index].Gasoil);
      memo2.SelStart := memo2.Perform(EM_LINEINDEX, 0, 0);
      memo2.SelLength := 0;
      memo8.Lines.Clear;
      memo8.Lines.Add(Atacantes[Index].CMetal);
      memo8.SelStart := memo8.Perform(EM_LINEINDEX, 0, 0);
      memo8.SelLength := 0;
      memo9.Lines.Clear;
      memo9.Lines.Add(Atacantes[Index].CCristal);
      memo9.SelStart := memo9.Perform(EM_LINEINDEX, 0, 0);
      memo9.SelLength := 0;
      memo18.Lines.Clear;
      memo18.Lines.Add(Atacantes[Index].RMetal);
      memo18.SelStart := memo18.Perform(EM_LINEINDEX, 0, 0);
      memo18.SelLength := 0;
      memo19.Lines.Clear;
      memo19.Lines.Add(Atacantes[Index].RCristal);
      memo19.SelStart := memo19.Perform(EM_LINEINDEX, 0, 0);
      memo19.SelLength := 0;
      memo27.Lines.Clear;
      memo27.Lines.Add(Atacantes[Index].RDeutas);
      memo27.SelStart := memo27.Perform(EM_LINEINDEX, 0, 0);
      memo27.SelLength := 0;
     end;
  3: begin
      memo3.Lines.Clear;
      memo3.Lines.Add(Atacantes[Index].Gasoil);
      memo3.SelStart := memo3.Perform(EM_LINEINDEX, 0, 0);
      memo3.SelLength := 0;
      memo10.Lines.Clear;
      memo10.Lines.Add(Atacantes[Index].CMetal);
      memo10.SelStart := memo10.Perform(EM_LINEINDEX, 0, 0);
      memo10.SelLength := 0;
      memo11.Lines.Clear;
      memo11.Lines.Add(Atacantes[Index].CCristal);
      memo11.SelStart := memo11.Perform(EM_LINEINDEX, 0, 0);
      memo11.SelLength := 0;
      memo20.Lines.Clear;
      memo20.Lines.Add(Atacantes[Index].RMetal);
      memo20.SelStart := memo20.Perform(EM_LINEINDEX, 0, 0);
      memo20.SelLength := 0;
      memo21.Lines.Clear;
      memo21.Lines.Add(Atacantes[Index].RCristal);
      memo21.SelStart := memo21.Perform(EM_LINEINDEX, 0, 0);
      memo21.SelLength := 0;
      memo28.Lines.Clear;
      memo28.Lines.Add(Atacantes[Index].RDeutas);
      memo28.SelStart := memo28.Perform(EM_LINEINDEX, 0, 0);
      memo28.SelLength := 0;
     end;
  4: begin
      memo4.Lines.Clear;
      memo4.Lines.Add(Atacantes[Index].Gasoil);
      memo4.SelStart := memo4.Perform(EM_LINEINDEX, 0, 0);
      memo4.SelLength := 0;
      memo12.Lines.Clear;
      memo12.Lines.Add(Atacantes[Index].CMetal);
      memo12.SelStart := memo12.Perform(EM_LINEINDEX, 0, 0);
      memo12.SelLength := 0;
      memo13.Lines.Clear;
      memo13.Lines.Add(Atacantes[Index].CCristal);
      memo13.SelStart := memo13.Perform(EM_LINEINDEX, 0, 0);
      memo13.SelLength := 0;
      memo22.Lines.Clear;
      memo22.Lines.Add(Atacantes[Index].RMetal);
      memo22.SelStart := memo22.Perform(EM_LINEINDEX, 0, 0);
      memo22.SelLength := 0;
      memo23.Lines.Clear;
      memo23.Lines.Add(Atacantes[Index].RCristal);
      memo23.SelStart := memo23.Perform(EM_LINEINDEX, 0, 0);
      memo23.SelLength := 0;
      memo29.Lines.Clear;
      memo29.Lines.Add(Atacantes[Index].RDeutas);
      memo29.SelStart := memo29.Perform(EM_LINEINDEX, 0, 0);
      memo29.SelLength := 0;
     end;
  5: begin
      memo5.Lines.Clear;
      memo5.Lines.Add(Atacantes[Index].Gasoil);
      memo5.SelStart := memo5.Perform(EM_LINEINDEX, 0, 0);
      memo5.SelLength := 0;
      memo14.Lines.Clear;
      memo14.Lines.Add(Atacantes[Index].CMetal);
      memo14.SelStart := memo14.Perform(EM_LINEINDEX, 0, 0);
      memo14.SelLength := 0;
      memo15.Lines.Clear;
      memo15.Lines.Add(Atacantes[Index].CCristal);
      memo15.SelStart := memo15.Perform(EM_LINEINDEX, 0, 0);
      memo15.SelLength := 0;
      memo24.Lines.Clear;
      memo24.Lines.Add(Atacantes[Index].RMetal);
      memo24.SelStart := memo24.Perform(EM_LINEINDEX, 0, 0);
      memo24.SelLength := 0;
      memo25.Lines.Clear;
      memo25.Lines.Add(Atacantes[Index].RCristal);
      memo25.SelStart := memo25.Perform(EM_LINEINDEX, 0, 0);
      memo25.SelLength := 0;
      memo30.Lines.Clear;
      memo30.Lines.Add(Atacantes[Index].RDeutas);
      memo30.SelStart := memo30.Perform(EM_LINEINDEX, 0, 0);
      memo30.SelLength := 0;
     end;
    end;

  if not assigned(Frotatotal[index]) then
   Frotatotal[index]:=TEditarfrota.create(application);
  if CompareStr('',Frotas[Index].Nome_da_besta)<>0 then
   Frotatotal[index].edit14.Text:=Frotas[Index].Nome_da_besta
  else
   exit;
  Frotatotal[index].edit1.Text:=inttostr(Frotas[Index].Cargo_pequeno.Number);
  Frotatotal[index].edit2.Text:=inttostr(Frotas[Index].Cargo_grande.Number);
  Frotatotal[index].edit3.Text:=inttostr(Frotas[Index].Caca_ligeiro.Number);
  Frotatotal[index].edit4.Text:=inttostr(Frotas[Index].Caca_pesado.Number);
  Frotatotal[index].edit5.Text:=inttostr(Frotas[Index].Cruzador.Number);
  Frotatotal[index].edit6.Text:=inttostr(Frotas[Index].NB.Number);
  Frotatotal[index].edit7.Text:=inttostr(Frotas[Index].NColonizacao.Number);
  Frotatotal[index].edit8.Text:=inttostr(Frotas[Index].Reciclador.Number);
  Frotatotal[index].edit9.Text:=inttostr(Frotas[Index].Sonda.Number);
  Frotatotal[index].edit10.Text:=inttostr(Frotas[Index].Bombardeiro.Number);
  Frotatotal[index].edit11.Text:=inttostr(Frotas[Index].Destruidor.Number);
  Frotatotal[index].edit12.Text:=inttostr(Frotas[Index].EDM.Number);
  Frotatotal[index].edit13.Text:=inttostr(Frotas[Index].Interceptor.Number);

  Frotas[Index].MetalLoss:=(Frotas[Index].Cargo_pequeno.Number*Frotas[Index].Cargo_pequeno.Metal)
   +(Frotas[Index].Cargo_grande.Number*Frotas[Index].Cargo_grande.Metal)
   +(Frotas[Index].Caca_ligeiro.Number*Frotas[Index].Caca_ligeiro.Metal)
   +(Frotas[Index].Caca_pesado.Number*Frotas[Index].Caca_pesado.Metal)
   +(Frotas[Index].Cruzador.Number*Frotas[Index].Cruzador.Metal)
   +(Frotas[Index].NB.Number*Frotas[Index].NB.Metal)
   +(Frotas[Index].NColonizacao.Number*Frotas[Index].NColonizacao.Metal)
   +(Frotas[Index].Reciclador.Number*Frotas[Index].Reciclador.Metal)
   +(Frotas[Index].Sonda.Number*Frotas[Index].Sonda.Metal)
   +(Frotas[Index].Bombardeiro.Number*Frotas[Index].Bombardeiro.Metal)
   +(Frotas[Index].Destruidor.Number*Frotas[Index].Destruidor.Metal)
   +(Frotas[Index].EDM.Number*Frotas[Index].EDM.Metal)
   +(Frotas[Index].Interceptor.Number*Frotas[Index].Interceptor.Metal);

  Frotas[Index].CristalLoss:=(Frotas[Index].Cargo_pequeno.Number*Frotas[Index].Cargo_pequeno.Cristal)
   +(Frotas[Index].Cargo_grande.Number*Frotas[Index].Cargo_grande.Cristal)
   +(Frotas[Index].Caca_ligeiro.Number*Frotas[Index].Caca_ligeiro.Cristal)
   +(Frotas[Index].Caca_pesado.Number*Frotas[Index].Caca_pesado.Cristal)
   +(Frotas[Index].Cruzador.Number*Frotas[Index].Cruzador.Cristal)
   +(Frotas[Index].NB.Number*Frotas[Index].NB.Cristal)
   +(Frotas[Index].NColonizacao.Number*Frotas[Index].NColonizacao.Cristal)
   +(Frotas[Index].Reciclador.Number*Frotas[Index].Reciclador.Cristal)
   +(Frotas[Index].Sonda.Number*Frotas[Index].Sonda.Cristal)
   +(Frotas[Index].Bombardeiro.Number*Frotas[Index].Bombardeiro.Cristal)
   +(Frotas[Index].Destruidor.Number*Frotas[Index].Destruidor.Cristal)
   +(Frotas[Index].EDM.Number*Frotas[Index].EDM.Cristal)
   +(Frotas[Index].Interceptor.Number*Frotas[Index].Interceptor.Cristal);

  Frotas[Index].DeutasLoss:=(Frotas[Index].Cargo_pequeno.Number*Frotas[Index].Cargo_pequeno.Deutas)
   +(Frotas[Index].Cargo_grande.Number*Frotas[Index].Cargo_grande.Deutas)
   +(Frotas[Index].Caca_ligeiro.Number*Frotas[Index].Caca_ligeiro.Deutas)
   +(Frotas[Index].Caca_pesado.Number*Frotas[Index].Caca_pesado.Deutas)
   +(Frotas[Index].Cruzador.Number*Frotas[Index].Cruzador.Deutas)
   +(Frotas[Index].NB.Number*Frotas[Index].NB.Deutas)
   +(Frotas[Index].NColonizacao.Number*Frotas[Index].NColonizacao.Deutas)
   +(Frotas[Index].Reciclador.Number*Frotas[Index].Reciclador.Deutas)
   +(Frotas[Index].Sonda.Number*Frotas[Index].Sonda.Deutas)
   +(Frotas[Index].Bombardeiro.Number*Frotas[Index].Bombardeiro.Deutas)
   +(Frotas[Index].Destruidor.Number*Frotas[Index].Destruidor.Deutas)
   +(Frotas[Index].EDM.Number*Frotas[Index].EDM.Deutas)
   +(Frotas[Index].Interceptor.Number*Frotas[Index].Interceptor.Deutas);

   pontosfrota[Index]:= Frotas[Index].MetalLoss + Frotas[Index].CristalLoss
       + Frotas[Index].DeutasLoss;
  end;

end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  Load(1);
  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Load(2);
  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Load(3);
  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  Load(4);
  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  Load(5);
  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button23Click(Sender: TObject);
var
n:integer;
begin
 for n:=1 to 6 do
  Load(n);

  UpdateMemos;
  RefreshTotals;
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  FleetIndex:=1;
  frotasbox:=true;
  if not assigned(Frotatotal[1]) then
   Frotatotal[1]:=TEditarfrota.create(application);
  Frotatotal[1].Show;
  Frotatotal[1].Caption:= 'Frota 1 - Frota';
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  FleetIndex:=2;
  frotasbox:=true;
  if not assigned(Frotatotal[2]) then
   Frotatotal[2]:=TEditarfrota.create(application);
  Frotatotal[2].Show;
  Frotatotal[2].Caption:= 'Frota 2 - Frota';
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  FleetIndex:=3;
  frotasbox:=true;
  if not assigned(Frotatotal[3]) then
   Frotatotal[3]:=TEditarfrota.create(application);
  Frotatotal[3].Show;
  Frotatotal[3].Caption:= 'Frota 3 - Frota';
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  FleetIndex:=4;
  frotasbox:=true;
  if not assigned(Frotatotal[4]) then
   Frotatotal[4]:=TEditarfrota.create(application);
  Frotatotal[4].Show;
  Frotatotal[4].Caption:= 'Frota 4 - Frota';
end;

procedure TForm1.Button28Click(Sender: TObject);
begin
  FleetIndex:=5;
  frotasbox:=true;
  if not assigned(Frotatotal[5]) then
   Frotatotal[5]:=TEditarfrota.create(application);
  Frotatotal[5].Show;
  Frotatotal[5].Caption:= 'Frota 5 - Frota';
end;

procedure TForm1.Button29Click(Sender: TObject);
begin
  FleetIndex:=1;
  Recursos.ShowModal;
end;

procedure TForm1.Button30Click(Sender: TObject);
begin
  FleetIndex:=2;
  Recursos.ShowModal;
end;

procedure TForm1.Button31Click(Sender: TObject);
begin
  FleetIndex:=3;
  Recursos.ShowModal;
end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  FleetIndex:=4;
  Recursos.ShowModal;
end;

procedure TForm1.Button33Click(Sender: TObject);
begin
  FleetIndex:=5;
  Recursos.ShowModal;
end;

procedure TForm1.Button34Click(Sender: TObject);
begin
  Recursos2.ShowModal;
end;

procedure TForm1.Addperdas(i: integer);
begin
  Atacantes[i].MetalLoss:=(Atacantes[i].Cargo_pequeno.Number*Atacantes[i].Cargo_pequeno.Metal)
   +(Atacantes[i].Cargo_grande.Number*Atacantes[i].Cargo_grande.Metal)
   +(Atacantes[i].Caca_ligeiro.Number*Atacantes[i].Caca_ligeiro.Metal)
   +(Atacantes[i].Caca_pesado.Number*Atacantes[i].Caca_pesado.Metal)
   +(Atacantes[i].Cruzador.Number*Atacantes[i].Cruzador.Metal)
   +(Atacantes[i].NB.Number*Atacantes[i].NB.Metal)
   +(Atacantes[i].NColonizacao.Number*Atacantes[i].NColonizacao.Metal)
   +(Atacantes[i].Reciclador.Number*Atacantes[i].Reciclador.Metal)
   +(Atacantes[i].Sonda.Number*Atacantes[i].Sonda.Metal)
   +(Atacantes[i].Bombardeiro.Number*Atacantes[i].Bombardeiro.Metal)
   +(Atacantes[i].Destruidor.Number*Atacantes[i].Destruidor.Metal)
   +(Atacantes[i].EDM.Number*Atacantes[i].EDM.Metal)
   +(Atacantes[i].Interceptor.Number*Atacantes[i].Interceptor.Metal);

  Atacantes[i].CristalLoss:=(Atacantes[i].Cargo_pequeno.Number*Atacantes[i].Cargo_pequeno.Cristal)
   +(Atacantes[i].Cargo_grande.Number*Atacantes[i].Cargo_grande.Cristal)
   +(Atacantes[i].Caca_ligeiro.Number*Atacantes[i].Caca_ligeiro.Cristal)
   +(Atacantes[i].Caca_pesado.Number*Atacantes[i].Caca_pesado.Cristal)
   +(Atacantes[i].Cruzador.Number*Atacantes[i].Cruzador.Cristal)
   +(Atacantes[i].NB.Number*Atacantes[i].NB.Cristal)
   +(Atacantes[i].NColonizacao.Number*Atacantes[i].NColonizacao.Cristal)
   +(Atacantes[i].Reciclador.Number*Atacantes[i].Reciclador.Cristal)
   +(Atacantes[i].Sonda.Number*Atacantes[i].Sonda.Cristal)
   +(Atacantes[i].Bombardeiro.Number*Atacantes[i].Bombardeiro.Cristal)
   +(Atacantes[i].Destruidor.Number*Atacantes[i].Destruidor.Cristal)
   +(Atacantes[i].EDM.Number*Atacantes[i].EDM.Cristal)
   +(Atacantes[i].Interceptor.Number*Atacantes[i].Interceptor.Cristal);

  Atacantes[i].DeutasLoss:=(Atacantes[i].Cargo_pequeno.Number*Atacantes[i].Cargo_pequeno.Deutas)
   +(Atacantes[i].Cargo_grande.Number*Atacantes[i].Cargo_grande.Deutas)
   +(Atacantes[i].Caca_ligeiro.Number*Atacantes[i].Caca_ligeiro.Deutas)
   +(Atacantes[i].Caca_pesado.Number*Atacantes[i].Caca_pesado.Deutas)
   +(Atacantes[i].Cruzador.Number*Atacantes[i].Cruzador.Deutas)
   +(Atacantes[i].NB.Number*Atacantes[i].NB.Deutas)
   +(Atacantes[i].NColonizacao.Number*Atacantes[i].NColonizacao.Deutas)
   +(Atacantes[i].Reciclador.Number*Atacantes[i].Reciclador.Deutas)
   +(Atacantes[i].Sonda.Number*Atacantes[i].Sonda.Deutas)
   +(Atacantes[i].Bombardeiro.Number*Atacantes[i].Bombardeiro.Deutas)
   +(Atacantes[i].Destruidor.Number*Atacantes[i].Destruidor.Deutas)
   +(Atacantes[i].EDM.Number*Atacantes[i].EDM.Deutas)
   +(Atacantes[i].Interceptor.Number*Atacantes[i].Interceptor.Deutas);
end;

initialization
  Application.MainFormOnTaskBar:=true;

end.
