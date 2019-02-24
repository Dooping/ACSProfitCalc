unit ACSVaga;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ACSMain, ACSFrota, ComCtrls, ClipBrd;

type
  TRecursos = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    Memo2: TMemo;
    Label3: TLabel;
    Memo3: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Memo4: TMemo;
    Label7: TLabel;
    Button1: TButton;
    TrackBar1: TTrackBar;
    Memo5: TMemo;
    Memo6: TMemo;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Memo7: TMemo;
    BalloonHint1: TBalloonHint;
    procedure Memo1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo6KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ParseRecyclingText(text: string) ;
    procedure ParseStealText(text: string) ;
    procedure Memo6Change(Sender: TObject);
    procedure Memo6Enter(Sender: TObject);
    procedure Memo7Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Recursos: TRecursos;

implementation

{$R *.dfm}

procedure TRecursos.Button1Click(Sender: TObject);
var
Rmetal,Rcristal,Rdeutas,Cmetal,Ccristal:string;
begin
  case FleetIndex of
   1: begin
        with form1 do
         begin
           Cmetal:=memo6.Lines.Strings[0];
           Ccristal:=memo7.Lines.Strings[0];
           Rmetal:=memo16.Lines.Strings[0];
           Rcristal:=memo17.Lines.Strings[0];
           Rdeutas:=memo26.Lines.Strings[0];
           memo6.Clear;
           memo7.Clear;
           memo16.Clear;
           memo17.Clear;
           memo26.Clear;

           Cmetal:= inttostr(strtoint64def(Cmetal,0)
            +strtoint64def(Recursos.memo1.Lines.Strings[0],0));
           Ccristal:= inttostr(strtoint64def(Ccristal,0)
            +strtoint64def(Recursos.memo2.Lines.Strings[0],0));
           Rmetal:= inttostr(strtoint64def(Rmetal,0)
            +strtoint64def(Recursos.memo3.Lines.Strings[0],0));
           Rcristal:= inttostr(strtoint64def(Rcristal,0)
            +strtoint64def(Recursos.memo4.Lines.Strings[0],0));
           Rdeutas:= inttostr(strtoint64def(Rdeutas,0)
            +strtoint64def(Recursos.memo5.Lines.Strings[0],0));

           memo6.Lines.Add(Cmetal);
           memo7.Lines.Add(Ccristal);
           memo16.Lines.Add(Rmetal);
           memo17.Lines.Add(Rcristal);
           memo26.Lines.Add(Rdeutas);

           memo6.SelStart := memo6.Perform(EM_LINEINDEX, 0, 0);
           memo6.SelLength := 0;
           memo7.SelStart := memo7.Perform(EM_LINEINDEX, 0, 0);
           memo7.SelLength := 0;
           memo16.SelStart := memo16.Perform(EM_LINEINDEX, 0, 0);
           memo16.SelLength := 0;
           memo17.SelStart := memo17.Perform(EM_LINEINDEX, 0, 0);
           memo17.SelLength := 0;
           memo26.SelStart := memo26.Perform(EM_LINEINDEX, 0, 0);
           memo26.SelLength := 0;

         end;

   end;
   2: begin
        with form1 do
         begin
           Cmetal:=memo8.Lines.Strings[0];
           Ccristal:=memo9.Lines.Strings[0];
           Rmetal:=memo18.Lines.Strings[0];
           Rcristal:=memo19.Lines.Strings[0];
           Rdeutas:=memo27.Lines.Strings[0];
           memo8.Clear;
           memo9.Clear;
           memo18.Clear;
           memo19.Clear;
           memo27.Clear;

           Cmetal:= inttostr(strtoint64def(Cmetal,0)
            +strtoint64def(Recursos.memo1.Lines.Strings[0],0));
           Ccristal:= inttostr(strtoint64def(Ccristal,0)
            +strtoint64def(Recursos.memo2.Lines.Strings[0],0));
           Rmetal:= inttostr(strtoint64def(Rmetal,0)
            +strtoint64def(Recursos.memo3.Lines.Strings[0],0));
           Rcristal:= inttostr(strtoint64def(Rcristal,0)
            +strtoint64def(Recursos.memo4.Lines.Strings[0],0));
           Rdeutas:= inttostr(strtoint64def(Rdeutas,0)
            +strtoint64def(Recursos.memo5.Lines.Strings[0],0));

           memo8.Lines.Add(Cmetal);
           memo9.Lines.Add(Ccristal);
           memo18.Lines.Add(Rmetal);
           memo19.Lines.Add(Rcristal);
           memo27.Lines.Add(Rdeutas);

           memo8.SelStart := memo8.Perform(EM_LINEINDEX, 0, 0);
           memo8.SelLength := 0;
           memo9.SelStart := memo9.Perform(EM_LINEINDEX, 0, 0);
           memo9.SelLength := 0;
           memo18.SelStart := memo18.Perform(EM_LINEINDEX, 0, 0);
           memo18.SelLength := 0;
           memo19.SelStart := memo19.Perform(EM_LINEINDEX, 0, 0);
           memo19.SelLength := 0;
           memo27.SelStart := memo27.Perform(EM_LINEINDEX, 0, 0);
           memo27.SelLength := 0;

         end;
   end;
   3: begin
        with form1 do
         begin
           Cmetal:=memo10.Lines.Strings[0];
           Ccristal:=memo11.Lines.Strings[0];
           Rmetal:=memo20.Lines.Strings[0];
           Rcristal:=memo21.Lines.Strings[0];
           Rdeutas:=memo28.Lines.Strings[0];
           memo10.Clear;
           memo11.Clear;
           memo20.Clear;
           memo21.Clear;
           memo28.Clear;

           Cmetal:= inttostr(strtoint64def(Cmetal,0)
            +strtoint64def(Recursos.memo1.Lines.Strings[0],0));
           Ccristal:= inttostr(strtoint64def(Ccristal,0)
            +strtoint64def(Recursos.memo2.Lines.Strings[0],0));
           Rmetal:= inttostr(strtoint64def(Rmetal,0)
            +strtoint64def(Recursos.memo3.Lines.Strings[0],0));
           Rcristal:= inttostr(strtoint64def(Rcristal,0)
            +strtoint64def(Recursos.memo4.Lines.Strings[0],0));
           Rdeutas:= inttostr(strtoint64def(Rdeutas,0)
            +strtoint64def(Recursos.memo5.Lines.Strings[0],0));

           memo10.Lines.Add(Cmetal);
           memo11.Lines.Add(Ccristal);
           memo20.Lines.Add(Rmetal);
           memo21.Lines.Add(Rcristal);
           memo28.Lines.Add(Rdeutas);

           memo10.SelStart := memo10.Perform(EM_LINEINDEX, 0, 0);
           memo10.SelLength := 0;
           memo11.SelStart := memo11.Perform(EM_LINEINDEX, 0, 0);
           memo11.SelLength := 0;
           memo20.SelStart := memo20.Perform(EM_LINEINDEX, 0, 0);
           memo20.SelLength := 0;
           memo21.SelStart := memo21.Perform(EM_LINEINDEX, 0, 0);
           memo21.SelLength := 0;
           memo28.SelStart := memo28.Perform(EM_LINEINDEX, 0, 0);
           memo28.SelLength := 0;

         end;
   end;
   4: begin
        with form1 do
         begin
           Cmetal:=memo12.Lines.Strings[0];
           Ccristal:=memo13.Lines.Strings[0];
           Rmetal:=memo22.Lines.Strings[0];
           Rcristal:=memo23.Lines.Strings[0];
           Rdeutas:=memo29.Lines.Strings[0];
           memo12.Clear;
           memo13.Clear;
           memo22.Clear;
           memo23.Clear;
           memo29.Clear;

           Cmetal:= inttostr(strtoint64def(Cmetal,0)
            +strtoint64def(Recursos.memo1.Lines.Strings[0],0));
           Ccristal:= inttostr(strtoint64def(Ccristal,0)
            +strtoint64def(Recursos.memo2.Lines.Strings[0],0));
           Rmetal:= inttostr(strtoint64def(Rmetal,0)
            +strtoint64def(Recursos.memo3.Lines.Strings[0],0));
           Rcristal:= inttostr(strtoint64def(Rcristal,0)
            +strtoint64def(Recursos.memo4.Lines.Strings[0],0));
           Rdeutas:= inttostr(strtoint64def(Rdeutas,0)
            +strtoint64def(Recursos.memo5.Lines.Strings[0],0));

           memo12.Lines.Add(Cmetal);
           memo13.Lines.Add(Ccristal);
           memo22.Lines.Add(Rmetal);
           memo23.Lines.Add(Rcristal);
           memo29.Lines.Add(Rdeutas);

           memo12.SelStart := memo12.Perform(EM_LINEINDEX, 0, 0);
           memo12.SelLength := 0;
           memo13.SelStart := memo13.Perform(EM_LINEINDEX, 0, 0);
           memo13.SelLength := 0;
           memo22.SelStart := memo22.Perform(EM_LINEINDEX, 0, 0);
           memo22.SelLength := 0;
           memo23.SelStart := memo23.Perform(EM_LINEINDEX, 0, 0);
           memo23.SelLength := 0;
           memo29.SelStart := memo29.Perform(EM_LINEINDEX, 0, 0);
           memo29.SelLength := 0;

         end;
   end;
   5: begin
        with form1 do
         begin
           Cmetal:=memo14.Lines.Strings[0];
           Ccristal:=memo15.Lines.Strings[0];
           Rmetal:=memo24.Lines.Strings[0];
           Rcristal:=memo25.Lines.Strings[0];
           Rdeutas:=memo30.Lines.Strings[0];
           memo14.Clear;
           memo15.Clear;
           memo24.Clear;
           memo25.Clear;
           memo30.Clear;

           Cmetal:= inttostr(strtoint64def(Cmetal,0)
            +strtoint64def(Recursos.memo1.Lines.Strings[0],0));
           Ccristal:= inttostr(strtoint64def(Ccristal,0)
            +strtoint64def(Recursos.memo2.Lines.Strings[0],0));
           Rmetal:= inttostr(strtoint64def(Rmetal,0)
            +strtoint64def(Recursos.memo3.Lines.Strings[0],0));
           Rcristal:= inttostr(strtoint64def(Rcristal,0)
            +strtoint64def(Recursos.memo4.Lines.Strings[0],0));
           Rdeutas:= inttostr(strtoint64def(Rdeutas,0)
            +strtoint64def(Recursos.memo5.Lines.Strings[0],0));

           memo14.Lines.Add(Cmetal);
           memo15.Lines.Add(Ccristal);
           memo24.Lines.Add(Rmetal);
           memo25.Lines.Add(Rcristal);
           memo30.Lines.Add(Rdeutas);

           memo14.SelStart := memo14.Perform(EM_LINEINDEX, 0, 0);
           memo14.SelLength := 0;
           memo15.SelStart := memo15.Perform(EM_LINEINDEX, 0, 0);
           memo15.SelLength := 0;
           memo24.SelStart := memo24.Perform(EM_LINEINDEX, 0, 0);
           memo24.SelLength := 0;
           memo25.SelStart := memo25.Perform(EM_LINEINDEX, 0, 0);
           memo25.SelLength := 0;
           memo30.SelStart := memo30.Perform(EM_LINEINDEX, 0, 0);
           memo30.SelLength := 0;

         end;
   end;

  end;

  form1.RefreshTotals;
  memo1.Clear;
  memo2.Clear;
  memo3.Clear;
  memo4.Clear;
  memo5.Clear;
  memo6.Clear;
  memo7.Clear;
  Recursos.ActiveControl := nil;

  close;
