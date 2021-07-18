{
 2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
	se lee la secuencia:
	3 5 6 2 3 10 98 8 -12 9
	deberá informar: “El mayor número leído fue el 98”
   
}


program Practica1Parte2Ejer2;

var i, mayor, num, numeroAnterior:integer;

BEGIN
	numeroAnterior:=0;
	num:=0;
	mayor:=0;
	for i:= 1 to 10 do
	begin
		readln(num);// primero lee el numero 1
		if (num > numeroAnterior) then // Pregunta si el numero actual es mayor al numero Anterior.
			if (num > mayor) then
				mayor:= num;
		numeroAnterior:= num;// asigna el valor del numero 1 al numero 2 (numero2 es el numero anterior)
		num:=0; // despues resetea el primer numero, asi le queda el valor 0
	end;
	writeln('El numero mayor es: ', mayor);
END.
