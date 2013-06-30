PROGRAM ejercicio9C ;
{Consiste en la eliminaci¢n de espacios m£ltiples.
Tenemos que abrir el archivo, leerlo; y en el caso en el
que se encuentre m s de un espacio eliminarlo}

VAR
texto, textoAux : text;
car:char;
carSig: char;

(*---------------------------------------------------------*)
FUNCTION existe (VAR texto: text):boolean;
BEGIN
     {$I-} {Activamos la opcion para el control de reset}
     RESET(texto);
     {$I+} {Y la desactivamos para que detecte otros errores}
     existe:= IORESULT=0;
END; {existe}
(*--------------------------------------------------------*)

BEGIN

     {Asignamos el nombre, y lo abrimos para lectura}
     ASSIGN(texto, 'A:\txt9C.txt');
     ASSIGN(textoAux, 'A:\txt9C_SE.txt');

     IF (NOT existe(texto)) THEN
     BEGIN
        writeln('El archivo no existe. Se ha creado txt9C.txt');
        REWRITE(texto);
        RESET(texto);
     END
     ELSE
     BEGIN
         RESET(texto);

         {Vamos a escribir el texto inicial, con el bucle "normal";
         es decir; sin controlar el fin de linea}

         WHILE (NOT EOF(texto)) DO
         BEGIN
              read(texto, car);
              write(car);
         END;
         readln;
         {Lo cerramos y lo volvemos a abrir para el tratamiento}
         CLOSE(texto);
         RESET(texto);

     END;

     {Abrimos el texto auxiliar para escritura}
     REWRITE(textoAux);


     WHILE (NOT EOF(texto)) DO
     BEGIN
         read(texto, car);
                     IF car=' ' THEN
                     BEGIN
                          REPEAT
                                read(texto, car);
                          UNTIL (car<>' ');
                     write(textoAux, ' ');
                     END;

         write(textoAux, car);
     END;

     writeln('Se han eliminado los multi-espacios del texto correctamente!!!');
     readln;

     (*Vamos a escribir el texto resultante; controlando los fines de
     linea. Hay que tener cuidao, porque en realidad; en pascal son
     dos los caracteres que marcan el fin de linea...asi que
     despues de salir del bucle EOLN, hay que meterle un readln.
     De todas formas tambien se puede escribir como hemos hecho arriba;
     es decir, con bucle EOF, simplemente*);

     CLOSE(textoAux);
     RESET(textoAux);
     WHILE NOT(EOF(textoAux)) DO
     BEGIN
          WHILE NOT(EOLN(textoAux)) DO
          BEGIN
               read(textoAux, car);
               write(car);
          END;
          readln(textoAux);
          writeln;
     END;

     readln;

     CLOSE(texto);
     CLOSE(textoAux);
END.

