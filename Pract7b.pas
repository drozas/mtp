PROGRAM TresEnRaya {input, output};

{Entrada: coordenadas de la ficha}
{Salida: el tablero despues de cada jugada}

TYPE
    tTablero= ARRAY [1..3, 1..3] OF char;

VAR
   fin: boolean;
   tablero: tTablero;
   ficha1,ficha2,jugar:char;
   nomb1, nomb2 :string;

(*-----------------------------------------------*)
PROCEDURE iniciar_matriz (VAR tablero: tTablero);

VAR
i, j:integer;
BEGIN
     FOR i:=1 TO 3 DO
         FOR j:=1 TO 3 DO
             tablero[i,j]:= ' ';
END; {iniciar_matriz}
(*-----------------------------------------------*)

PROCEDURE mostrar_matriz (VAR tablero: tTablero);

VAR
i, j:integer;

BEGIN

     writeln;
     writeln;
     writeln('__________');
     FOR i:=1 TO 3 DO
     BEGIN

             FOR j:=1 TO 3 DO
             BEGIN
             write('| ' ,tablero[i,j]);
             END; {FOR INTERNO}
             write('|');
             writeln;
             write('----------');
             writeln;

     END;{FOR EXTERNO}
    END;{mostrar_matriz}
(*-----------------------------------------------*)
PROCEDURE jugada (VAR tablero:tTablero; ficha:char; nombre_jugador:string);

VAR
fila, columna: integer;

BEGIN

     REPEAT

     writeln('Introduce la fila ', nombre_jugador);
     readln(fila);
     writeln('Introduce la columna ', nombre_jugador);
     readln(columna);
          IF(tablero[fila, columna]<>' ') THEN
          writeln('La casilla esta ocupada, o la posicion es incorrecta');

     UNTIL (tablero[fila, columna]= ' ');

     tablero[fila,columna]:=ficha;
END; {jugada}
(*-----------------------------------------------*)

PROCEDURE comprueba_tablas (VAR tablero:tTablero; VAR fin: boolean);

VAR
i,j :integer;
tablas: boolean;

BEGIN
        i:=0;
        tablas:=true;

        {Si alguna posicion esta vac¡a o hemos recorrido todo el array,
        es que no hay tablas y continua la partida. Tablas es true
        "hasta ke se demuestre lo kontrario",...hasta ke enkontremos
        una celda vacia}


        REPEAT
              j:=0;
              i:=i+1;

              REPEAT
              j:=j+1;

                     IF (tablero[i,j]=' ') THEN
                     tablas:=false;

              UNTIL(tablero[i,j]=' ') OR (j>3);

        UNTIL (tablero[i,j]=' ') OR (i>3);



        IF (tablas=true) THEN
           BEGIN
           writeln('Esta partida acaba en tablas');
           fin:=true;
           readln;
           END;

END; {comprueba_tablas}

(*-----------------------------------------------*)

PROCEDURE gana (VAR tablero: tTablero; ficha:char; VAR fin: boolean; nombre:string);

VAR
i, j: integer;
partida_ganada: boolean;

BEGIN

     partida_ganada:=false;
     i:=1;
     j:=1;

     {Comprobaci¢n de filas...la £ltima condicion del if se debe
     a q tienes q comprobar el tipo de ficha, ya que sino con la
     vacia te daria la partida ganada}

     WHILE ((i<=3) AND (partida_ganada=false)) DO
     BEGIN
          IF (tablero[i,1]=tablero[i,2]) AND (tablero[i,2]=tablero[i,3])
             AND (tablero[i,3]=ficha) THEN
                 BEGIN
                 partida_ganada:=true;
                 fin:=true;
                 writeln('Has ganado ', nombre);
                 readln;
                 END
          ELSE
              i:=i+1;
     END;{WHILE}

     {Comprobaci¢n de todas las columnas...}

     WHILE ((j<=3) AND (partida_ganada=false)) DO
     BEGIN
          IF(tablero[1,j]=tablero[2,j]) AND (tablero[2,j]=tablero[3,j])
             AND (tablero[3,j]=ficha) THEN
                 BEGIN
                 partida_ganada:=true;
                 fin:=true;
                 writeln('Has ganado ', nombre);
                 readln;
                 END

          ELSE
              j:=j+1;
     END;{WHILE}

     {Comprobaci¢n de la diagonal principal}

     IF (tablero[1,1]=tablero[2,2]) AND (tablero[2,2]=tablero[3,3]) AND
        (tablero[3,3]=ficha) THEN
                 BEGIN
                 partida_ganada:=true;
                 fin:=true;
                 writeln('Has ganado ', nombre);
                 readln;
                 END;

     {Comprobaci¢n de la diagonal secundaria}
     IF (tablero[1,3]=tablero[2,2]) AND (tablero[2,2]=tablero[3,1]) AND
        (tablero[3,1]=ficha) THEN
                 BEGIN
                 partida_ganada:=true;
                 fin:=true;
                 writeln('Has ganado ', nombre);
                 readln;
                 END;
      {Si la partida resulta ganada, entonces acaba el juego}



END;{gana}


(*-----------------------------------------------*)
(*-----------------------------------------------*)

BEGIN {PROGRAMA PRINCIPAL}

      writeln('************************************':20);
      writeln('TRES EN RAYA':27);
      writeln('************************************':20);

   REPEAT

      (*Inicializaci¢n de las variables*)
      ficha1:='O';
      ficha2:='X';
      fin:=false;
      iniciar_matriz(tablero);
      mostrar_matriz(tablero);

      (*Pedimos los nombres de los usuarios*)
      writeln('Introduce tu nombre, jugador 1 ');
      readln(nomb1);
      writeln('Introduce tu nombre, jugador 2');
      readln(nomb2);
      REPEAT
       IF fin=false THEN
         BEGIN
              (*jugada del primer jugador*)
              jugada(tablero, ficha1, nomb1);
              mostrar_matriz(tablero);
              comprueba_tablas(tablero, fin);
              gana(tablero, ficha1, fin, nomb1);

         END;

       IF fin=false THEN
          BEGIN
               (*jugada del segundo jugador*)
               jugada(tablero, ficha2, nomb2);
               mostrar_matriz(tablero);
               comprueba_tablas(tablero, fin);
               gana(tablero, ficha2, fin, nomb2);

          END;

      UNTIL (fin=true);

   writeln('¨Quieres echar otra partida? S/N');
   readln(jugar);

   UNTIL (jugar='n') OR (jugar='N');
END.{PROGRAMA PRINCIPAL}