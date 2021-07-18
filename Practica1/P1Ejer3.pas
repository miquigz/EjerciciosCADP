{
3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10
}

program P1Ejer3;
var
  num1,num2,num3:integer;
begin
  writeln('escriba 3 numeros:');
  readln(num1,num2,num3);

  if ((num1 > num2) AND (num1 > num3)) then  // esta condicion es si num1 es el mas grande de todos
     if(num2 > num3)then
        writeln(num1,'  ',num2,'  ',num3)
     else
       writeln(num1,'  ',num3,'  ',num2);

  if ((num2 > num1) AND (num2 > num3)) then //esta condicion es si el num2 es el mas grande de todos
     if(num1 > num3) then
        writeln(num2,'  ',num1,'  ',num3)
     else
        writeln(num2,'  ',num3,'  ',num1);

  if ((num3 > num1) AND (num3 > num2)) then //esta condicion es si el num3 es el mas grande de todos
     if(num2 > num1) then
        writeln(num3,'  ',num2,'  ',num1)
     else
        writeln(num3,'  ',num1,'  ',num2);
        
  if (( num3 = num2) AND (num3 = num1)) then
     writeln(num3,'  ',num2,'  ',num1);
   readln();
end.
