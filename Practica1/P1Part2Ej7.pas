{
7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
   
}


program Practica1Parte2EJ7;

var piloto, nombreMayor, nombreMayor2, nombreMenor2, nombreMenor: string;
var i, tiempo, min, min2, max, max2:  integer;

BEGIN
	nombreMayor:= '';
	nombreMayor2:= '';
	nombreMenor:= '';
	nombreMenor2:= '';
	min:=990;
	min2:=991;
	max:= -999;
	max2:= -999;
	for i:=1 to 100	do
	begin
		piloto:=' '; // se resetea el nombre del piloto
		tiempo:=0;  // se reseta el tiempo
		writeln('inserte el nombre del piloto, y tiempo total: ');
		readln(piloto,tiempo);
// Tiempo mas rapido ( los 2 primeros).
		if (tiempo < min) then  
		begin
			min2:= min;
			min:= tiempo;
			nombreMayor2:= nombreMayor;
			nombreMayor:= piloto;
		end
		else if ( (tiempo < min2) ) then
		begin
			min2:= tiempo;
			nombreMayor2:= piloto;
		end 
		else if (tiempo > max) then // tiempo mas lento (los ultimos).
		begin
			max2:= max;
			max:= tiempo;
			nombreMenor:= nombreMenor2;
			nombreMenor:= piloto;
		end
		else if (tiempo > max2) then
		begin
			max2:= tiempo;
			nombreMenor2:= piloto;
		end;
	end;
	writeln('Dos primeros puestos: ', nombreMayor, ' y ',nombreMayor2);
	writeln('Dos ultimos puestos: ', nombreMenor, '  y  ', nombreMenor2);
END.

