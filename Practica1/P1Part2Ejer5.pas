{
  5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
	ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ 	l número máximo leído.
◦ 	El número mínimo leído.
◦ 	La suma total de los números leídos.
   
   
}


program Practica1Parte2Ej5;

var min,max,suma,numero: integer;

BEGIN
	suma:=0;
	min:= 1500;
	max:= -1;
	repeat
		numero:= 0; // cada vez que se repite el numero queda en 0
		writeln('Ingrese un numero entero: ');
		readln(numero);
		if (numero < min) then
			min:=numero;
		if (numero > max) then
			max:=numero;
		suma:= suma + numero; // sumamos los numeros
	until (numero = 100); // se repite hasta que num sea 100
	writeln('El numero maximo leido fue: ', max);
	writeln('El numero minimo leido fue: ', min);
	writeln('La suma total fue: ', suma);
END.

