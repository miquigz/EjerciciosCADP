{
   1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
}


program Practica1Parte2Ejer1;

var i, num,total:integer;

BEGIN
	total:=0;
	writeln('Ingrese 10 numeros enteros:');
	for i:= 1 to 10 do
		begin
			readln(num);
			total:= total + num;
		end;
	writeln('La suma total fue: ',total);
END.

