program untitled;

var num1,num2:integer;

BEGIN
	writeln('Inserte 2 numeros enteros');
	readln(num1,num2);
	if (num1 >= num2) then
		if (num1 > num2) then
			writeln(num1, ' es mayor que: ', num2)
		else
			writeln(num1, ' es igual a: ', num2)
	if (num2 > num1) then
		writeln(num2, ' es mayor que: ', num1);
END.

