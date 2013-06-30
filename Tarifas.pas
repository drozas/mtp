PROGRAM tarifas {input, output};
        {Prop¢sito: calculo del indice de penalizacion}
        {Entrada: clase de vehiculo, edad, a¤os de carnet, necesidad de 
gafas}
        {Salida: Tarifa}

VAR
vehiculo: char;
carnet: integer;
edad: integer;
gafas: char;
penalizacion: integer;
tarifa: integer;

BEGIN

     writeln('Introduzca el tipo de vehiculo');
     readln(vehiculo);

     {Primer bloque de condicionales, para referirse al tipo de coche...}

     IF(vehiculo='A') THEN
          penalizacion:=0
     ELSE IF(vehiculo='B') THEN
          penalizacion:=2
     ELSE IF(vehiculo='C') THEN
          penalizacion:=3
     ELSE IF(vehiculo='D') THEN
          penalizacion:=5
     ELSE IF(vehiculo='E') THEN
          penalizacion:=7
     ELSE
         writeln('El tipo es incorrecto. Ahora por listo te meto la maxima penalizacion ;D');
         penalizacion:=7;


     writeln('¨Cual es su edad');
     readln(edad);
     writeln('¨Cuantos a¤os lleva con el carnet');
     readln(carnet);

     IF(carnet<5) THEN
                  IF(edad<25)THEN
                       penalizacion:=penalizacion+4
                  ELSE IF(edad>25) AND (edad<30) THEN
                       penalizacion:=penalizacion+2
                  ELSE
                       penalizacion:=penalizacion+1
     ELSE
                IF(edad<25) THEN
                            penalizacion:=penalizacion+2
                ELSE IF(edad>25) and (edad<30) THEN
                     penalizacion:=penalizacion+1;

     writeln('¨Necesita gafas S/N');
     readln(gafas);

     {el if para el caso raro...}

     IF(edad>30) and (gafas='S') THEN
                 penalizacion:=penalizacion
     ELSE IF (gafas='S') THEN
          penalizacion:=penalizacion+1;

     IF(penalizacion<=2) THEN
     tarifa:=250
     ELSE IF(penalizacion>=3) and (penalizacion<=5) THEN
     tarifa:=450
     ELSE IF (penalizacion>=6) and (penalizacion<=8) THEN
     tarifa:=700
     ELSE IF (penalizacion>=9) and (penalizacion<=10) THEN
     tarifa:=900
     ELSE
     tarifa:=1000;

     writeln('Tiene que pagar.... ', tarifa);

     readln
END.

