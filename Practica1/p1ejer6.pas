{
   Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
	lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
	* 33423
	8.40
	19003
	6.43
	-1
	En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
	19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
	promedio).
	Al finalizar la lectura, informar:
	○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
	○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
	1)
	○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
	menor al valor 2500 (en el ejemplo anterior se debería informar 0%).
}

program ejer6practica1;

var legajo,cantAlumnos, cantPromedio:integer;
var promedio, destacados:real;

BEGIN
	promedio:= 0;
	cantAlumnos:= 0;
	cantPromedio:= 0;
	legajo:= 0;
	destacados:=0;
	
	while (legajo <> -1) do
		begin
			writeln('escriba el legajo del alumno:');
			readln(legajo);
			cantAlumnos:= cantAlumnos+1;
			writeln('escriba el promedio del alumno:');
			readln(promedio);
			if (promedio > 6.5) then
				begin
				cantPromedio:= cantPromedio + 1;
				if ( (promedio > 8.5) AND (legajo < 2500) ) then
					destacados:= + 1;
				end;
		end;
	writeln('La cantidad de alumnos leida fue:', cantAlumnos);
	writeln('La cantidad de alumnos con promedio mayor a 6.5 fue:', cantPromedio);
	writeln('El porcentaje de alumnos destacados fue:', (destacados * 100.0 / cantAlumnos):4:2);
END.

