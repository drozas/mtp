PROGRAM Pract10A1;

TYPE
    pinteger= ^integer;
VAR
   X: integer;
   pEntero: pinteger;
BEGIN

     x:=3;
     pEntero:= @x;
     {Con @+ nombre de var...apuntamos a la variable, introduciendo
     en el puntero su direcci¢n de memoria}

     pEntero^:= 5;
     {Haciendo referencia al puntero con ^, accedemos al valor de
     la variable que es apuntada}
     writeln(' Escribimos el valor, tras hacer pEntero^:=5 ----> ', pEntero^);

     new(pEntero);
     {Con New reservamos un espacio de memoria suficiente para la
     estructura que est  apuntando}
     writeln(' Escribimos el valor tras hacer, new(pEntero) ----> ', pEntero^);

     pEntero^:= x + 17;
     writeln(' Escribimos el valor tras hacer pEntero:=x+17 ---->', pEntero^);
     {De nuevo accedemos al valor de la variable apuntada}

     dispose(pEntero);
     {Con dispose liberamos la parcela de memoria reservada}

     readln;
END.
