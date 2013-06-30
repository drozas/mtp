PROGRAM pract7d_b {input, output};

VAR
formula:string;
correcta:boolean;

(*-----------------------------------------------------------------*)
FUNCTION es_correcta(formula:string):boolean;
VAR
tope,i:integer;
correcta:boolean;

BEGIN

     {Inicializacion de variables}
     correcta:=true;
     i:=1;

     {Vemos el numero de caracteres de la formula}
     tope:=length(formula);

     {El bucle se ejecuta hasta que encontremos un caracter o subindice
     incorrecto, o hasta que se halla leido completamente}

     WHILE (correcta=true) AND (i<=tope) DO
     BEGIN

          {Si el caracter actual es correcto, correcto es true. Si no coincide
          con los subindices o los elementos del enunciado, entonces se
          saldra del bucle}
          CASE formula[i] OF
          'C','H','O','N': correcta:=true;
          '2'..'6': correcta:=true;
          ELSE
           BEGIN
               correcta:=false;
               writeln('Alguno de los elementos o subindices es incorrecto');
               readln;
           END;{ELSE CASE}
          END;{CASE}

          i:=i+1;

     END;{WHILE}

     es_correcta:=correcta;

END;{es_correcta}

PROCEDURE analisis (formula:string);
TYPE
tabla_elementos= ARRAY[1..4] OF real;

VAR
i:integer;
tope:integer;
{En la tabla de datos...
C es el primer elemento, H el segundo, O el tercero y N el cuarto}
pesomolecular:tabla_elementos;
numelementos:tabla_elementos;
elemento:char;
valor:real;
error:integer;
aux:string[1];

BEGIN

     {Inicializacion de variables}
     FOR i:=1 TO 4 DO
     BEGIN
     pesomolecular[i]:=0;
     numelementos[i]:=0;
     END;



     tope:=length(formula);


     FOR i:=1 TO tope DO
     BEGIN

          CASE formula[i] OF
          'C': numelementos[1]:=numelementos[1]+1;
          'H': numelementos[2]:=numelementos[2]+1;
          'O': numelementos[3]:=numelementos[3]+1;
          'N': numelementos[4]:=numelementos[4]+1;
          ELSE
          {Si no es ninguna letra, entonces tiene que ser un numero.
          Como previamente hemos comprobado que la formula es correcta;
          antes de cada numero ira el elemento que multiplica el subindice.
          Asi que habra que restarlo una vez (ya que lo hemos sumado previamente)
          y sumar a numelementos el elemento subindice tantas veces como
          nos indique el numero. El elemento se almacena en la variable
          elemento, y es el caracter anterior al numero encontrado.
          En aux se almacena el subindice numerico.}
            BEGIN{else}
                         valor:=0.0;
                         elemento:=formula[i-1];
                         aux:=formula[i];
                         val(aux, valor, error);
                         valor:=trunc(valor);
                         CASE elemento OF
                         'C': numelementos[1]:=(numelementos[1]-1)+valor;
                         'H': numelementos[2]:=(numelementos[2]-1)+valor;
                         'O': numelementos[3]:=(numelementos[3]-1)+valor;
                         'N': numelementos[4]:=(numelementos[4]-1)+valor;
                         END;{CASE}

            END;{ELSE}
          END;{CASE}
     END;{FOR}
     {Salida por pantalla del numero de elementos}
     writeln('****************************************************************************');
     writeln('      Esta compuesto quimico esta formado por:');
     writeln('      -  Atomos de carbono (C):', numelementos[1]:2:0, ' . Peso molecular total: ', (numelementos[1]*12):2:0);
     writeln('      -  Atomos de hidrogeno (H):', numelementos[2]:2:0, ' . Peso molecular total: ', (numelementos[2]):2:0);
     writeln('      -  Atomos de oxigeno (O):', numelementos[3]:2:0, ' . Peso molecular total: ', (numelementos[3]*16):2:0);
     writeln('      -  Atomos de nitrogeno (N):', numelementos[4]:2:0, ' . Peso molecular total: ', (numelementos[4]*14):2:0);
     writeln('****************************************************************************');
     readln;
END;{Analisis}

(*------------------------------------------------------------------*)
(*------------------------------------------------------------------*)

BEGIN{P.P.}

           writeln('              ************************************** ');
           writeln('                ANALISIS DE COMPUESTOS ORGANICOS');
           writeln('              ************************************** ');
           writeln;
           writeln;
     REPEAT

     writeln('Introduzca una formula de quimica organica');
     writeln('Los elementos tienen que ser C, H, O, N seguidos opcionalmente de subindices 2,3,4,5,6');

     readln(formula);
     correcta:= es_correcta(formula);

     UNTIL (correcta=true);
     writeln('Pulse enter para realizar el analisis del compuesto');
     readln;

     analisis(formula);
END.{P.P.}