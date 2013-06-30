PROGRAM pract8 {input,output};

CONST
NJUGADORES=5;
NEQUIPOS=2;
TYPE
{Primero definimos los tipos que nos encontraremos dentro de cada ficha}
{tposicion=(delantero, defensa, portero);
tnacionalidad=(extranjero, comunitario);
tvelocidad=(rapido, normal, lento);
ttecnica=0..3;
tedad=(e20, e20_35, e35);    }
{tipo ficha con las cualidades de cada jugador}
tficha= RECORD
        nombre:string[20];
        posicion_natural: string;
        posicion: string;
        edad: integer;
        nacionalidad:string;
        velocidad: string;
        lesionado:boolean;
        tecnica:integer;
        precio:real;
        puntuacion:real;
        END; {TFICHA}

{Ahora definimos el tipo equipo. Tenemos array de registros jugadores, dentro
de otro registro: tequipo}
tequipo= RECORD
         nombre:string[20];
         jugadores: ARRAY [1..NJUGADORES] of tficha;
         precio:real;
         penalizaciones:real;
         resultado_final:real;
         END;{TEQUIPO}


VAR
{equipo"n" sera el registro de un equipo con su nombre; que a su vez
contiene un array de 5 jugadores con sus registros}

equipo:ARRAY[1..NEQUIPOS] of tequipo;
puntuacion_equipo:ARRAY[1..NEQUIPOS] of real;
opcion:integer;
ind_equipo:integer;
ind_jugador:integer;

(*----------------------------------------------*)
FUNCTION precio_jugador (VAR jugador:tficha):real;
VAR
precio:real;
V,E,T:integer;

BEGIN
{Inicializaci¢n de variables}
                V:=0;
                E:=0;
                T:=0;
                precio:=0.0;


{Primero transformaremos los parametros enumerados a sus equivalentes
en numerico}

            WITH jugador DO
            BEGIN

            {Transformacion de parametro velocidad}
            CASE velocidad OF
            'lento': V:=-1;
            'normal': V:=0;
            'rapido': V:=1;
            END;{CASE}

            {Transformacion de parametro edad}
            IF edad=>35 THEN
               E:=-1
            ELSE
               E:=0;

            {Transformacion del par metro t‚cnica;
            es un subrango, y no hay que hacer ninguna transformacion}
               T:=tecnica;

            END;{WITH}

            precio:=90 + (V*50) + (E*10) + (T*300);
            precio_jugador:=precio;

END;{precio_jugador}

(*--------------------------------------------------------------------*)

FUNCTION puntuacion_jugador (VAR jugador:tficha):real;

VAR
A,E,V,L,T :integer;
puntuacion: real;

BEGIN
        {Inicializacion de variables}
        A:=0;
        E:=0;
        V:=0;
        L:=0;
        T:=0;
        puntuacion:=0.0;


            WITH jugador DO
            BEGIN

            {Transformacion de parametro velocidad}
            CASE velocidad OF
            'lento': V:=-1;
            'normal': V:=0;
            'rapido': V:=1;
            END;{CASE}

            {Transformacion de parametro edad}
            IF edad=>35 THEN
               E:=-1
            ELSE
               E:=0;

            {Transformacion del par metro t‚cnica;
            es un subrango, y no hay que hacer ninguna transformacion}
               T:=tecnica;

            {Tranformaci¢n del parametro lesionado}
            IF lesionado=true THEN
            L:=-1
            ELSE
            L:=1;

            {Tranformaci¢n del parametro ajuste, a partir de posicion
            y posicion natural}

            CASE posicion OF
            'portero': BEGIN
                          CASE posicion_natural OF
                          'portero': A:=0;
                          'defensa': A:=-1;
                          'delantero': A:=-3;
                     END;

            'defensa': BEGIN
                          CASE posicion_natural OF
                          'portero': A:=-1;
                          'defensa': A:=0;
                          'delantero': A:=-1;
                     END;

            'delantero': BEGIN
                            CASE posicion_natural OF
                            'portero': A:=-2;
                            'defensa': A:=-1;
                            'delantero': A:=0;
                       END;
            END;{CASE PRINCIPAL}

            END;{WITH}

            puntuacion:= A + E + V + L + T;
            puntuacion_jugador:=puntuacion;

END;{puntuacion_jugador}


(*------------------------------------------------------------------*)

