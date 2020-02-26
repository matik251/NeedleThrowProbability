unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, ComCtrls;

type

  { Ttlo }

  Ttlo = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    Stop: TButton;
    Lewy2: TShape;
    prawy2: TShape;
    StaticText3: TStaticText;
    stopni90: TBitBtn;
    prawy: TShape;
    Lewy: TShape;
    Start: TBitBtn;
    l1: TShape;
    l2: TShape;
    l3: TShape;
    l4: TShape;
    l5: TShape;
    srodek: TShape;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Timer1: TTimer;
    tlo: TShape;
    TrackBar1: TTrackBar;
    procedure Label5Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure StaticText4Click(Sender: TObject);
    procedure StaticText6Click(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure Lewy2ChangeBounds(Sender: TObject);
    procedure stopni90Click(Sender: TObject);
    procedure l1ChangeBounds(Sender: TObject);
    procedure srodekChangeBounds(Sender: TObject);
    procedure StartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tloChangeBounds(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  tlo: Ttlo;
var ilosc,nietrafione:Integer;

implementation

{$R *.lfm}

{ Ttlo }

procedure Ttlo.tloChangeBounds(Sender: TObject);
begin

end;

procedure Ttlo.TrackBar1Change(Sender: TObject);
          var s,napis:String;
begin
  Timer1.Interval:=TrackBar1.Position;
  Str((TrackBar1.Position/100),s);
  napis:='Częstotliowosć rzutów: '+s;
  StaticText6.Caption:=napis;
end;

procedure Ttlo.srodekChangeBounds(Sender: TObject);
begin

end;

procedure Ttlo.StartClick(Sender: TObject);

        var stopnie,radiany,yp,xp,yl,xl,yp2,xp2,yl2,xl2:REAL;
        var ypi,xpi,yli,xli,ypi2,xpi2,yli2,xli2:Integer;
        var y0:Integer;
        var s1,s2,napis:String;
begin
          Timer1.Enabled:=TRUE;
          randomize;
          stopnie:=0+random(360);
          y0:=103+(50-random(100));
          radiany:=(stopnie*Pi/180);
          if stopnie-90<0  then stopnie:=180+stopnie;
          Str(stopnie-90, s1);
          Str((radiany-Pi/2), s2);
          napis:='kat nachylenia igly do linii: '+s1+' stopni';
          StaticText1.Caption:=napis;

          //srodek
          srodek.Top:=y0;

          //prawy

          yp:=cos(radiany)*50;
          ypi:=round(yp);
          ypi:=ypi+y0;

          xp:=sin(radiany)*50;
          xpi:=round(xp);
          xpi:=xpi+100;

          Prawy.Top:=ypi;
          Prawy.Left:=xpi;
          Str(ypi, s1);
          Str(xpi, s2);
          napis:=s1+'y, '+s2+' x';
          StaticText2.Caption:=napis+' - wspolrzedne prawego konca igly';

          //Lewy

          yl:=sin(radiany)*(-50);
          yli:=round(yl);
          yli:=yli+100;

          xl:=cos(radiany)*(-50);
          xli:=round(xl);
          xli:=xli+y0;


          Str(xli, s1);
          Str(yli, s2);
          napis:=s1+'y, '+s2+' x';
          Lewy.Top:=xli;
          Lewy.Left:=yli;
          StaticText3.Caption:=napis+' - wspolrzedne lewego konca igly';

          //prawy2

          yp2:=cos(radiany)*25;
          ypi2:=round(yp2);
          ypi2:=ypi2+y0;

          xp2:=sin(radiany)*25;
          xpi2:=round(xp2);
          xpi2:=xpi2+100;

          Prawy2.Top:=ypi2;
          Prawy2.Left:=xpi2;

          //Lewy2

          yl2:=sin(radiany)*(-25);
          yli2:=round(yl2);
          yli2:=yli2+100;

          xl2:=cos(radiany)*(-25);
          xli2:=round(xl2);
          xli2:=xli2+y0;

          Lewy2.Top:=xli2;
          Lewy2.Left:=yli2;

          //sprawdzenie
          if ypi<xli then
          BEGIN
            if ypi>=50 then
             BEGIN
               if xli<=104 then nietrafione:=nietrafione+1;
             END  ;
          if ypi>=102 then
             BEGIN
               if xli<=154 then nietrafione:=nietrafione+1;
             end;
          end;

          if xli<ypi then
          BEGIN
            if xli>=50 then
             BEGIN
               if ypi<=104 then nietrafione:=nietrafione+1;
             END  ;
          if xli>=102 then
             BEGIN
               if ypi<=154 then nietrafione:=nietrafione+1;
             end;
          end;


end;

procedure Ttlo.Timer1Timer(Sender: TObject);
  var s:String;
    var x:Real;
begin
  Start.Click;
  ilosc:=ilosc+1;
  Str(ilosc,s);
  Label1.Caption:='Ilosc rzutów: '+s;
  Str(nietrafione,s);
  Label2.Caption:='Ilosc "nietrafionych" rzutów: '+s;
  Str(ilosc-nietrafione,s);
  Label3.Caption:='Ilosc trafionych przynajmniej w jedną kreskę poziomą (wszystkie-nietrafione): '+s;
  x:=(ilosc-nietrafione)/ilosc;
  Str(x,s);
  Label4.Caption:='Prawdopodobienstwo trafienia : '+s;
end;

procedure Ttlo.l1ChangeBounds(Sender: TObject);
begin

end;

procedure Ttlo.stopni90Click(Sender: TObject);
        var stopnie,radiany,yp,xp,yl,xl,yp2,xp2,yl2,xl2:REAL;
               var ypi,xpi,yli,xli,ypi2,xpi2,yli2,xli2:Integer;
               var s1,s2,napis:String;
begin
     srodek.Top:=103;
     srodek.Left:=100;

      //prawy

          yp:=cos(Pi)*50;
          ypi:=round(yp);
          ypi:=ypi+103;

          xp:=sin(Pi)*50;
          xpi:=round(xp);
          xpi:=xpi+100;

          Prawy.Top:=ypi;
          Prawy.Left:=xpi;
          Str(ypi, s1);
          Str(xpi, s2);
          napis:=s1+'y, '+s2+' x';
          StaticText2.Caption:=napis;

          //Lewy

          yl:=sin(Pi)*(-50);
          yli:=round(yl);
          yli:=yli+100;

          xl:=cos(Pi)*(-50);
          xli:=round(xl);
          xli:=xli+103;

          //prawy2

          yp2:=cos(Pi)*25;
          ypi2:=round(yp2);
          ypi2:=ypi2+100;

          xp2:=sin(Pi)*25;
          xpi2:=round(xp2);
          xpi2:=xpi2+100;

          Prawy2.Top:=ypi2;
          Prawy2.Left:=xpi2;

          //Lewy2

          yl2:=sin(Pi)*(-25);
          yli2:=round(yl2);
          yli2:=yli2+100;

          xl2:=cos(Pi)*(-25);
          xli2:=round(xl2);
          xli2:=xli2+100;

          Lewy2.Top:=xli2;
          Lewy2.Left:=yli2;


          Str(xli, s1);
          Str(yli, s2);
          napis:=s1+'y, '+s2+' x';
          Lewy.Top:=xli;
          Lewy.Left:=yli;
          StaticText3.Caption:=napis;
end;

procedure Ttlo.Lewy2ChangeBounds(Sender: TObject);
begin

end;

procedure Ttlo.StopClick(Sender: TObject);
begin
  Timer1.Enabled:=FALSE;
end;

procedure Ttlo.StaticText4Click(Sender: TObject);
begin

end;

procedure Ttlo.Label5Click(Sender: TObject);
begin

end;

procedure Ttlo.Label6Click(Sender: TObject);
begin

end;

procedure Ttlo.StaticText6Click(Sender: TObject);
begin

end;

end.

