PROGRAM integrales {input, output};
        {Objetivo: dise¤ar un programa que calcule integrales mediante
                   la regla del trapecio}
        {Entrada:limites de integracion y numero de subdivisiones}
        {Salida: valor de la integral}
CONST
E = 2.71882818;

VAR
a, b, ancho, alto, total : real;
n, i: integer;

BEGIN
     {Inicializacion  de variables...}
     a:=0;
     b:=0;
     ancho:=0;
     alto:=0;
     total:=0;
     n:=0;

     {Entrada de datos...}
     writeln('Introduzca el limite superior de la integral');
     readln(b);
     writeln('Introduzca el limite inferior de la raiz');
     readln(a);
     writeln('Introduzca el numero de subdivisiones');
     readln(n);

     {C lculo del ancho...}
     ancho:=(b-a)/n;

     {C lculo de las alturas y sumatorio...}

     FOR i:=1 TO n DO
     BEGIN

         { alto:= ((sqrt(i)*sin(i))/(i+(exp(i*ln(E))) +
                 
(sqrt(i+ancho)*sin(i+ancho))/((i+ancho)+(exp((i+ancho)*ln(E)))))/2);
          }
           alto:= ((sqrt(i)*sin(i))/(i+(exp(i)) +
                 
(sqrt(i+ancho)*sin(i+ancho))/((i+ancho)+(exp(i+ancho))))/2);
          total:=total+(alto*ancho);

     END;

     writeln('El resultado de la integral es :', total :0 :6);
     readln;
END.




