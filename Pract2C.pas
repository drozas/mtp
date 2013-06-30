PROGRAM num_combinatorios (input, output);
VAR
denominador, divisor: real;
tope, i, num1, num2:integer;

BEGIN
     denominador:=1;

     REPEAT
           writeln('Introduzca el numero combinatorio');
           readln(num1, num2);
     UNTIL (num1>0) AND (num2>0) AND (num1>num2);

     FOR i:=1 TO num2 DO
     BEGIN
          denominador:= denominador*num1;
          num1:=num1-1;
     END;

     divisor:=1;
     tope:=num2;

     FOR i:=1 TO tope DO
     BEGIN
          divisor:= divisor*num2;
          num2:=num2-1;
     END;

     writeln('El valor del combinacional es ', denominador / divisor:0:2);
     readln;
END.