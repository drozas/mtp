program futbol;
type
ttabla=array[0..9] of real;
tposicion=(Del,Def,Por);
tnacionalidad=(Ext,Com);
tvelocidad=(Rapido,Lento,Normal);
tjugador=Record
     Nombre:string[18];
     Posicion:tposicion;
     Natural:tposicion;
     Edad:integer;
     Nacionalidad:tnacionalidad;
     Velocidad:tvelocidad;
     Lesion:boolean;
     Tecnica:0..3;
     Precio:Integer;
     end;
const
n=10;
CONSTS_SUERTE: ttabla = ( -0.4772, -0.445511, -0.3849, -0.2881, -0.1554, 0.1554, 0.2881, 0.3849, 0.4452, 0.4772);
var
j1,j2,j3,j4,j5,j6,j7,j8,j9,j10:tjugador;
p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,i:integer;
total1,total2:real;
procedure Jugador(var x:tjugador);
var
i,op,n,v,e:integer;
begin
with x do begin
write('Introduce nombre:');
readln(Nombre);
write('Introduce posicion(del 1 al 3):');
read(i);
if i=0 then begin
   Posicion:=Del;
end;
if i=1 then begin
   Posicion:=Def;
end;
if i=2 then begin
   Posicion:=Por;
end;
Write('Introduce tecnica(de 0 a 3):');
read(Tecnica);
write('Introduce edad:');
read(Edad);
if (Edad>20) and (Edad<25) then e:=0
else
e:=1;
write('Introduce posicion natural(del 1 al 3):');
read(op);
if op=1 then Natural:=Del;
if op=2 then Natural:=Def;
if op=3 then Natural:=Por;
write('Introduce nacionalidad(0 si es extranjero):');
read(n);
if n=0 then Nacionalidad:=Ext
  else
    Nacionalidad:=Com;
write('Introduce velocidad(de -1 a 1):');
read(v);
if v=-1 then Velocidad:=Lento;
if v=0 then Velocidad:=Normal;
if v=1 then Velocidad:=Rapido;
Precio:=90+(v*50)+(e*10)+(Tecnica*300);
end
end;
Procedure Puntuacion(x:tjugador;Var p:integer);
var
a,l,r,e,v:integer;
begin
v:=0;
e:=0;
a:=0;
l:=0;
r:=random(100);
 with x do begin
 if r<5 then begin
 writeln(Nombre,'Esta lesionado');
 Lesion:=True;
 end
 else
 Lesion:=False;
 If Lesion=true then l:=-1
 else
 l:=0;
 if Posicion=Natural then a:=0;
 if (Posicion=Por) and (Posicion=Def) then a:=a-1;
 if (Posicion=Por) and (Posicion=Del) then a:=a-3;
 if (Posicion=Def) and (Posicion=Por) then a:=a-1;
 if (Posicion=Def) and (Posicion=Del) then a:=a-1;
 if (Posicion=Del) and (Posicion=Def) then a:=a-1;
 if (Posicion=Del) and (Posicion=Por) then a:=a-2;
 if (Edad>20) and (Edad<25) then e:=0
 else e:=-1;
 if Velocidad=Rapido then v:=1;
 if Velocidad=Normal then v:=0;
 if Velocidad=Lento then v:=-1;
 p:=a+e+Tecnica+v+l;
 end
end;
Function Suerte:real;
begin
   Suerte:=CONSTS_SUERTE[Random(N)];
end;
Function Total(p1,p2,p3,p4,p5:integer;j1,j2,j3,j4,j5:tjugador):Real;
var
x,e:integer;
fc:real;
begin
e:=0;
x:=j1.Precio+j2.Precio+j3.Precio+j4.Precio+j5.Precio;
fc:=x/600;
if j1.Nacionalidad=Ext then e:=e+1;
if j2.Nacionalidad=Ext then e:=e+1;
if j3.Nacionalidad=Ext then e:=e+1;
if j4.Nacionalidad=Ext then e:=e+1;
if j5.Nacionalidad=Ext then e:=e+1;
if e>1 then begin
  writeln('Limite de Extranjeros superado.');
  Total:=(((p1+p2+p3+p4+p5-fc)/2)*Suerte) + 100;
end
else
   Total:=((p1+p2+p3+p4+p5-fc)*Suerte) + 100;
end;
procedure Partido(total1,total2:real);
begin
write('total1 es:',total1);
write('total2 es:',total2);
if total1 > total2 then writeln('GANA EKIPO1')
else writeln('GANA EKIPO2');
end;
begin
Jugador(j1);
Jugador(j2);
Jugador(j3);
Jugador(j4);
Jugador(j5);
Jugador(j6);
Jugador(j7);
Jugador(j8);
Jugador(j9);
Jugador(j10);
Puntuacion(j1,p1);
Puntuacion(j2,p2);
Puntuacion(j3,p3);
Puntuacion(j4,p4);
Puntuacion(j5,p5);
Puntuacion(j6,p6);
Puntuacion(j7,p7);
Puntuacion(j8,p8);
Puntuacion(j9,p9);
Puntuacion(j10,p10);
Partido(Total(p1,p2,p3,p4,p5,j1,j2,j3,j4,j5),Total(p6,p7,p8,p9,p10,j6,j7,j8,j9,j10));
readln;
end.
end.