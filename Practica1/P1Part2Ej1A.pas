{
   1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
   * a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5
}


program Practica1Parte2Ejer1;

var i, num,total,mayores:integer;

BEGIN
	total:=0;
	mayores:=0;
	writeln('Ingrese 10 numeros enteros:');
	for i:= 1 to 10 do
		begin
			readln(num);
			total:= total + num;
			if (num > 5) then
				mayores:= mayores+1;
		end;
	writeln('La suma total fue: ',total);
	writeln('La cantidad de numeros mayores a 5 fue:', mayores);
END.

