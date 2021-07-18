{
9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )
   
}


program P1Ejer8;

var c: char;
var num1,num2,num3,num4: integer;

BEGIN
	writeln('Ingrese un caracter: ');
	readln(c);
	if	( (c = '+') or (c = '-') ) then
		begin
		writeln('Ingrese 4 numeros');
		readln(num1,num2,num3,num4);
		if(c = '+')then
			writeln( (num1) + (num2) + (num3) + (num4) + 0)
		else
			writeln((num1) - (num2) - (num3) - (num4) - 0)
		end
	else
		writeln('ERROR, caracter invalido.');
END.
