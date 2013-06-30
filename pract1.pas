PROGRAM suma (input, output);

VAR
x, y, aux, resultado :integer;

BEGIN

writeln('introduzca un numero...');
readln(x);

writeln('introduzca otro numero...');
readln(y);

aux:=x+y;

resultado:=sqr(aux);

writeln('el resultado de (', x, ' + ', y, ')^2 es: ',resultado);
readln;

END.
