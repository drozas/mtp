PROGRAM practica7A {input, output};

CONST
N = 100;{El rango de numeros aleatorios generados}
TOPE = 1000; {Cantidad total de numeros}

TYPE
    tarray = ARRAY [1..10] OF integer;

VAR
num_aleat, i:integer;
suma, mediatot: real;


FUNCTION media (sumatotal:real; cant:integer):real;
BEGIN
     media:= sumatotal / cant;
END;{FUNCTION}

PROCEDURE intervalos (num: integer);
VAR
cont_rango : tarray;
i: integer;

BEGIN

           CASE num OF

           0..N DIV 10: cont_rango[1] := cont_rango[1] +1;
           N DIV 10..(2*N) DIV 10: cont_rango[2] := cont_rango[2] +1;
           (2*N) DIV 10..(3*N) DIV 10: cont_rango[3] := cont_rango[3] +1;
           (3*N) DIV 10..(4*N) DIV 10: cont_rango[4] := cont_rango[4] +1;
           (4*N) DIV 10..(5*N) DIV 10: cont_rango[5] := cont_rango[5] +1;
           (5*N) DIV 10..(6*N) DIV 10: cont_rango[6] := cont_rango[6] +1;
           (6*N) DIV 10..(7*N) DIV 10: cont_rango[7] := cont_rango[7] +1;
           (7*N) DIV 10..(8*N) DIV 10: cont_rango[8] := cont_rango[8] +1;
           (8*N) DIV 10..(9*N) DIV 10: cont_rango[9] := cont_rango[9] +1;
           (9*N) DIV 10..N: cont_rango[10] := cont_rango[10] +1;
           END; {CASE}

           FOR i:=1 TO 10 DO
          { BEGIN
           writeln('Hay', cont_rango[i], 'numeros del', i, 'al', i*10);
           END; FOR}
END; {PROCEDURE}

BEGIN

     {Generaci¢n de los numeros aleatorios}
     randomize;

     FOR i := 1 to TOPE DO
     BEGIN
     num_aleat:= random(N+1);
     intervalos(num_aleat);
     suma:= suma + num_aleat;
     END;

     mediatot:= media(suma, TOPE);
     writeln('La media de todos los numeros es', mediatot:2:2);
     readln;
END.{P.P.}

