PROGRAM pract10A2;

CONST
     NEMPLEADOS=3;

TYPE

    tRegistro= RECORD
               nombre: string[30];
               ID: integer;
               sueldo: real;
    END;

    tGasto= real;
    tpuntRegistro= ^tRegistro;

VAR

gasto:tGasto;
puntRegistro: tpuntRegistro;
i:integer;


{Crear otro procedimiento por el que pasemos el puntero, y la variable
gasto. Accedemos al campo sueldo apuntado por el puntero, y se lo
sumamos a gasto}

PROCEDURE ProcesarRegistro (pRegistro: tpuntRegistro; VAR gasto :tGasto);
BEGIN

          gasto:= gasto + pRegistro^.sueldo;

END;



{Crear un procedimiento al que se le pase una variable de tipo pRegistro;
reserve memorio con new; y pido los datos}

PROCEDURE CreacionRegistro (VAR pRegistro: tpuntRegistro);

BEGIN
          new(pRegistro);

          writeln('********************************************');
          writeln('  ENTRADA DE DATOS A REGISTRO, CON PUNTERO');
          writeln('********************************************');

          writeln('Nombre:');
          readln(pRegistro^.nombre);
          writeln('Numero de identificacion:');
          readln(pRegistro^.ID);
          writeln('Sueldo:');
          readln(pRegistro^.sueldo);
          writeln;
          writeln;



END; {CreacionRegistro}



{Crear un £ltimo procedimiento que le pasemos un puntero, y libere la
memoria reservada para el}

PROCEDURE LiberarMemoria (VAR punteroAliberar: tpuntRegistro);
BEGIN

          dispose(punteroAliberar);

END;

BEGIN {PP}

      gasto:=0;

      {Hacer el sumatorio de los sueldos de N empleados}

      FOR i:=1 TO NEMPLEADOS DO
      BEGIN

      CreacionRegistro(puntRegistro);
      ProcesarRegistro(puntRegistro, gasto);


      writeln (' El gasto total asciende a : ', gasto:0:2);
      writeln;
      writeln;
      readln;
      END;
       LiberarMemoria(puntRegistro);
      writeln;
      writeln;
      writeln('--------------------------------------');
      writeln('                   TOTAL:', gasto:0:2);
      readln;
END.{PP}