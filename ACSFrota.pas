unit ACSFrota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Clipbrd, StrUtils, Types, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TEditarfrota = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Button1: TButton;
    Label14: TLabel;
    Edit14: TEdit;
    TrackBar1: TTrackBar;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Report: TMemo;
    BalloonHint1: TBalloonHint;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ReportEnter(Sender: TObject);
    procedure ParseText(text: string) ;
    procedure RefreshFormFields(Sender: TObject);
    procedure ReportChange(Sender: TObject);
    procedure UpdateLosses(Sender: TObject; index: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TFrotaNumber = Record
    Nome_da_besta:ShortString;
    Cargo_pequeno:int64;
    Cargo_grande:int64;
    Caca_ligeiro:int64;
    Caca_pesado:int64;
    Cruzador:int64;
    NB:int64;
    NColonizacao:int64;
    Reciclador:int64;
    Sonda:int64;
    Bombardeiro:int64;
    Destruidor:int64;
    EDM:int64;
    Interceptor:int64;
  end;

    procedure UpdateMemos;

var
  Editarfrota,Frotatotal: array [1..5] of TEditarfrota;
  FleetIndex, parsingIndex:integer;
  frotasbox: boolean;
  NumFrota, NumLosses: array [1..5] of TFrotaNumber;
  editedIndexes: array of integer;

implementation

uses ACSMain;

{$R *.DFM}


procedure TEditarfrota.Edit1Change(Sender: TObject);
var
tempstr:string;
begin
  tempstr:=TEdit(sender).text;
  while Pos('.',tempstr ) > 0 do
   system.Delete(tempstr, Pos('.',tempstr ) ,1);

  TEdit(sender).text := tempstr;
end;

procedure TEditarfrota.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9', #8]) then exit;
  if (GetKeyState(VK_LCONTROL)<0) then exit;

  Key := #0;
end;

procedure TEditarfrota.UpdateLosses(Sender: TObject; index: integer);
begin
  Atacantes[index].Nome_da_besta:= Editarfrota[index].Edit14.Text;
  if CompareStr('',Editarfrota[index].Edit1.Text)=0 then
   Atacantes[index].Cargo_pequeno.Number:= 0
  else
   Atacantes[index].Cargo_pequeno.Number:= strtoint64(Editarfrota[index].Edit1.Text);
  if CompareStr('',Editarfrota[index].Edit2.Text)=0 then
   Atacantes[index].Cargo_grande.Number:=0
  else
   Atacantes[index].Cargo_grande.Number:= strtoint64(Editarfrota[index].Edit2.Text);
  if CompareStr('',Editarfrota[index].Edit3.Text)=0 then
   Atacantes[index].Caca_ligeiro.Number:= 0
  else
   Atacantes[index].Caca_ligeiro.Number:= strtoint64(Editarfrota[index].Edit3.Text);
  if CompareStr('',Editarfrota[index].Edit4.Text)=0 then
   Atacantes[index].Caca_pesado.Number:=0
  else
   Atacantes[index].Caca_pesado.Number:= strtoint64(Editarfrota[index].Edit4.Text);
  if CompareStr('',Editarfrota[index].Edit5.Text)=0 then
   Atacantes[index].Cruzador.Number:= 0
  else
   Atacantes[index].Cruzador.Number:= strtoint64(Editarfrota[index].Edit5.Text);
  if CompareStr('',Editarfrota[index].Edit6.Text)=0 then
   Atacantes[index].NB.Number:= 0
  else
   Atacantes[index].NB.Number:= strtoint64(Editarfrota[index].Edit6.Text);
  if CompareStr('',Editarfrota[index].Edit7.Text)=0 then
   Atacantes[index].NColonizacao.Number:= 0
  else
   Atacantes[index].NColonizacao.Number:= strtoint64(Editarfrota[index].Edit7.Text);
  if CompareStr('',Editarfrota[index].Edit8.Text)=0 then
   Atacantes[index].Reciclador.Number:= 0
  else
   Atacantes[index].Reciclador.Number:= strtoint64(Editarfrota[index].Edit8.Text);
  if CompareStr('',Editarfrota[index].Edit9.Text)=0 then
   Atacantes[index].Sonda.Number:= 0
  else
   Atacantes[index].Sonda.Number:= strtoint64(Editarfrota[index].Edit9.Text);
  if CompareStr('',Editarfrota[index].Edit10.Text)=0 then
   Atacantes[index].Bombardeiro.Number:= 0
  else
   Atacantes[index].Bombardeiro.Number:= strtoint64(Editarfrota[index].Edit10.Text);
  if CompareStr('',Editarfrota[index].Edit11.Text)=0 then
   Atacantes[index].Destruidor.Number:= 0
  else
   Atacantes[index].Destruidor.Number:= strtoint64(Editarfrota[index].Edit11.Text);
  if CompareStr('',Editarfrota[index].Edit12.Text)=0 then
   Atacantes[index].EDM.Number:= 0
  else
   Atacantes[index].EDM.Number:= strtoint64(Editarfrota[index].Edit12.Text);
  if CompareStr('',Editarfrota[index].Edit13.Text)=0 then
   Atacantes[index].Interceptor.Number:= 0
  else
   Atacantes[index].Interceptor.Number:= strtoint64(Editarfrota[index].Edit13.Text);

  Atacantes[index].MetalLoss:=(Atacantes[index].Cargo_pequeno.Number*Atacantes[index].Cargo_pequeno.Metal)
   +(Atacantes[index].Cargo_grande.Number*Atacantes[index].Cargo_grande.Metal)
   +(Atacantes[index].Caca_ligeiro.Number*Atacantes[index].Caca_ligeiro.Metal)
   +(Atacantes[index].Caca_pesado.Number*Atacantes[index].Caca_pesado.Metal)
   +(Atacantes[index].Cruzador.Number*Atacantes[index].Cruzador.Metal)
   +(Atacantes[index].NB.Number*Atacantes[index].NB.Metal)
   +(Atacantes[index].NColonizacao.Number*Atacantes[index].NColonizacao.Metal)
   +(Atacantes[index].Reciclador.Number*Atacantes[index].Reciclador.Metal)
   +(Atacantes[index].Sonda.Number*Atacantes[index].Sonda.Metal)
   +(Atacantes[index].Bombardeiro.Number*Atacantes[index].Bombardeiro.Metal)
   +(Atacantes[index].Destruidor.Number*Atacantes[index].Destruidor.Metal)
   +(Atacantes[index].EDM.Number*Atacantes[index].EDM.Metal)
   +(Atacantes[index].Interceptor.Number*Atacantes[index].Interceptor.Metal);

  Atacantes[index].CristalLoss:=(Atacantes[index].Cargo_pequeno.Number*Atacantes[index].Cargo_pequeno.Cristal)
   +(Atacantes[index].Cargo_grande.Number*Atacantes[index].Cargo_grande.Cristal)
   +(Atacantes[index].Caca_ligeiro.Number*Atacantes[index].Caca_ligeiro.Cristal)
   +(Atacantes[index].Caca_pesado.Number*Atacantes[index].Caca_pesado.Cristal)
   +(Atacantes[index].Cruzador.Number*Atacantes[index].Cruzador.Cristal)
   +(Atacantes[index].NB.Number*Atacantes[index].NB.Cristal)
   +(Atacantes[index].NColonizacao.Number*Atacantes[index].NColonizacao.Cristal)
   +(Atacantes[index].Reciclador.Number*Atacantes[index].Reciclador.Cristal)
   +(Atacantes[index].Sonda.Number*Atacantes[index].Sonda.Cristal)
   +(Atacantes[index].Bombardeiro.Number*Atacantes[index].Bombardeiro.Cristal)
   +(Atacantes[index].Destruidor.Number*Atacantes[index].Destruidor.Cristal)
   +(Atacantes[index].EDM.Number*Atacantes[index].EDM.Cristal)
   +(Atacantes[index].Interceptor.Number*Atacantes[index].Interceptor.Cristal);

  Atacantes[index].DeutasLoss:=(Atacantes[index].Cargo_pequeno.Number*Atacantes[index].Cargo_pequeno.Deutas)
   +(Atacantes[index].Cargo_grande.Number*Atacantes[index].Cargo_grande.Deutas)
   +(Atacantes[index].Caca_ligeiro.Number*Atacantes[index].Caca_ligeiro.Deutas)
   +(Atacantes[index].Caca_pesado.Number*Atacantes[index].Caca_pesado.Deutas)
   +(Atacantes[index].Cruzador.Number*Atacantes[index].Cruzador.Deutas)
   +(Atacantes[index].NB.Number*Atacantes[index].NB.Deutas)
   +(Atacantes[index].NColonizacao.Number*Atacantes[index].NColonizacao.Deutas)
   +(Atacantes[index].Reciclador.Number*Atacantes[index].Reciclador.Deutas)
   +(Atacantes[index].Sonda.Number*Atacantes[index].Sonda.Deutas)
   +(Atacantes[index].Bombardeiro.Number*Atacantes[index].Bombardeiro.Deutas)
   +(Atacantes[index].Destruidor.Number*Atacantes[index].Destruidor.Deutas)
   +(Atacantes[index].EDM.Number*Atacantes[index].EDM.Deutas)
   +(Atacantes[index].Interceptor.Number*Atacantes[index].Interceptor.Deutas);

  UpdateMemos;
end;

procedure TEditarfrota.Button1Click(Sender: TObject);
begin
  if frotasbox then
   begin
   Frotas[FleetIndex].Nome_da_besta:= Edit14.Text;
    if CompareStr('',Edit1.Text)=0 then
     Frotas[FleetIndex].Cargo_pequeno.Number:= 0
    else
     Frotas[FleetIndex].Cargo_pequeno.Number:= strtoint64(Edit1.Text);
    if CompareStr('',Edit2.Text)=0 then
     Frotas[FleetIndex].Cargo_grande.Number:=0
    else
     Frotas[FleetIndex].Cargo_grande.Number:= strtoint64(Edit2.Text);
    if CompareStr('',Edit3.Text)=0 then
     Frotas[FleetIndex].Caca_ligeiro.Number:= 0
    else
     Frotas[FleetIndex].Caca_ligeiro.Number:= strtoint64(Edit3.Text);
    if CompareStr('',Edit4.Text)=0 then
     Frotas[FleetIndex].Caca_pesado.Number:=0
    else
     Frotas[FleetIndex].Caca_pesado.Number:= strtoint64(Edit4.Text);
    if CompareStr('',Edit5.Text)=0 then
     Frotas[FleetIndex].Cruzador.Number:= 0
    else
     Frotas[FleetIndex].Cruzador.Number:= strtoint64(Edit5.Text);
    if CompareStr('',Edit6.Text)=0 then
     Frotas[FleetIndex].NB.Number:= 0
    else
     Frotas[FleetIndex].NB.Number:= strtoint64(Edit6.Text);
    if CompareStr('',Edit7.Text)=0 then
     Frotas[FleetIndex].NColonizacao.Number:= 0
    else
     Frotas[FleetIndex].NColonizacao.Number:= strtoint64(Edit7.Text);
    if CompareStr('',Edit8.Text)=0 then
     Frotas[FleetIndex].Reciclador.Number:= 0
    else
     Frotas[FleetIndex].Reciclador.Number:= strtoint64(Edit8.Text);
    if CompareStr('',Edit9.Text)=0 then
     Frotas[FleetIndex].Sonda.Number:= 0
    else
     Frotas[FleetIndex].Sonda.Number:= strtoint64(Edit9.Text);
    if CompareStr('',Edit10.Text)=0 then
     Frotas[FleetIndex].Bombardeiro.Number:= 0
    else
     Frotas[FleetIndex].Bombardeiro.Number:= strtoint64(Edit10.Text);
    if CompareStr('',Edit11.Text)=0 then
     Frotas[FleetIndex].Destruidor.Number:= 0
    else
     Frotas[FleetIndex].Destruidor.Number:= strtoint64(Edit11.Text);
    if CompareStr('',Edit12.Text)=0 then
     Frotas[FleetIndex].EDM.Number:= 0
    else
     Frotas[FleetIndex].EDM.Number:= strtoint64(Edit12.Text);
    if CompareStr('',Edit13.Text)=0 then
     Frotas[FleetIndex].Interceptor.Number:= 0
    else
     Frotas[FleetIndex].Interceptor.Number:= strtoint64(Edit13.Text);

  Frotas[FleetIndex].MetalLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Metal)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Metal)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Metal)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Metal)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Metal)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Metal)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Metal)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Metal)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Metal)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Metal)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Metal)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Metal)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Metal);

  Frotas[FleetIndex].CristalLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Cristal)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Cristal)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Cristal)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Cristal)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Cristal)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Cristal)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Cristal)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Cristal)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Cristal)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Cristal)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Cristal)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Cristal)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Cristal);

  Frotas[FleetIndex].DeutasLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Deutas)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Deutas)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Deutas)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Deutas)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Deutas)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Deutas)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Deutas)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Deutas)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Deutas)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Deutas)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Deutas)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Deutas)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Deutas);

   pontosfrota[FleetIndex]:= Frotas[FleetIndex].MetalLoss + Frotas[FleetIndex].CristalLoss
       + Frotas[FleetIndex].DeutasLoss;

   end;
   if assigned(Editarfrota[FleetIndex]) then
     Editarfrota[FleetIndex].UpdateLosses(sender, FleetIndex);
   close;
   TEditarfrota(self).ActiveControl := nil;
