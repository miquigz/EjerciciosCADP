{
	4. Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
	ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)
   
}
program P1Ejer4;

var num,num2:Real;

BEGIN
	writeln('ingresar numero real');
	readln(num);
	writeln('ingrese otro numero real');
	readln(num2);
	while (num2 < num * 2 ) do
		readln(num2)
END.
