PROGRAM bin (input, output);
VAR
num, binario, exp, numaux: integer;
BEGIN

     REPEAT
     writeln('Introduce un numero para convertirlo a binario');
     readln(num);
                 IF (num<0) THEN
                 writeln('El numero debe ser mayor que 0');
     UNTIL (num>=0);
     exp:=1;
     numaux:= num;

     WHILE num>0 DO
     BEGIN
          binario:= binario + (num mod 2)* exp;
          num:=num div 2;

          exp:= exp*10;
     END;

     writeln('El numero ', numaux, ' es en decimal: ', binario);
     readln;
END.