end;

function printNumber(number: int64): string;
begin
  Result := Format('%.0n', [number/1.0]);
end;

procedure UpdateMemo(memo: TMemo; atacante: TFrota);
begin
  memo.Lines.Clear;
  memo.Lines.Add(atacante.Nome_da_besta);
  memo.Lines.Add('');
  memo.Lines.Add('CP: '+printNumber(atacante.Cargo_pequeno.Number));
  memo.Lines.Add('CG: '+printNumber(atacante.Cargo_grande.Number));
  memo.Lines.Add('CCL: '+printNumber(atacante.Caca_ligeiro.Number));
  memo.Lines.Add('CCP: '+printNumber(atacante.Caca_pesado.Number));
  memo.Lines.Add('Cruza: '+printNumber(atacante.Cruzador.Number));
  memo.Lines.Add('NB: '+printNumber(atacante.NB.Number));
  memo.Lines.Add('NC: '+printNumber(atacante.NColonizacao.Number));
  memo.Lines.Add('Cicla: '+printNumber(atacante.Reciclador.Number));
  memo.Lines.Add('Sonda: '+printNumber(atacante.Sonda.Number));
  memo.Lines.Add('Bomber: '+printNumber(atacante.Bombardeiro.Number));
  memo.Lines.Add('Destrua: '+printNumber(atacante.Destruidor.Number));
  memo.Lines.Add('EDM: '+printNumber(atacante.EDM.Number));
  memo.Lines.Add('Inter: '+printNumber(atacante.Interceptor.Number));

  memo.Lines.Add('Metal: '+printNumber(atacante.MetalLoss));
  memo.Lines.Add('Cristal: '+printNumber(atacante.CristalLoss));
  memo.Lines.Add('Deutério: '+printNumber(atacante.DeutasLoss));

