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

procedure maxProm(alu:alumno; var maxName:string; var max:real);
begin
	if (alu.promedio > max) then 
	begin
		max:= alu.promedio;
		maxName:= alu.nombre;
	end;
end;


VAR
	alu : alumno;
	cantLeidas:integer;
	maxName:string;
	max:real;
	
begin
	max:= -1;
	maxName:= ' ';
	cantLeidas:= 0;
	leer(alu);
	while (alu.codigo <> 0) do
	begin
		maxProm(alu,maxName,max);
		cantLeidas:= cantLeidas + 1;
		leer(alu);
	end;
	writeln('La cantidad de alumnos leidos:', cantLeidas);
	writeln('El alumno con mayor promedio fue:', maxName);
end.
