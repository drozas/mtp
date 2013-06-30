PROGRAM dias {input, output};
        {Prop¢sito: Programa que lee uno de los dias de la semana:L, M, X...
        Debe devolver el nombre completo y si es o no festivo}
        {Entrada: L, M, X, J, V , S o D}
        {Salida: nombre completo y si es o no festivo}

VAR
   dia:char;

BEGIN

     writeln('Introduzca la letra inicial de un dia de la semana');
     readln(dia);

     IF(dia='L') OR (dia='l') THEN
     writeln('Es LUNES, dia no festivo')

     ELSE IF(dia='M') THEN
     writeln('Es MARTES, dia no festivo')

     ELSE IF(dia='X') THEN
     writeln('Es MIERCOLES, dia no festivo')

     ELSE IF(dia='J') THEN
     writeln('Es JUEVES, dia no festivo')

     ELSE IF(dia='V') THEN
     writeln('Es VIERNES, dia no festivo')

     ELSE IF(dia='S') THEN
     writeln('Es SABADO, Festivo!!!')

     ELSE IF(dia='D') THEN
     writeln('ES DOMINGO, Festivo!!!')

     ELSE
     writeln('El caracter introducido no corresponde a ningun dia');

     readln
END.