end;

procedure UpdateMemos;
begin
  FormatSettings.ThousandSeparator:= '.';
  if CompareStr('',Atacantes[1].Nome_da_besta)<>0 then
    UpdateMemo(ACSMain.Form1.Frota1, Atacantes[1]);

  if CompareStr('',Atacantes[2].Nome_da_besta)<>0 then
    UpdateMemo(ACSMain.Form1.Frota2, Atacantes[2]);

  if CompareStr('',Atacantes[3].Nome_da_besta)<>0 then
    UpdateMemo(ACSMain.Form1.Frota3, Atacantes[3]);

  if CompareStr('',Atacantes[4].Nome_da_besta)<>0 then
    UpdateMemo(ACSMain.Form1.Frota4, Atacantes[4]);

  if CompareStr('',Atacantes[5].Nome_da_besta)<>0 then
    UpdateMemo(ACSMain.Form1.Frota5, Atacantes[5]);
end;

procedure TEditarfrota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if frotasbox then
   begin
   Frotas[FleetIndex].Nome_da_besta:= Edit14.Text;
    if CompareStr('',Edit1.Text)=0 then
     Frotas[FleetIndex].Cargo_pequeno.Number:= 0
    else
     Frotas[FleetIndex].Cargo_pequeno.Number:= strtoint64(Edit1.Text);
    if CompareStr('',Edit2.Text)=0 then
     Frotas[FleetIndex].Cargo_grande.Number:=0
    else
     Frotas[FleetIndex].Cargo_grande.Number:= strtoint64(Edit2.Text);
    if CompareStr('',Edit3.Text)=0 then
     Frotas[FleetIndex].Caca_ligeiro.Number:= 0
    else
     Frotas[FleetIndex].Caca_ligeiro.Number:= strtoint64(Edit3.Text);
    if CompareStr('',Edit4.Text)=0 then
     Frotas[FleetIndex].Caca_pesado.Number:=0
    else
     Frotas[FleetIndex].Caca_pesado.Number:= strtoint64(Edit4.Text);
    if CompareStr('',Edit5.Text)=0 then
     Frotas[FleetIndex].Cruzador.Number:= 0
    else
     Frotas[FleetIndex].Cruzador.Number:= strtoint64(Edit5.Text);
    if CompareStr('',Edit6.Text)=0 then
     Frotas[FleetIndex].NB.Number:= 0
    else
     Frotas[FleetIndex].NB.Number:= strtoint64(Edit6.Text);
    if CompareStr('',Edit7.Text)=0 then
     Frotas[FleetIndex].NColonizacao.Number:= 0
    else
     Frotas[FleetIndex].NColonizacao.Number:= strtoint64(Edit7.Text);
    if CompareStr('',Edit8.Text)=0 then
     Frotas[FleetIndex].Reciclador.Number:= 0
    else
     Frotas[FleetIndex].Reciclador.Number:= strtoint64(Edit8.Text);
    if CompareStr('',Edit9.Text)=0 then
     Frotas[FleetIndex].Sonda.Number:= 0
    else
     Frotas[FleetIndex].Sonda.Number:= strtoint64(Edit9.Text);
    if CompareStr('',Edit10.Text)=0 then
     Frotas[FleetIndex].Bombardeiro.Number:= 0
    else
     Frotas[FleetIndex].Bombardeiro.Number:= strtoint64(Edit10.Text);
    if CompareStr('',Edit11.Text)=0 then
     Frotas[FleetIndex].Destruidor.Number:= 0
    else
     Frotas[FleetIndex].Destruidor.Number:= strtoint64(Edit11.Text);
    if CompareStr('',Edit12.Text)=0 then
     Frotas[FleetIndex].EDM.Number:= 0
    else
     Frotas[FleetIndex].EDM.Number:= strtoint64(Edit12.Text);
    if CompareStr('',Edit13.Text)=0 then
     Frotas[FleetIndex].Interceptor.Number:= 0
    else
     Frotas[FleetIndex].Interceptor.Number:= strtoint64(Edit13.Text);

  Frotas[FleetIndex].MetalLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Metal)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Metal)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Metal)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Metal)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Metal)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Metal)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Metal)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Metal)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Metal)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Metal)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Metal)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Metal)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Metal);

  Frotas[FleetIndex].CristalLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Cristal)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Cristal)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Cristal)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Cristal)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Cristal)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Cristal)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Cristal)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Cristal)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Cristal)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Cristal)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Cristal)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Cristal)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Cristal);

  Frotas[FleetIndex].DeutasLoss:=(Frotas[FleetIndex].Cargo_pequeno.Number*Frotas[FleetIndex].Cargo_pequeno.Deutas)
   +(Frotas[FleetIndex].Cargo_grande.Number*Frotas[FleetIndex].Cargo_grande.Deutas)
   +(Frotas[FleetIndex].Caca_ligeiro.Number*Frotas[FleetIndex].Caca_ligeiro.Deutas)
   +(Frotas[FleetIndex].Caca_pesado.Number*Frotas[FleetIndex].Caca_pesado.Deutas)
   +(Frotas[FleetIndex].Cruzador.Number*Frotas[FleetIndex].Cruzador.Deutas)
   +(Frotas[FleetIndex].NB.Number*Frotas[FleetIndex].NB.Deutas)
   +(Frotas[FleetIndex].NColonizacao.Number*Frotas[FleetIndex].NColonizacao.Deutas)
   +(Frotas[FleetIndex].Reciclador.Number*Frotas[FleetIndex].Reciclador.Deutas)
   +(Frotas[FleetIndex].Sonda.Number*Frotas[FleetIndex].Sonda.Deutas)
   +(Frotas[FleetIndex].Bombardeiro.Number*Frotas[FleetIndex].Bombardeiro.Deutas)
   +(Frotas[FleetIndex].Destruidor.Number*Frotas[FleetIndex].Destruidor.Deutas)
   +(Frotas[FleetIndex].EDM.Number*Frotas[FleetIndex].EDM.Deutas)
   +(Frotas[FleetIndex].Interceptor.Number*Frotas[FleetIndex].Interceptor.Deutas);

   pontosfrota[FleetIndex]:= Frotas[FleetIndex].MetalLoss + Frotas[FleetIndex].CristalLoss
       + Frotas[FleetIndex].DeutasLoss;

   end;
   if assigned(Editarfrota[FleetIndex]) then
     Editarfrota[FleetIndex].UpdateLosses(sender, FleetIndex);
   //close;
   TEditarfrota(self).ActiveControl := nil;
