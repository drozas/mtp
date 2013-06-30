PROGRAM compra {input, output};
        {Objetivo: Devolucion en menor cantidad posible de monedas posibles}
        {Entrada: importe y lo pagado}
        {Salida: cambio, en menor numero posible de monedas}

VAR
   precio, pagado, cambio: integer;
   cien, cincuenta, veinticinco, cinco, uno: integer;

BEGIN

     writeln('Introduzca el precio del articulo');
     readln(precio);
     writeln('Introuzca el importe pagado');
     readln(pagado);
     cambio:=pagado-precio;
          cien:= cambio DIV 100; {nos da el numero de monedas}
          cambio:= cambio MOD 100; {cogemos el resto de coger las de 100}

          cincuenta:= cambio DIV 50;
          cambio:= cambio MOD 50;

          veinticinco:= cambio DIV 25;
          cambio:= cambio MOD 25;

          cinco:= cambio DIV 5;
          cambio:= cambio MOD 5;

          uno:= cambio DIV 1;
     writeln('La devolucion es:', cien ,'monedas de cien');
     writeln(cincuenta, 'monedas de cincuenta');
     writeln(veinticinco, 'monedas de veinticinco');
     writeln(cinco, 'monedas de cinco');
     writeln(uno, 'monedas de uno');
END.





