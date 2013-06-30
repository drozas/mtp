PROGRAM mcd (input, output);
VAR
num1, num2, res: integer;

BEGIN

     REPEAT
     writeln('Introduzca dos numeros');
     readln(num1, num2);

     UNTIL (num1>0) AND (num2>0);

     WHILE (num1 mod num2)<>0 DO
     BEGIN
     res:= num1 mod num2;
     num1:=num2;
     num2:=res;
     END;

     writeln('el mcd es', num2);
     readln;
END.