end;

procedure TEditarfrota.FormShow(Sender: TObject);
begin
 if frotasbox then
  begin
  if CompareStr('',Atacantes[FleetIndex].Nome_da_besta)<>0 then
     Edit14.Text:=Atacantes[FleetIndex].Nome_da_besta;
  end
 else
 if CompareStr('',Frotas[FleetIndex].Nome_da_besta)<>0 then
   Edit14.Text:=Frotas[FleetIndex].Nome_da_besta
end;

procedure RefreshEdits(frota: TFrotaNumber; edit: TEditarfrota);
begin
  if CompareStr('',frota.Nome_da_besta)<>0 then
    edit.Edit14.Text := frota.Nome_da_besta;
  edit.Edit1.Text := IntToStr(frota.Cargo_pequeno);
  edit.Edit2.Text := IntToStr(frota.Cargo_grande);
  edit.Edit3.Text := IntToStr(frota.Caca_ligeiro);
  edit.Edit4.Text := IntToStr(frota.Caca_pesado);
  edit.Edit5.Text := IntToStr(frota.Cruzador);
  edit.Edit6.Text := IntToStr(frota.NB);
  edit.Edit7.Text := IntToStr(frota.NColonizacao);
  edit.Edit8.Text := IntToStr(frota.Reciclador);
  edit.Edit9.Text := IntToStr(frota.Sonda);
  edit.Edit10.Text := IntToStr(frota.Bombardeiro);
  edit.Edit11.Text := IntToStr(frota.Destruidor);
  edit.Edit12.Text := IntToStr(frota.EDM);
  edit.Edit13.Text := IntToStr(frota.Interceptor);

