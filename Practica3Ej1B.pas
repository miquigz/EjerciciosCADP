program Registros;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;
	
procedure leer(var alu:alumno; var max:real; var nombreMejor:string);
begin
	writeln('Ingrese el codigo del alumno'); // Tenemos que preguntar dentro del modulo sino no lo toma.
	readln(alu.codigo);
	if (alu.codigo <> 0) then begin
		writeln('Ingrese el nombre del alumno');
		readln(alu.nombre);
		writeln('Ingrese el promedio del alumno');
		readln(alu.promedio);
		if (alu.promedio > max) then 
		begin
			max:= alu.promedio;
			nombreMejor:= alu.nombre;
		end;
	end;
end;

VAR
	alu : alumno;
	max:real;
	nombreMejor: string;
begin
	max:= -5;
	alu.codigo:= 1;
	while (alu.codigo <> 0) do
		leer(alu, max, nombreMejor);
	writeln('El alumno con mejor promedio es:', nombreMejor);
end.
