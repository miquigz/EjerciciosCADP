{   Adicionales
Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8CADP
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.
}

program Practica1AdicionalesEj2;

var condicion: char;
var i, max,max2,legajo, nota, cantI, presente, cantR, parcialI, parcialR, con10AE, sumaNotas, todasAE, con0AE, almenos0, codMayor, codMayor2, max0, max0dos, codMenor, codMenor2, alumnoPromedio:integer;
var promedioAE, porcentajeI, porcentajeR: real;

BEGIN
	porcentajeI:= 0;
	porcentajeR:= 0;
	condicion:= 'X';
	legajo:= 0;
	codMayor:= 0;
	codMayor2:= 0;
	codMenor:= 0;
	codMenor2:= 0;
	almenos0:= 0;
	con10AE:= 0;
	con0AE:= 0;
	todasAE:= 0;
	max:= -1;
	max2:= -3;
	cantI:= 0;
	cantR:= 0;
	parcialI:= 0;
	parcialR:= 0;
	max0:= -5;
	max0dos:= -9;
	promedioAE:=0;
	presente:=0;
	nota:=0;
	while (legajo <> -1) do
		begin
			condicion:= 'X';
			alumnoPromedio:= 0;
			sumaNotas:= 0;	
			nota:=0;
			legajo:=0;
			presente:=0;
			writeln( 'Ingrese numero de legajo: ' );
			readln(legajo);
			writeln( 'Ingrese su condicion: ' );
			readln(condicion);
			writeln( 'Ingresar las notas de las AE, en orden consecutivo 1-5:' );
		
			for i:= 1 to 5 do
				begin
					writeln( 'Ingrese la nota' );
					readln(nota);
					if ( (nota >= 4) AND ( nota <> -1 ) ) then // los presentes de cada AE
						presente:= presente + 1; // si la suma da 4 o mas, puede rendir parcial
					if ( nota = 0) then
						con0AE:= con0AE+1; // contador de notas 0
					if (nota = 10) then
						con10AE:= con10AE + 1; // contador de notas 10
					sumaNotas:= sumaNotas + nota; // suma de todas las notas, sirve para sacar el promedio
				end;
			
			promedioAE:= sumaNotas / 5; // promedio de las 5 notas.
			
			if (promedioAE > 6.5) then // alumno con promedio mayor a 6.5
				alumnoPromedio:= alumnoPromedio + 1;
			if ( presente = 5) then
				todasAE:= todasAE+1;
			
			if (condicion = 'I') then
				begin
					cantI:= cantI+1;
					if (presente > 4) then // cantidad de Alumnos Ingresantes q pueden rendir parcial
						begin
							parcialI:= parcialI + 1;
						end;
				end
			else if (condicion = 'R') then
				begin
					cantR:= cantR+1;
					if (presente > 4) then // cantidad de Alumnos Recursantes q pueden rendir parcial
						begin
							parcialR:= parcialR + 1;
						end;
				end;
			
			if ( con10AE > max) then  // Los 2 Alumnos con mas AE con 10
				begin
					max2:= max;
					max:= con10AE;
					codMayor:= legajo;
				end
			else if (con10AE > max2) then
				begin
					max2:= con10AE;
					codMayor2:= legajo;
				end;
				
			if (con0AE >= 1) then  // Alumnos con almenos una AE con 0.
				almenos0:= almenos0+1;
				
			if (con0AE > max0) then // Los 2 Alumnos con mas AE con 0
				begin
					max0dos:= max0;
					max0:= con0AE;
					codMenor:= legajo;
				end
			else if (con0AE > max0dos) then
				begin
					max0dos:= con0AE;
					codMenor2:= legajo;
				end;
		end;
	porcentajeI:= cantI / parcialI;
	porcentajeR:= cantR / parcialR;
	writeln('Cantidad de alumnos ingresantes en condiciones de rendir el parcial:', parcialI, 'Porcentaje con alumnos Ingresantes: ', porcentajeI:4:2);
	writeln('Cantidad de alumnos recursantes en condiciones de rendir el parcial:', parcialR, 'Porcentaje con alumnos Recursantes: ', porcentajeR:4:2);
	writeln('Cantidad de alumnos que aprobaron todas las AE', todasAE);
	writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos:', alumnoPromedio);
	writeln('Cantidad de alumnos que obtuvieron cero puntos en almenos una AE: ', almenos0);
	writeln('Legajo de alumnos con mayor cantidad de AE con nota 10: ', codMayor, ' y ', codMayor2);
	writeln('Legajo de alumnos con mayor cantidad de AE con nota 0: ', codMenor,' y ', codMenor2);
END.
