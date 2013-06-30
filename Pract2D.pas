PROGRAM COLORES   {input, output};

        {Prop¢sito: crear un programa que nos informe del color basico, a
        partir de su valor en nanometros}
        {Entrada: valores numericos reales en nanometros}
        {Salida: el color correspondiente}


CONST MIN=400;
      PASO=42.8;
VAR
   nm:real;
BEGIN

     writeln('Introduzca el valor de la radiacion en nanometros');
     readln(nm);


     IF (nm>MIN) AND (nm<(MIN+PASO)) THEN
        writeln('La radiacion corresponde al VIOLETA')

     ELSE IF (nm>(MIN+PASO)) AND (nm<(MIN+(PASO*2))) THEN
          writeln('La radiacion corresponde al A¥IL')

     ELSE IF(nm>(MIN+PASO*2)) AND (nm<(MIN+(PASO*3))) THEN
          writeln('La radiacion corresponde al AZUL')

     ELSE IF(nm>(MIN+PASO*3)) AND (nm<(MIN+(PASO*4))) THEN
          writeln('La radiacion corresponde al VERDE')

     ELSE IF(nm>(MIN+PASO*4)) AND (nm<(MIN+PASO*5)) THEN
          writeln('La radiacion corresponde al AMARILLO')

     ELSE IF(nm>(MIN+PASO*5)) AND (nm<(MIN+PASO*6)) THEN
          writeln('La radiacion corresponde al NARANJA')

     ELSE IF(nm>(MIN+PASO*6)) AND (nm<(MIN+PASO*7)) THEN
          writeln('La radiacion corresponde al ROJO')

     ELSE
         writeln('La radiacion introducida no corresponde a luz visible');


     readln
END.



