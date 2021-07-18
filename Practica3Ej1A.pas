program Registros;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

procedure leer(var alu : alumno);
begin
	writeln('Ingrese el codigo del alumno'); // Tenemos que preguntar dentro del modulo sino no lo toma.
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln('Ingrese el nombre del alumno');
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno');
		readln(alu.promedio);
	end;
end;
{ declaración de variables del programa principal }
VAR
	alu : alumno;
{ cuerpo del programa principal }
begin
	alu.codigo:= 1;
	leer(alu);
end.
