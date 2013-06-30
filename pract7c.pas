PROGRAM morse {input, output};
{Uses Crt; }

TYPE
tcodigo= string[5];
talfabeto= ARRAY ['A'..'Z'] OF tcodigo;
tnumeros= ARRAY ['0'..'9'] OF tcodigo;

VAR

opcion:integer;
alfabeto:talfabeto;
numeros:tnumeros;


(*---------------------------------------------------------------------*)
PROCEDURE castellano2morse (VAR alfabeto:talfabeto; VAR numeros:tnumeros);
VAR
frase:string;
frasemorse:string;
i:integer; {bucle con el que recorreremos cada letra de la frase}
j:char; {bucle con el que recorreremos el array alfabeto y el
        array numeros comparando, si hay algun caracter que coincida,
        tendra que escribir el valor del array}

BEGIN
     frasemorse:=' ';

     writeln('Introduzca una frase para pasarla a codigo morse');
     readln(frase);


     FOR i:=1 TO length(frase) DO
     BEGIN
          FOR j:='A' TO 'Z' DO
          BEGIN
              IF frase[i]=j THEN
                 frasemorse:=frasemorse+alfabeto[j]+' ';
          END{FOR};

          FOR j:='0' TO '9' DO
          BEGIN
               IF frase[i]=j THEN
                  frasemorse:=frasemorse+numeros[j];
          END{FOR};

          {Si hay un espacio en blanco en castellano, se le concatenan
          tres a la frase en morse}
          IF frase[i]=' ' THEN
          BEGIN
          frasemorse:=frasemorse+' '+' '+' ';
          END;

     END;{FOR}

     writeln('La frase ', frase, ' es en morse ', frasemorse);
     readln;

END;{Castellano2morse}
(*---------------------------------------------------------------------*)

PROCEDURE morse2castellano (VAR alfabeto:talfabeto; VAR numeros:tnumeros);
VAR
i:integer;
j:char;
frase, frasecastellano:string;
tope:integer;
letra:string;
fin:boolean;
finpalabra:boolean;

BEGIN
       frasecastellano:='';
       writeln('Introduzca el codigo morse');
       readln(frase);
       tope:=length(frase);
       i:=1;
       fin:=false;
       {mientras no lleguemos al ultimo caracter, hay que seguir procesando}
       WHILE fin=false DO
       BEGIN
            letra:='';
            finpalabra:=false;
            {Cogemos la serie de caracteres hasta que halla un caracter en
            blanco; y despues se compara con todo el array. La variable
            i contiene el valor del £ltimo ¡ndice, y es la condici¢n de
            salida del bucle general.}
            REPEAT

                   IF frase[i]<>' ' THEN
                   BEGIN
                   letra:=letra+frase[i];
                   END;

                   {Si el usuario introduce tres espacios seguidos en morse
                   se interpreta como un espacio en castellano. Se escribira
                   en pantalla gracias a una condicion mas abajo, que
                   consiste en concatenar un par de espacios en blanco
                   si finpalabra es true}
                   IF (frase[i]=' ') AND (frase[i+1]=' ') AND (frase[i+2]=' ') THEN
                   BEGIN
                   finpalabra:=true;
                   END;

            i:=i+1;
            UNTIL (frase[i]=' ') OR (i>=tope);

            {Si estamos mirando el £ltimo caracter, ponemos a true el fin
            del bucle general, y metemos en letra el £ltimo caracter; ya
            que en el bucle repeat no ha sido leido}
            IF i=tope THEN
            BEGIN
               fin:=true;
               letra:=letra+frase[tope];
            END;

                  FOR j:='A' TO 'Z' DO
                  BEGIN
                        IF letra=alfabeto[j] THEN
                         frasecastellano:=frasecastellano + j + ' ';
                  END;{FOR}

                  FOR j:='0' TO '9' DO
                  BEGIN
                         IF letra=numeros[j] THEN
                         frasecastellano:=frasecastellano + j + ' ';
                  END;{FOR}

                  IF finpalabra=TRUE THEN
                  BEGIN
                  frasecastellano:=frasecastellano + ' '+ ' ';
                  END;
       END;{WHILE}

       writeln('El codigo morse ', frase, ' es en castellano ', frasecastellano);
       readln;

END;{morse2castellano}
(*---------------------------------------------------------------------*)

BEGIN {PROGRAMA PRINCIPAL}

    {Asignaci¢n de valores}
     alfabeto['A']:='.-';
     alfabeto['B']:='-...';
     alfabeto['C']:='-.-.';
     alfabeto['D']:='-..';
     alfabeto['E']:='.';
     alfabeto['F']:='..-.';
     alfabeto['G']:='--.';
     alfabeto['H']:='....';
     alfabeto['I']:='..';
     alfabeto['J']:='.---';
     alfabeto['K']:='-.-';
     alfabeto['L']:='.-..';
     alfabeto['M']:='--';
     alfabeto['N']:='-.';
     alfabeto['O']:='---';
     alfabeto['P']:='.--.';
     alfabeto['Q']:='--.-';
     alfabeto['R']:='.-.';
     alfabeto['S']:='...';
     alfabeto['T']:='-';
     alfabeto['U']:='..-';
     alfabeto['V']:='...-';
     alfabeto['W']:='.--';
     alfabeto['X']:='-..-';
     alfabeto['Y']:='-.--';
     alfabeto['Z']:='--..';


     numeros['0']:='-----';
     numeros['1']:='.----';
     numeros['2']:='..---';
     numeros['3']:='...--';
     numeros['4']:='....-';
     numeros['5']:='.....';
     numeros['6']:='-....';
     numeros['7']:='--...';
     numeros['8']:='---..';
     numeros['9']:='----.';

    REPEAT
     { ClrScr;}

      writeln;
      writeln;
      writeln('            *********************************');
      writeln('                INTERPRETE MORSE-CASTELLANO');
      writeln('            *********************************');
      writeln;
      writeln;

      writeln('      1. Castellano-Codigo Morse');
      writeln('      2. Codigo Morse-Castellano');
      writeln('      3. Salir');

          REPEAT
          writeln('      Introduzca una opcion');
          readln(opcion);
          UNTIL (opcion>=1) AND (opcion<=3);

          CASE opcion OF
          1:Castellano2Morse(alfabeto, numeros);
          2:Morse2Castellano(alfabeto, numeros);
          END;{CASE}

     UNTIL (opcion=3);

END.{PROGRAMA PRINCIPAL}

