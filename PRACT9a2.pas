
PROGRAM eliminar_comentarios;
VAR
fichorigen, fichdestino: text;
car: char;

BEGIN

     {Asociamos cada archivo a su ruta}
     ASSIGN(fichorigen, 'O:/texto.txt');
     ASSIGN(fichdestino, 'O:/texto_destino.txt');

     {Abrimos para lectura y escritura}
     RESET(fichorigen);
     REWRITE(fichdestino);

     WHILE NOT EOF(fichorigen) DO
     BEGIN
     read(fichorigen, car);
                      IF car='{' THEN
                      BEGIN
                            WHILE car<> '}' DO
                            BEGIN
                                  read(fichorigen, car);
                            END;{WHILE}
                      END
                      ELSE
                          write(fichdestino, car);

     END;{WHILE EXTERNO}


     (*Cerrando archivos...*)
     CLOSE(fichorigen);
     CLOSE(fichdestino);

END.