end;

procedure TRecursos.Memo1Change(Sender: TObject);
var
tempstr:string;
begin
  tempstr:=TMemo(sender).Lines[0];
  while Pos('.',tempstr ) > 0 do
   system.Delete(tempstr, Pos('.',tempstr ) ,1);

  TMemo(sender).Lines[0] := tempstr;
end;

procedure TRecursos.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['0'..'9', #8]) then exit;
  if (GetKeyState(VK_LCONTROL)<0) then exit;

  Key := #0;
end;

procedure TRecursos.Memo6Change(Sender: TObject);
var
  i:integer;
  zoznam: TStringList;
begin
  memo1.Lines[0] := '0';
  memo2.Lines[0] := '0';
  zoznam := TStringList.Create;
  try
    zoznam.Text:=memo6.Text;
    for i := 0 to zoznam.Count-1 do
      begin
         ParseRecyclingText(zoznam.Strings[i]);
      end;
  finally
    zoznam.Free;
  end;
end;

procedure TRecursos.Memo6Enter(Sender: TObject);
var
  memo: TMemo;
begin
  memo:= Sender as TMemo;
  memo.Clear;
end;

procedure TRecursos.Memo6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key = ord('V')) and (Shift = [ssCtrl]) then
        begin
          ParseRecyclingText(Clipboard.AsText);
        end;