end;

procedure TEditarfrota.RefreshFormFields(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Length(editedIndexes)-1 do
     begin
        if not assigned(Editarfrota[editedIndexes[i]]) then
          Editarfrota[editedIndexes[i]]:=TEditarfrota.create(application);
        RefreshEdits(NumLosses[editedIndexes[i]],Editarfrota[editedIndexes[i]]);

        if not assigned(Frotatotal[editedIndexes[i]]) then
          Frotatotal[editedIndexes[i]]:=TEditarfrota.create(application);
        RefreshEdits(NumFrota[editedIndexes[i]],Frotatotal[editedIndexes[i]]);
        Editarfrota[editedIndexes[i]].UpdateLosses(sender, editedIndexes[i]);
     end;

end;


procedure TEditarfrota.ReportChange(Sender: TObject);
var
  i:integer;
  zoznam: TStringList;
  memo: TMemo;
begin
  memo:= Sender as TMemo;
  parsingIndex := 0;
  SetLength(editedIndexes, 0);
  zoznam := TStringList.Create;
  try
    zoznam.Text:=memo.Text;
    for i := 0 to zoznam.Count-1 do
      begin
         ParseText(zoznam.Strings[i]);
      end;
  finally
    zoznam.Free;
  end;
  RefreshFormFields(sender);
end;


procedure TEditarfrota.ReportEnter(Sender: TObject);
var
  memo: TMemo;
begin
  memo:= Sender as TMemo;
  memo.Clear;
end;


procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings) ;
begin
   ListOfStrings.Clear;
   ListOfStrings.Delimiter       := Delimiter;
   ListOfStrings.StrictDelimiter := True;
   ListOfStrings.DelimitedText   := Str;
