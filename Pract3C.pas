PROGRAM binomial {input, output};

VAR
n, k, total:integer;


BEGIN

     n:=-69;
     k:=-666;
     total:=0;

     WHILE(k<0) or(n<k) DO
     BEGIN
     writeln('Introduzca el valor de n');
     readln(n);
     writeln('Introduzca el valor de k');
     readln(k);
     END;

     WHILE(k>0) DO
     BEGIN
     total:= total + ((n*(n-1)) div k);
     n:=n-1;
     k:=k-1;
     END;

     writeln('El resultado es: ', total);

     readln;

END.