PROCEDURE nueva_ficha (VAR jugador:tficha);
VAR
V, E, T: real;


BEGIN
     {Inicializacion de variables}
     V:=0;
     E:=0;
     T:=0;


     writeln('***********************************');
     writeln('           NUEVA FICHA');
     writeln('***********************************');
     writeln;

     WITH jugador DO
     BEGIN

     writeln('Nombre del jugador?: ');
     readln(nombre);
     writeln('Posicion natural de juego?: ');
     readln(posicion_natural);
     writeln('Posicion en la que va a jugar?: ');
     readln(posicion);
     writeln('Intervalo de edad?-> 20, 20_35, 35 : ');
     readln(edad);
     writeln('Nacionalidad del jugador? -> extranjero o comunitario: ');
     readln(nacionalidad);
     writeln('Velocidad el jugador? -> rapido, normal o lento : ');
     readln(velocidad);

     (*Calculo de probabiliades de si el jugador est  o no lesionado
     La probabilidad es del 5%, y tb se muestra en el registro*)
     IF (random(100)<5) THEN
        BEGIN
        lesionado:=true;
        writeln('Lesionado : Este jugador se perdera el partido');
        END
     ELSE
         BEGIN
         lesionado:=false;
         writeln('Lesionado: No');
         END;


     writeln('Tecnica del jugador? ->0...3');
     readln(tecnica);

     precio:= precio_jugador(jugador);
     writeln('Precio del jugador', precio:2:2);

     puntuacion:=puntuacion_jugador(jugador);
     writeln('PUNTUACION TOTAL', puntuacion:2:2);

     END;{WITH}

     writeln('Enter para continuar...');
     readln;
END;{nueva_ficha}
(*-------------------------------------------------------------------*)

PROCEDURE ver_ficha(VAR jugador:tjugador);
BEGIN
     WITH jugador DO
     BEGIN
          writeln('Nombre : ', nombre);
          writeln('Posicion natural de juego', posicion_natural);
          writeln('Posicion de juego', posicion);
          writeln('Edad', edad);
          writeln('Nacionalidad', nacionalidad);
          writeln('Velocidad', velocidad);
          writeln('Lesionado : ', lesionado);
          writeln('Tecnica : ', tecnica);
          writeln('Precio : ', precio);
          writeln('PUNTUACION TOTAL : ', puntuacion);
          writeln;
          writeln('...enter para ver el siguiente');
          readln;
     END;
END;{ver_ficha}


(*-------------------------------------------------------------------*)

(*-------------------------------------------------------------------*)
FUNCTION menu :integer;
VAR
opcion:integer;
BEGIN
     writeln('                  ***********************************')
     writeln('                             MENU PRINCIPAL');
     writeln('                  ***********************************');
     writeln;
     writeln;
     writeln('       1. Preparar equipos para inicio de liguilla');
     writeln('       2. Ver fichas de los equipos');
     writeln('       3. Jugar');
     writeln('       0. Salir');
     writeln;

     REPEAT
     writeln('                Escoja una opcion');
     readln(opcion);
     UNTIL (opcion<=4) AND (opcion>=0);

     menu:=opcion;
END;{menu}


(*-------------------------------------------------------------------*)
(*-------------------------------------------------------------------*)
BEGIN{PROGRAMA PRINCIPAL}

writeln('             ******************************************');
writeln('                         FOOTBALL CHAMPIONSHIP');
writeln('             ******************************************');


REPEAT
      opcion:=menu;

      CASE opcion OF
      1:  BEGIN
                FOR ind_equipo:=1 TO NEQUIPOS DO
                    BEGIN
                         FOR ind_jugador:=1 TO NJUGADORES DO
                             BEGIN
                                  nueva_ficha(equipo[ind_equipo].jugador[ind_jugador]);
                             END;
                    END;
           END{CASO 1}

      2: BEGIN
                FOR ind_equipo:=1 TO NEQUIPOS DO
                    BEGIN
                         FOR ind_jugador:=1 TO NJUGADORES DO
                             BEGIN
                                  ver_ficha(equipo[ind_equipo].jugador[ind_jugador]);
                             END;
                    END;
          END{CASO 2}


      3: writeln('JUEGO DEL PARTIDO...EN KONSTRUCCION');

      END;{CASE}

UNTIL (opcion=0);

END.{P.P.}