end;

function CleanString(str: string):string ;
var
  clean: string;
  i: integer;
begin
  clean := '';
     for i:=1 to Length(str) do
       if (str[i] in ['0'..'9', #8]) then
          clean := clean + str[i];
    Result :=  clean;
end;

procedure TEditarfrota.ParseText(text: string) ;
var
   OutPutList: TStringList;
   list: TStringDynArray;
   i: integer;
   delimiters: string;
begin
   OutPutList := TStringList.Create;
   try
     Split(' ', text, OutPutList) ;
     i:=0;
     if (OutPutList.Count > 0) then

     if (CompareStr(OutPutList.Strings[i],'Atacante') = 0) or (CompareStr(OutPutList.Strings[i],'Defensor') = 0) then
     begin
       Inc(i);
       Inc(parsingIndex);  
       SetLength(editedIndexes, Length(editedIndexes) + 1);
       editedIndexes[Length(editedIndexes)-1] := parsingIndex;
       NumFrota[parsingIndex] := Default(TFrotaNumber);
       NumLosses[parsingIndex] := Default(TFrotaNumber);
       NumFrota[parsingIndex].Nome_da_besta := OutPutList.Strings[i];
       Inc(i);
       while i < OutPutList.Count do
       begin
         NumFrota[parsingIndex].Nome_da_besta := Concat(NumFrota[parsingIndex].Nome_da_besta,' ');
         NumFrota[parsingIndex].Nome_da_besta := Concat(NumFrota[parsingIndex].Nome_da_besta,OutPutList.Strings[i]);
         Inc(i);
       end;
       NumLosses[parsingIndex].Nome_da_besta := NumFrota[parsingIndex].Nome_da_besta;

     end
     else if parsingIndex = 0 then
       begin
         parsingIndex:= FleetIndex; 
         SetLength(editedIndexes, Length(editedIndexes) + 1); 
         editedIndexes[Length(editedIndexes)-1] := parsingIndex;
         NumFrota[parsingIndex] := Default(TFrotaNumber);
         NumLosses[parsingIndex] := Default(TFrotaNumber);
       end
     else if (CompareStr(OutPutList.Strings[i],'Cargueiro') = 0) then
       if (CompareStr(OutPutList.Strings[i+1],'Pequeno') = 0) then
         begin
           NumFrota[parsingIndex].Cargo_pequeno := strtoint64def(CleanString(OutPutList.Strings[i+2]),0);
           if OutPutList.Count > 4 then
             NumLosses[parsingIndex].Cargo_pequeno := Abs(strtoint64def(CleanString(OutPutList.Strings[i+4]),0));
         end
       else
         begin
           NumFrota[parsingIndex].Cargo_grande := strtoint64def(CleanString(OutPutList.Strings[i+2]),0);
           if OutPutList.Count > 4 then
             NumLosses[parsingIndex].Cargo_grande := Abs(strtoint64def(CleanString(OutPutList.Strings[i+4]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Caça') = 0) then
       if (CompareStr(OutPutList.Strings[i+1],'Ligeiro') = 0) then
         begin
           NumFrota[parsingIndex].Caca_ligeiro := strtoint64def(CleanString(OutPutList.Strings[i+2]),0);
           if OutPutList.Count > 4 then
             NumLosses[parsingIndex].Caca_ligeiro := Abs(strtoint64def(CleanString(OutPutList.Strings[i+4]),0));
         end
       else
         begin
           NumFrota[parsingIndex].Caca_pesado := strtoint64def(CleanString(OutPutList.Strings[i+2]),0);
           if OutPutList.Count > 4 then
             NumLosses[parsingIndex].Caca_pesado := Abs(strtoint64def(CleanString(OutPutList.Strings[i+4]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Cruzador') = 0) then
         begin
           NumFrota[parsingIndex].Cruzador := strtoint64def(CleanString(OutPutList.Strings[i+1]),0);
           if OutPutList.Count > 3 then
             NumLosses[parsingIndex].Cruzador := Abs(strtoint64def(CleanString(OutPutList.Strings[i+3]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Nave') = 0) then
       if (CompareStr(OutPutList.Strings[i+2],'Batalha') = 0) then
         begin
           NumFrota[parsingIndex].NB := strtoint64def(CleanString(OutPutList.Strings[i+3]),0);
           if OutPutList.Count > 5 then
             NumLosses[parsingIndex].NB := Abs(strtoint64def(CleanString(OutPutList.Strings[i+5]),0));
         end
       else
         begin
           NumFrota[parsingIndex].NColonizacao := strtoint64def(CleanString(OutPutList.Strings[i+3]),0);
           if OutPutList.Count > 5 then
             NumLosses[parsingIndex].NColonizacao := Abs(strtoint64def(CleanString(OutPutList.Strings[i+5]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Reciclador') = 0) then
         begin
           NumFrota[parsingIndex].Reciclador := strtoint64def(CleanString(OutPutList.Strings[i+1]),0);
           if OutPutList.Count > 3 then
             NumLosses[parsingIndex].Reciclador := Abs(strtoint64def(CleanString(OutPutList.Strings[i+3]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Sonda') = 0) then
         begin
           NumFrota[parsingIndex].Sonda := strtoint64def(CleanString(OutPutList.Strings[i+3]),0);
           if OutPutList.Count > 5 then
             NumLosses[parsingIndex].Sonda := Abs(strtoint64def(CleanString(OutPutList.Strings[i+5]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Bombardeiro') = 0) then
         begin
           NumFrota[parsingIndex].Bombardeiro := strtoint64def(CleanString(OutPutList.Strings[i+1]),0);
           if OutPutList.Count > 3 then
             NumLosses[parsingIndex].Bombardeiro := Abs(strtoint64def(CleanString(OutPutList.Strings[i+3]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Destruidor') = 0) then
         begin
           NumFrota[parsingIndex].Destruidor := strtoint64def(CleanString(OutPutList.Strings[i+1]),0);
           if OutPutList.Count > 3 then
             NumLosses[parsingIndex].Destruidor := Abs(strtoint64def(CleanString(OutPutList.Strings[i+3]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Estrela') = 0) then
         begin
           NumFrota[parsingIndex].EDM := strtoint64def(CleanString(OutPutList.Strings[i+3]),0);
           if OutPutList.Count > 5 then
             NumLosses[parsingIndex].EDM := Abs(strtoint64def(CleanString(OutPutList.Strings[i+5]),0));
         end
     else if (CompareStr(OutPutList.Strings[i],'Interceptor') = 0) then
         begin
           NumFrota[parsingIndex].Interceptor := strtoint64def(CleanString(OutPutList.Strings[i+1]),0);
           if OutPutList.Count > 3 then
             NumLosses[parsingIndex].Interceptor := Abs(strtoint64def(CleanString(OutPutList.Strings[i+3]),0));
         end

   finally
     OutPutList.Free;
   end;
end;

procedure TEditarfrota.TrackBar1Change(Sender: TObject);
begin
   TEditarfrota(self).AlphaBlendValue:= 255-TrackBar1.Position;
end;

end.
