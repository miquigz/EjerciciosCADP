{
  3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
	Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
	número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
	procesarse. Al finalizar la lectura informar:
	- La cantidad de alumnos aprobados (nota 8 o mayor) y
	- La cantidad de alumnos que obtuvieron un 7 como nota
}


program P1Part2Ejer3;

var mayor8,siete, nota: integer;
var nombre: string;

BEGIN
	mayor8:=0;
	siete:=0;
	repeat
		nota:=0;
		writeln('Ingrese el nombre del alumno:');
		readln(nombre);
		writeln('Ingrese la nota del alumno');
		readln(nota);
		if ( (nota >= 8) AND (nota < 11)) then
			mayor8:= mayor8 +1
		else if(nota = 7) then
			siete:= siete+1;
	until (nombre = 'Zidane Zinedine');
	writeln('La cantidad de alumnos aprobados con nota 8 o mayor fue: ', mayor8);
	writeln('La cantidad de alumnos que obtuvieron un 7 como nota: ', siete);
END.
