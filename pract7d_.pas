PROGRAM pract7d_a {input, output};
CONST
OPORTUNIDADES = 10;

VAR
palabra, palabraaux:string;
car: char;
i:integer;
intentos:integer;
final:boolean;
numcaracteres:integer;

BEGIN{P.P.}

{Inicializaci¢n de variables}
palabraaux:='';
intentos:=0;
final:=false;



      writeln('               **********************************');
      writeln('                           EL AHORCADO');
      writeln('               **********************************');
      writeln;
      writeln;


{Introducci¢n de la palabra que el jugador A tiene que descubrir}
writeln('Introduzca una palabra, jugador B');
readln(palabra);
numcaracteres:=length(palabra);



{inicializaci¢n de la palabra auxiliar}

      FOR i:=1 TO numcaracteres DO
      BEGIN
      palabraaux:=palabraaux+ '_';
      END;


      REPEAT

            writeln('Introduzca un caracter, jugador A');
      readln(car);
      FOR i:=1 TO numcaracteres DO
      BEGIN
           IF palabra[i]=car THEN
           BEGIN
                palabraaux[i]:=car;
           END;{IF}
      END;{FOR}

      writeln(palabraaux);

      IF (palabraaux=palabra) THEN
      BEGIN
            final:=true;
      writeln('El jugador A gana, ha descubierto la palabra en ', intentos, ' intentos');
      readln;
      END;

      intentos:=intentos+1;

      UNTIL (final=true) OR (intentos>=OPORTUNIDADES);

      IF (intentos>=OPORTUNIDADES) THEN
      BEGIN
      writeln('El jugador B gana, el jugador A no ha conseguido adivinar la palabra en ', OPORTUNIDADES, ' oportunidades');
      readln;
      END;

END.{P.P}
