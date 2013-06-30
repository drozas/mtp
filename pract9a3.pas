PROGRAM Pract9A3;
TYPE
    tPalabra = RECORD
             espaniol: string[20];
             ingles: string[20];
    END;

    tDiccionario= FILE OF tPalabra;
{No hace falta crear un array. Al hacer el tipo archivo guardamos las
diferentes entradas y accedemos a ellas despues con la funcion SEEK; en
realidad estamos utilizando punteros}

VAR
diccionario: tDiccionario;
Palabra: tPalabra;
opcion:integer;

(*------------------------------------------------------*)

FUNCTION existe (VAR diccionario: tDiccionario):boolean;
BEGIN
     {$I-} {Activamos la opcion para el control de reset}
     RESET(diccionario);
     {$I+} {Y la desactivamos para que detecte otros errores}
     existe:= IORESULT=0;
END; {existe}

(*---------------------------------------------------------*)

PROCEDURE NuevaEntrada (VAR  diccionario:tDiccionario);
{En este procedimiento se meten las nuevas palabras en el diccionario.
Primero se comprueba que el diccionario existe. Si no, se crea.
Despu‚s comprobamos el numero de registros, y mediante SEEK accedemos
"uno m s" all ; preguntando por la palabra en ingles, su traduccion en
espa¤ol; y despu‚s guard ndola en el diccionario}

VAR
nregistros: longint;
seguir:char;
existedic:boolean;

BEGIN
     ASSIGN(diccionario, 'A:\dic.txt');

     REPEAT

     existedic:=existe(diccionario);
     IF existedic THEN

           RESET(diccionario)
     ELSE
           REWRITE(diccionario);


           {Vemos el n£mero de registros que tenemos actualmente...}
           nregistros:=FILESIZE(diccionario);
           {Ponemos el puntero en la nueva posicion}
           SEEK(diccionario, nregistros+1);


           writeln('Introduccion de una nueva palabra...');
           writeln('Introduzca la palabra en ingles: ');
           readln(Palabra.ingles);

           writeln('Ahora introduzca su significado en espanol: ');
           readln(Palabra.espaniol);

           {Y lo guardamos ahi...}
           write(diccionario, Palabra);

           CLOSE(diccionario);
           writeln;
           writeln('Desea introducir otra palabra? S/N');
           readln(seguir);
     UNTIL(seguir='N') OR (seguir='n');

END;{Nueva entrada}

(*-----------------------------------------------------------------*)

PROCEDURE TraducirPalabra (VAR diccionario:tDiccionario);
{Se trata de traducir a ingl‚s una palabra en espa¤ol}
VAR
palabraAux: tPalabra;
palabraConsultada, palabraTraducida:string[20];
final:boolean;
seguir:char;
BEGIN


     {Asignamos la direccion...}
     ASSIGN(diccionario, 'A:\dic.txt');

REPEAT

     {Abrimos en modo lectura, desde el principio del archivo}
     RESET(diccionario);
     {Inicializacion de variable final. Hay que ponerla a
     false cada vez por que si se consulta varias veces el diccionario}
     final:=false;

     {Pedimos la palabra buscada}
     writeln('Traduccion a ingles de una palabra...');
     writeln('Introduzca la palabra en espanol, que quiere traducir');
     readln(palabraConsultada);

     WHILE (NOT EOF(diccionario))  DO
     BEGIN

     read(diccionario, palabraAux);

                       {Si encontramos la palabra, guardamos la
                        traduccion y finalizamos la b£squeda}
                       IF (palabraAux.espaniol=palabraConsultada) THEN
                       BEGIN
                          writeln('La palabra ', palabraConsultada, ' se escribe en ingles ', palabraAux.ingles);
                          final:=TRUE;
                          readln;

                       END;{IF}
     END;{WHILE}

     {Si final es false, pero hemos salido del bucle; es porque no
     hemos encontrado la palabra; asi que mostraremos un mensaje
     por pantalla}
     IF final=FALSE THEN
     BEGIN
        writeln('La palabra ', palabraConsultada, ' no aparece en el diccionario');
        readln;
     END;

     CLOSE(diccionario);

     writeln('Desea consultar otra palabra? S/N');
     readln(seguir);

