program ejer8Practica4;
const
	dimF = 400;
type
	alumnos = record
		nro:integer;
		DNI:integer;
		apellido:string;
		nombre:string;
		anioNacimiento:integer;
	end;
	ingresantes = array[1..dimF] of alumnos;

procedure leerIngresantes(var ingre:ingresantes);
var
	i:integer;
begin
	for i:= 1 to dimF do
	begin
		writeln('Ingrese nro de inscripcion');
		readln(ingre[i].nro);
		writeln('Ingrese DNI del alumno');
		readln(ingre[i].DNI);
		writeln('Ingrese apellido del alumno');
		readln(ingre[i].apellido);
		writeln('Ingrese nombre del alumno');
		readln(ingre[i].nombre);
		writeln('Ingrese anio de nacimiento del alumno');
		readln(ingre[i].anioNacimiento);
	end;
end;

procedure dniPares(ingre:ingresantes; var cantPares:integer);
var
	digito, pares,i:integer;
begin
	for i:= 1 to dimF do
	begin
		pares:=0;
		while (ingre[i].DNI <> 0) do // tomamos por sentado que los DNI son de 8 digitos.
		begin
			digito:= ingre[i].DNI mod 10;
			if ( (digito mod 2)=0 )then
				pares:= pares+1;
			ingre[i].DNI:= ingre[i].DNI DIV 10;
		end;
		if (pares = 8) then // fijarnos >7 , si no nos da.
			cantPares:= cantPares+1; 
	end; // testear si entro al if con un writeln. 
end;

procedure maxEdad(ingre:ingresantes; var m1:alumnos; var m2:alumnos);
var
	max1,max2,i:integer;
	maxNombre, max2Nombre, maxApellido, max2Apellido:string;
begin
	max1:= -992;  maxNombre:= ' ';  maxApellido:= ' ';
	max2:= -992;  maxNombre2:=' ';  max2Apellido:=' '; 
	for i:= 1 to dimF do
	begin
		if (ingre[i].edad > max) then
		begin
			max2:= max1;
			max:= ingre[i].edad;
			max2Nombre:= maxNombre;
			maxNombre:= ingre[i].nombre;
			max2Apellido:= maxApellido;
			maxApellido:= ingre[i].apellido;
		end
		else if (ingre[i].edad > max) then
		begin
			max2:= ingre[i].edad;
			max2Nombre:= ingre[i].nombre;
			max2Apellido:= ingre[i].apellido;
		end;
	end;
	m1.nombre:= maxNombre ;  m1.apellido:= maxApellido ;
	m2.nombre:= max2Nombre;  m2.apellido:= max2Apellido; // sacar las otras var, son inecesarias.
end;

VAR
	ingre:ingresantes;
	cantPares:integer;
	max1,max2:alumnos;
	
BEGIN
	cargarIngre(ingre);
	dniPares(ingre, cantPares);
	writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', ( (cantPares/dimF)*100):4:2);
	maxEdad(ingre, max1,max2);
	writeln('El apellido y nombre de los dos alumnos con mayor edad:', max1.nombre, max1.apellido, max2.nombre, max2.apellido);
END.
