PROGRAM concatenarFicheros;
{Este programa mete en un fichero el contenido de otros dos}
VAR
   fich1, fich2, fichdestino:text;
   car:char;
BEGIN{PP}

     (*Primero hay que asignar la ruta a los primeros*)
     ASSIGN(fich1, 'O:/texto1.txt');
     ASSIGN(fich2, 'O:/texto2.txt');
     ASSIGN(fichdestino, 'O:/texto_concat.txt');

     (*Con reset abrimos los dos primeros archivos para LECTURA *)
     RESET(fich1);
     RESET(fich2);

     (*Con rewrite abrimos el texto destino para ESCRITURA, si no
     existiera abre uno nuevo*)
     REWRITE(fichdestino);

     WHILE NOT EOF(fich1) DO
     BEGIN
          read(fich1, car);
          write(fichdestino, car);
     END;

     WHILE NOT EOF(fich2) DO
     BEGIN
          read(fich2, car);
          write(fichdestino, car);
     END;

     (*Ahora hay que cerrar los archivos...*)
     CLOSE(fich1);
     CLOSE(fich2);
     CLOSE(fichdestino);

END.{PP}