UNTIL (seguir='n') OR (seguir='N');
END;

(*------------------------------------------------------*)

PROCEDURE TraducirFrase (VAR diccionario:tDiccionario);

VAR
fraseConsultada: string;
palabraAux:string;
i:integer;
ultimaPalabra:boolean;
regPalabraAux:tPalabra;
palabraEncontrada:boolean;


BEGIN
     {Inicializacion de variables}
     i:=1;
     palabraAux:='';
     ultimaPalabra:=false;
     PalabraEncontrada:=false;

     {Asignamos el directorio en el que se encuentra el diccionario}
     ASSIGN(diccionario, 'A:\dic.txt');

     writeln('Introduzca una frase en espanol, para traducirla en ingles. TIENE QUE ACABAR EN PUNTO: .');
     readln(fraseConsultada);

     REPEAT
           palabraAux:='';
           palabraEncontrada:=FALSE;
           {Si es espacio o punto, entonces no se le concatena a la palabra
           que queremos buscar}
           WHILE (fraseConsultada[i]<>' ') AND (fraseConsultada[i]<>'.') DO
           BEGIN
            palabraAux:=palabraAux+fraseConsultada[i];
            i:=i+1;
           END;

           {Le sumamos uno, para que a la proxima empiece despues del caracter
           en blanco}
           i:=i+1;

           {Y si el siguiente es un punto, entonces el bucle general no
           se tendra que volver a ejecutar}

           IF fraseConsultada[i]='.' THEN
           BEGIN
                ultimaPalabra:=true;
           END;

           {Abrimos para lectura}
           RESET(diccionario);

           {Comparamos con todas las palabras del diccionario hasta
           llegar al final}
           WHILE NOT EOF(diccionario) DO
           BEGIN
           read(diccionario, regPalabraAux);
                             {Si la encontramos la escribimos}
                             IF(regPalabraAux.espaniol=palabraAux)THEN
                             BEGIN
                                    write(' ', regPalabraAux.ingles, ' ');
                                    palabraEncontrada:=TRUE;
                             END;
           END;

           {Si no la hemos encontrado despues de recorrer todo el diccionario
           escribimos ?????? y continuamos intentando traducir la
           siguiente palabra}

           IF (palabraEncontrada=FALSE) THEN
           BEGIN
              write(' ????? ');
           END;

           CLOSE(diccionario);

     UNTIL (ultimaPalabra) OR (i>=length(fraseConsultada));
     writeln;
     readln;


END;{TraducirFrase}

(*-----------------------------------------------------*)


PROCEDURE MostrarEntradas (VAR diccionario:tDiccionario);
VAR
palabraAux:tPalabra;

BEGIN

     ASSIGN(diccionario, 'A:\dic.txt');
     RESET(diccionario);

     writeln('------------------------------');
     writeln('Espanol     ------>     Ingles');
     writeln('------------------------------');

     writeln;
     writeln;
     writeln('------------------------------');

     WHILE (NOT EOF(diccionario)) DO
     BEGIN
     read(diccionario, palabraAux);
     writeln(palabraAux.espaniol, ' ------> ', palabraAux.ingles);
     writeln('------------------------------');
     writeln;


     END;
     readln;

     CLOSE(diccionario);
END; {MOSTRARENTRADAS}

(*------------------------------------------------------------*)




PROCEDURE opciones (VAR diccionario:tDiccionario);
{Haremos un procedimiento con opciones de configuracion y de gestion
del archivo diccionario; para ver como funcionan algunos procedimientos
aplicables a archivos de texto y binarios}

