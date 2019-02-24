unit ACSCiclagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ACSMain, ClipBrd;

type
  TRecursos2 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Memo3: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    BalloonHint1: TBalloonHint;
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure ParseText(text: string) ;
    procedure Memo3Change(Sender: TObject);
    procedure Memo3Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Recursos2: TRecursos2;

implementation

{$R *.dfm}

procedure TRecursos2.Button1Click(Sender: TObject);
var
Cmetal,Ccristal:string;
begin
  Cmetal:=form1.edit1.text;
  Ccristal:=form1.edit2.text;

  Cmetal:= inttostr(strtoint64def(Cmetal,0)
   +strtoint64def(memo1.Lines.Strings[0],0));
  Ccristal:= inttostr(strtoint64def(Ccristal,0)
   +strtoint64def(memo2.Lines.Strings[0],0));

  form1.edit1.text:=Cmetal;
  form1.edit2.text:=Ccristal;


  form1.RefreshTotals;
  memo1.Clear;
  memo2.Clear;

  close;
end;

procedure TRecursos2.Memo1Change(Sender: TObject);
var
tempstr:string;
begin
  tempstr:=TMemo(sender).Lines[0];
  while Pos('.',tempstr ) > 0 do
   system.Delete(tempstr, Pos('.',tempstr ) ,1);

  TMemo(sender).Lines[0] := tempstr;
end;

procedure TRecursos2.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9', #8]) then exit;
  if (GetKeyState(VK_LCONTROL)<0) then exit;

  Key := #0;
end;

procedure TRecursos2.Memo3Change(Sender: TObject);
var
  i:integer;
  zoznam: TStringList;
begin
  memo1.Lines[0] := '0';
  memo2.Lines[0] := '0';
  zoznam := TStringList.Create;
  try
    zoznam.Text:=memo3.Text;
    for i := 0 to zoznam.Count-1 do
      begin
         ParseText(zoznam.Strings[i]);
      end;
  finally
    zoznam.Free;
  end;
end;

procedure TRecursos2.Memo3Enter(Sender: TObject);
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

procedure TRecursos2.ParseText(text: string) ;
var
   OutPutList: TStringList;
   i: integer;
begin
   OutPutList := TStringList.Create;
   try
     Split(' ', text, OutPutList) ;

     for I := 0 to OutPutList.Count-1 do
     begin
        if (CompareStr('Metal:', OutPutList.Strings[i]) = 0) then
          memo1.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[++i]),0) + strtoint64def(memo1.Lines[0],0));
        if ((CompareStr('Cristal:', OutPutList.Strings[i]) = 0) or (CompareStr('Crystal:', OutPutList.Strings[i]) = 0)) then
          memo2.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[++i]),0) + strtoint64def(memo2.Lines[0],0));

        if (CompareStr('de', OutPutList.Strings[i]) = 0) or (CompareStr('of', OutPutList.Strings[i]) = 0) then
        begin
          if (CompareStr('metal', OutPutList.Strings[i+1]) = 0) then
            memo1.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i-1]),0) + strtoint64def(memo1.Lines[0],0));
          if ((CompareStr('cristal', OutPutList.Strings[i+1]) = 0) or (CompareStr('crystal', OutPutList.Strings[i+1]) = 0) or
                (CompareStr('cristal.', OutPutList.Strings[i+1]) = 0) or (CompareStr('crystal.', OutPutList.Strings[i+1]) = 0)) then
            memo2.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i-1]),0) + strtoint64def(memo2.Lines[0],0));

        end;
        if (CompareStr('Recolheste', OutPutList.Strings[i]) = 0) then
        begin
          memo1.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i+1]),0) + strtoint64def(memo1.Lines[0],0));
          memo2.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i+4]),0) + strtoint64def(memo2.Lines[0],0));
        end;

     end;

   finally
     OutPutList.Free;
   end;
end;

end.
