PROGRAM ExamenPractico;
CONST
TOPE = 3;

TYPE
    tFecha= RECORD
            dia:1..31;
            mes:1..12;
            anio:1..10000;
            END;

    tRegistro= RECORD
              nombre: string[25];
              valor : real;
              fecha:tFecha;
              END;

    tArray= ARRAY[1..TOPE] of tRegistro;
    tArchivo= FILE OF tRegistro;

VAR
array1: tArray;
llenado:integer;  {En llenado, llevamos el  numero de posiciones del
                  array ya ocupadas}
opcion:integer;
numele: integer;



function FileExists(FileName: String): Boolean;
{ Boolean function that returns True if the file exists;otherwise,
 it returns False. Closes the file if it exists. }
var
 F: file;
begin
 {$I-}
 Assign(F, FileName);
 FileMode := 0;  { Set file access to read only }
 Reset(F);
 Close(F);
 {$I+}
 FileExists := (IOResult = 0) and (FileName <> '');
end;  { FileExists }

PROCEDURE IniciaArray (VAR array1:tArray; VAR llenado:integer; num:integer);
VAR
i: integer;
llenadoAux:integer;

BEGIN
     llenadoAux:=llenado+1;

     FOR i:=llenadoAux TO (LlenadoAux + num -1) DO
     BEGIN
         writeln('Nombre');
         readln(array1[i].nombre);
         writeln('Valor');
         readln(array1[i].valor);
         writeln('Dia');
         readln(array1[i].fecha.dia);
         writeln('Mes');
         readln(array1[i].fecha.mes);
         writeln('Anio');
         readln(array1[i].fecha.anio);
         llenado:=llenado+1;
     END;

END; {Nos devuelve el array ya modificado a partir de llenado; con
     llenado tambi‚n modificado}

PROCEDURE ordenaArray (VAR array1: tArray; llenado:integer);
VAR
i, j : integer;
aux:tRegistro;



BEGIN
     {Tendremos que ordenar solo hasta los que han sido  almacenados
     , es decir hasta llenado-1}

     FOR i:=1 TO llenado-1 DO
     BEGIN
           FOR j:=1 to llenado-1 DO
           BEGIN

               IF (array1[j].nombre > array1[j+1].nombre) THEN
                BEGIN
                     aux:=array1[j];
                     array1[j]:=array1[j+1];
                     array1[j+1]:=aux;
                     {Hacemos el intercambio}
                END;{IF}
          END;{FOR}
     END;{FOR}

END; {Ordenar}


PROCEDURE CrearFicheros (VAR array1:tArray; llenado:integer);
VAR
anio1, anio2, anio3 :tArchivo;
i:integer;

BEGIN


     {Lo ordenamos}
     OrdenaArray(array1, llenado);

     {Hay que crear y asignar la direccion a los ficheros}
     ASSIGN(anio1, 'C:\temp\anyo2001.dat');
     ASSIGN(anio2, 'C:\temp\anyo2002.dat');
     ASSIGN(anio3, 'C:\temp\anyo2003.dat');

     {Hay que crearlos y abrirlos para escritura}
     REWRITE(anio1);
     REWRITE(anio2);
     REWRITE(anio3);


     FOR i:=1 TO llenado DO
     BEGIN
          IF array1[i].fecha.anio=2001 THEN
          BEGIN
               write(anio1, array1[i]);
          END;

          IF array1[i].fecha.anio=2002 THEN
          BEGIN
               write(anio2, array1[i]);
          END;

          IF array1[i].fecha.anio=2003 THEN
          BEGIN
               write(anio3, array1[i]);
          END;
     END;

     CLOSE(anio1);
     CLOSE(anio2);
     CLOSE(anio3);

END;{CrearFicheros}

PROCEDURE VerFicheros;
VAR
RegAux: tRegistro;
nombreFich: string;
fich:tArchivo;

BEGIN
     writeln('Introduzca el nombre del fichero que quiere ver');
     readln(nombreFich);

     IF FileExists (nombreFich) THEN
     BEGIN
          ASSIGN(fich, nombreFich);
          RESET(fich);

                      WHILE NOT(EOF(fich)) DO
                      BEGIN
                           read(fich, RegAux);

                           writeln(RegAux.nombre);
                           writeln(RegAux.valor);
                           writeln(RegAux.fecha.dia);
                           writeln(RegAux.fecha.mes);
                           writeln(RegAux.fecha.anio);
                      END;
          CLOSE(fich);
     END
     ELSE
     writeln('El fichero no existe');


END;

BEGIN{P.P.}

           {Inicializacion de variables}

           llenado:=1;
           {Pasa por referencia en los que debe sufrir modificaciones:
            IniciaArray;
            Y por valor en los que no lo va a sufrir: Ordenar Y
            CrearFicheros (no se a¤aden nuevos reg; solo esta como tope}


            REPEAT
                  REPEAT
                        writeln('1. Almacenar Datos en Memoria');
                        writeln('2. Crear Ficheros');
                        writeln('3. Ver Fichero');
                        writeln('0. Salir');
                        readln(opcion);
                  UNTIL (opcion>=0) AND (opcion<=3);
                  {Para obligar a coger una de esas opciones}


                  CASE opcion OF
                  1:BEGIN
                         writeln('Numero de elementos que quiere inicializar');
                         readln(numele);
                         IniciaArray(array1, llenado,numele);
                    END;

                  2: CrearFicheros(array1, llenado);
                  3: VerFicheros;
                  END;

            UNTIL (opcion=0) OR (llenado>TOPE);

            IF (llenado>TOPE) THEN
               writeln('El array ya est  lleno');
            {Hasta que elija salir}
END.{PP}