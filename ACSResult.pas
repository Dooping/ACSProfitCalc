unit ACSResult;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Clipbrd, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls;

type
  TResultados = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    Memo5: TMemo;
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
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TLucro = Record
    Nome:string;
    Metal:int64;
    Cristal:int64;
    Deutas:int64;
  end;

var
  Resultados: TResultados;
  Lucro,Lucroporcao:array [1..5] of TLucro;
  LMetal,LCristal,LDeutas: int64;
  percentagem: array [1..5] of integer;

implementation

uses ACSMain;

{$R *.DFM}

function addNameAndData(name: TLabel; data: TMemo):String;
begin
  Result:=name.Caption + sLineBreak + sLineBreak + data.Lines.GetText + sLineBreak + sLineBreak;
end;

procedure TResultados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Resultados.destroy;
end;

function printNumber(number: int64): string;
begin
  Result := Format('%.0n', [number/1.0]);
end;

procedure TResultados.FormCreate(Sender: TObject);
var
n,Mtemp,Ctemp,Dtemp,nrtemp:int64;
pontosdefrota:int64;
  I: Integer;
begin
  FormatSettings.ThousandSeparator:= '.';
  LMetal:=0;
  LCristal:=0;
  LDeutas:=0;
  nrtemp:=0;
  for n:=1 to nr_atacantes do
   begin
     LMetal:=LMetal+Lucro[n].Metal;
     LCristal:=LCristal+Lucro[n].Cristal;
     LDeutas:=LDeutas+Lucro[n].Deutas;
   end;
  LMetal:=LMetal+strtoint64def(form1.edit1.text,0);
  LCristal:=LCristal+strtoint64def(form1.edit2.text,0);

  Label5.Caption:=printNumber(LMetal);
  Label6.Caption:=printNumber(LCristal);
  Label7.Caption:=printNumber(LDeutas);

  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     pontosdefrota:=0;
     for I := 1 to 5 do
      pontosdefrota:= pontosdefrota + pontosfrota[I];
     for I := 1 to 5 do
      begin
        if pontosfrota[I]<>0 then
          percentagem[I]:=round((pontosfrota[I]*10000)/pontosdefrota)
        else
          percentagem[I]:=0;
      end;
     for I := 1 to 5 do
      begin
        Lucroporcao[I].Metal:=round((LMetal*percentagem[I])/10000);
        Lucroporcao[I].Deutas:=round((LDeutas*percentagem[I])/10000);
        Lucroporcao[I].Cristal:=round((LCristal*percentagem[I])/10000);
      end;

   end
  else
   begin

  if LMetal=0 then
   LMetal:=0
  else
   LMetal:=round(LMetal/nr_atacantes);

  if LCristal=0 then
   LMetal:=0
  else
   LCristal:=round(LCristal/nr_atacantes);

  if LDeutas=0 then
   LDeutas:=0
  else
   LDeutas:=round(LDeutas/nr_atacantes);

   end;

  if nrtemp=nr_atacantes then
   exit;

  inc(nrtemp);
  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     LMetal:=Lucroporcao[nrtemp].Metal;
     LCristal:=Lucroporcao[nrtemp].Cristal;
     LDeutas:=Lucroporcao[nrtemp].Deutas;
   end;

  Mtemp:=LMetal-Lucro[1].Metal;
  Ctemp:=LCristal-Lucro[1].Cristal;
  Dtemp:=LDeutas-Lucro[1].Deutas;
  Label8.Caption:= Lucro[1].Nome;
  Memo1.Lines.Add('Enviar');
  if Mtemp<0 then
   Memo1.Lines.Add('Metal:'+printNumber(-Mtemp));//Format('%.0n', [I/1.0])
  if Ctemp<0 then
   Memo1.Lines.Add('Cristal:'+printNumber(-Ctemp));
  if Dtemp<0 then
   Memo1.Lines.Add('Deutas:'+printNumber(-Dtemp));
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Receber');
  if Mtemp>0 then
   Memo1.Lines.Add('Metal:'+printNumber(Mtemp));
  if Ctemp>0 then
   Memo1.Lines.Add('Cristal:'+printNumber(Ctemp));
  if Dtemp>0 then
   Memo1.Lines.Add('Deutas:'+printNumber(Dtemp));

  if nrtemp=nr_atacantes then
   exit;
  inc(nrtemp);
  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     LMetal:=Lucroporcao[nrtemp].Metal;
     LCristal:=Lucroporcao[nrtemp].Cristal;
     LDeutas:=Lucroporcao[nrtemp].Deutas;
   end;

  Mtemp:=LMetal-Lucro[2].Metal;
  Ctemp:=LCristal-Lucro[2].Cristal;
  Dtemp:=LDeutas-Lucro[2].Deutas;
  Label9.Caption:= Lucro[2].Nome;
  Memo2.Lines.Add('Enviar');
  if Mtemp<0 then
   Memo2.Lines.Add('Metal:'+printNumber(-Mtemp));
  if Ctemp<0 then
   Memo2.Lines.Add('Cristal:'+printNumber(-Ctemp));
  if Dtemp<0 then
   Memo2.Lines.Add('Deutas:'+printNumber(-Dtemp));
  Memo2.Lines.Add('');
  Memo2.Lines.Add('Receber');
  if Mtemp>0 then
   Memo2.Lines.Add('Metal:'+printNumber(Mtemp));
  if Ctemp>0 then
   Memo2.Lines.Add('Cristal:'+printNumber(Ctemp));
  if Dtemp>0 then
   Memo2.Lines.Add('Deutas:'+printNumber(Dtemp));

  if nrtemp=nr_atacantes then
   exit;

  inc(nrtemp);
  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     LMetal:=Lucroporcao[nrtemp].Metal;
     LCristal:=Lucroporcao[nrtemp].Cristal;
     LDeutas:=Lucroporcao[nrtemp].Deutas;
   end;

  Mtemp:=LMetal-Lucro[3].Metal;
  Ctemp:=LCristal-Lucro[3].Cristal;
  Dtemp:=LDeutas-Lucro[3].Deutas;
  Label10.Caption:= Lucro[3].Nome;
  Memo3.Lines.Add('Enviar');
  if Mtemp<0 then
   Memo3.Lines.Add('Metal:'+printNumber(-Mtemp));
  if Ctemp<0 then
   Memo3.Lines.Add('Cristal:'+printNumber(-Ctemp));
  if Dtemp<0 then
   Memo3.Lines.Add('Deutas:'+printNumber(-Dtemp));
  Memo3.Lines.Add('');
  Memo3.Lines.Add('Receber');
  if Mtemp>0 then
   Memo3.Lines.Add('Metal:'+printNumber(Mtemp));
  if Ctemp>0 then
   Memo3.Lines.Add('Cristal:'+printNumber(Ctemp));
  if Dtemp>0 then
   Memo3.Lines.Add('Deutas:'+printNumber(Dtemp));

  if nrtemp=nr_atacantes then
   exit;
  inc(nrtemp);
  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     LMetal:=Lucroporcao[nrtemp].Metal;
     LCristal:=Lucroporcao[nrtemp].Cristal;
     LDeutas:=Lucroporcao[nrtemp].Deutas;
   end;

  Mtemp:=LMetal-Lucro[4].Metal;
  Ctemp:=LCristal-Lucro[4].Cristal;
  Dtemp:=LDeutas-Lucro[4].Deutas;
  Label12.Caption:= Lucro[4].Nome;
  Memo4.Lines.Add('Enviar');
  if Mtemp<0 then
   Memo4.Lines.Add('Metal:'+printNumber(-Mtemp));
  if Ctemp<0 then
   Memo4.Lines.Add('Cristal:'+printNumber(-Ctemp));
  if Dtemp<0 then
   Memo4.Lines.Add('Deutas:'+printNumber(-Dtemp));
  Memo4.Lines.Add('');
  Memo4.Lines.Add('Receber');
  if Mtemp>0 then
   Memo4.Lines.Add('Metal:'+printNumber(Mtemp));
  if Ctemp>0 then
   Memo4.Lines.Add('Cristal:'+printNumber(Ctemp));
  if Dtemp>0 then
   Memo4.Lines.Add('Deutas:'+printNumber(Dtemp));

  if nrtemp=nr_atacantes then
   exit;

  inc(nrtemp);
  if ACSMain.Form1.RadioGroup1.ItemIndex=1 then
   begin
     LMetal:=Lucroporcao[nrtemp].Metal;
     LCristal:=Lucroporcao[nrtemp].Cristal;
     LDeutas:=Lucroporcao[nrtemp].Deutas;
   end;
  Mtemp:=LMetal-Lucro[5].Metal;
  Ctemp:=LCristal-Lucro[5].Cristal;
  Dtemp:=LDeutas-Lucro[5].Deutas;
  Label11.Caption:= Lucro[5].Nome;
  Memo5.Lines.Add('Enviar');
  if Mtemp<0 then
   Memo5.Lines.Add('Metal:'+printNumber(-Mtemp));
  if Ctemp<0 then
   Memo5.Lines.Add('Cristal:'+printNumber(-Ctemp));
  if Dtemp<0 then
   Memo5.Lines.Add('Deutas:'+printNumber(-Dtemp));
  Memo5.Lines.Add('');
  Memo5.Lines.Add('Receber');
  if Mtemp>0 then
   Memo5.Lines.Add('Metal:'+printNumber(Mtemp));
  if Ctemp>0 then
   Memo5.Lines.Add('Cristal:'+printNumber(Ctemp));
  if Dtemp>0 then
   Memo5.Lines.Add('Deutas:'+printNumber(Dtemp));
end;

procedure TResultados.SpeedButton1Click(Sender: TObject);
var
  i: shortint;
  copy: String;
begin
  copy := '';
  copy := copy + addNameAndData(label8, memo1);
  copy := copy + addNameAndData(label9, memo2);
  copy := copy + addNameAndData(label10, memo3);
  copy := copy + addNameAndData(label12, memo4);
  copy := copy + addNameAndData(label11, memo5);
  ClipBoard.AsText := copy;
  SpeedButton1.ShowHint := True;
  Timer1.Enabled:=true;
end;

procedure TResultados.Timer1Timer(Sender: TObject);
begin
  SpeedButton1.ShowHint:= false;
  Timer1.Enabled:=false;
end;

end.