end;

procedure TRecursos.Memo7Change(Sender: TObject);
var
  i:integer;
  zoznam: TStringList;
begin
  memo3.Lines[0] := '0';
  memo4.Lines[0] := '0';
  memo5.Lines[0] := '0';
  zoznam := TStringList.Create;
  try
    zoznam.Text:=memo7.Text;
    for i := 0 to zoznam.Count-1 do
      begin
         ParseStealText(zoznam.Strings[i]);
      end;
  finally
    zoznam.Free;
  end;
end;

procedure TRecursos.TrackBar1Change(Sender: TObject);
begin
 TRecursos(self).AlphaBlendValue:= 255-TrackBar1.Position;
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

procedure TRecursos.ParseRecyclingText(text: string) ;
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

procedure TRecursos.ParseStealText(text: string) ;
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
          memo3.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[++i]),0) + strtoint64def(memo3.Lines[0],0));
        if ((CompareStr('Cristal:', OutPutList.Strings[i]) = 0) or (CompareStr('Crystal:', OutPutList.Strings[i]) = 0)) then
          memo4.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[++i]),0) + strtoint64def(memo4.Lines[0],0));
        if ((CompareStr('Deutério:', OutPutList.Strings[i]) = 0) or (CompareStr('Deuterium:', OutPutList.Strings[i]) = 0)) then
          memo5.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[++i]),0) + strtoint64def(memo5.Lines[0],0));

        if (CompareStr('de', OutPutList.Strings[i]) = 0) or (CompareStr('of', OutPutList.Strings[i]) = 0) then
        begin
          if (CompareStr('Metal,', OutPutList.Strings[i+1]) = 0) or (CompareStr('Metal', OutPutList.Strings[i+1]) = 0) then
            memo3.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i-1]),0) + strtoint64def(memo3.Lines[0],0));
          if ((CompareStr('Cristal', OutPutList.Strings[i+1]) = 0) or (CompareStr('Crystal', OutPutList.Strings[i+1]) = 0)) then
            memo4.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i-1]),0) + strtoint64def(memo4.Lines[0],0));
          if ((CompareStr('Deutério', OutPutList.Strings[i+1]) = 0) or (CompareStr('Deuterium', OutPutList.Strings[i+1]) = 0)) then
            memo5.Lines[0] := inttostr(strtoint64def(CleanString(OutPutList.Strings[i-1]),0) + strtoint64def(memo5.Lines[0],0));

        end;

     end;

   finally
     OutPutList.Free;
   end;
end;

end.