VAR
opcion:integer;
nentradas:longint;
nuevoNombre, borrarNombre, nombreNuevaCarpeta, nombreBorrarCarpeta, nombreNuevoDirectorio: string;

BEGIN

     ASSIGN(diccionario, 'A:\dic.txt');
     RESET(diccionario);

     REPEAT
     writeln;
     writeln('                ***************************************');
     writeln('                      OPCIONES DE CONFIGURACION');
     writeln('                ***************************************');
     writeln;
     writeln;
     writeln(' Opciones de diccionario-fuente (fichero)');
     writeln;
     writeln('1. Ver el numero de entradas actualmente en el diccionario-fuente');
     writeln('2. Ver las entradas del diccionario-fuente');
     writeln('3. Cambiar de nombre al diccionario-fuente');
     writeln('4. Eliminar un diccionario-fuente');
     writeln;
     writeln(' Opciones de carpetas (directorios');
     writeln;
     writeln('5. Crear una carpeta');
     writeln('6. Borrar una carpeta');
     writeln('7. Cambiar de directorio actual');
     writeln('0. VOLVER AL MENU PRINCIPAL');
     writeln;

             REPEAT
             writeln('Escoja una opcion...');
             readln(opcion);
             UNTIL (opcion>=0) AND (opcion<=7);


             CASE opcion OF
             1: BEGIN
                  nentradas:=FILESIZE(diccionario);
                  writeln('El diccionario cuenta actualmente con ', nentradas DIV  2, ' entradas.');
                END;

             2:MostrarEntradas(diccionario);

             3: BEGIN
                writeln('Introduzca un nuevo nombre para el diccionario-fuente');
                readln(nuevoNombre);
                RENAME(diccionario, nuevoNombre);
                END;

             4: BEGIN
                {writeln('Introduzca el nombre del diccionario-fuente que desea elminar');
                readln(borrarNombre);
                CLOSE(borrarNombre);
                ERASE(borrarNombre);}
                {TE PIDE UN DATO FICHERO...PERO COMO ASIGNAS EL NOMBRE
                CON DIRECTORIO STRING + VARIABLE????}
                writeln('Opcion no disponible...');
                END;

             5: BEGIN
                writeln('Introduzca el nombre de la nueva carpeta');
                readln(nombreNuevaCarpeta);
                MKDIR(nombreNuevaCarpeta);
                END;

             6: BEGIN
                writeln('Introduzca el nombre de la carpeta que quiere eliminar');
                readln(nombreBorrarCarpeta);
                RMDIR(nombreBorrarCarpeta);
                END;

             7: BEGIN
                writeln('Introduce el nombre del directorio al que quieres ir');
                readln(nombreNuevoDirectorio);
                CHDIR(nombreNuevoDirectorio);
                END;

             END;

             readln;

     UNTIL(opcion=0);
END;{OPCIONESCONFIGURACION}


(*--------------------------------------------------------------*)

BEGIN{P.P.}

      REPEAT

           writeln('                     ********************************');
           writeln('                        DICCIONARIO INGLES-ESPANOL');
           writeln('                     ********************************');
           writeln;
           writeln;
           writeln;
           writeln('1. Introducir nuevas entradas en el diccionario');
           writeln('2. Traducir a ingles una palabra en espanol');
           writeln('3. Traducir a ingles una frase en espanol');
           writeln('4. Opciones de configuracion');
           writeln('0. SALIR');
           writeln;

           {Obligamos a que escoja una entre 0 y 3}
           REPEAT
           writeln('Elija una opcion...');
           readln(opcion);
           UNTIL (opcion>=0) AND (opcion<=4);

           writeln;
           writeln;

           CASE opcion OF
           1: NuevaEntrada(diccionario);
           2: TraducirPalabra(diccionario);
           3: TraducirFrase(diccionario);
           4: Opciones(diccionario);
           END;

      UNTIL (opcion=0);

END.{P.P.}