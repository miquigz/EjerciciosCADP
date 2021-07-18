program ejer9Practica4part1; // en el 8 NO tengo dimension logica, en cambio en este si, ya que solo
const // solo s'e el tamanio minimo (400).
	dimF = 5;
type
	alumnos = record
		nro:integer;
		DNI:integer;
		apellido:string;
		nombre:string;
		anioNacimiento:integer;
	end;
	ingresantes = array[1..dimF] of alumnos;
	
	minis = record
		apellido:string[20];
		nombre:string[20];
	end;
	
procedure leerIngresantes(var ingre:ingresantes; var dimL:integer);
var
	stop:boolean;
begin 
	dimL:=0;
	stop:= false;  
	while ( (dimL < dimF) AND ( stop = false )) do
	begin
		dimL:= dimL + 1;
		writeln('Ingrese nro de inscripcion');
		readln(ingre[dimL].nro);
		writeln('Ingrese DNI del alumno');
		readln(ingre[dimL].DNI);
		if ( ingre[dimL].DNI <> -1 ) then
		begin
			writeln('Ingrese apellido del alumno');
			readln(ingre[dimL].apellido);
			writeln('Ingrese nombre del alumno');
			readln(ingre[dimL].nombre);
			writeln('Ingrese anio de nacimiento del alumno');
			readln(ingre[dimL].anioNacimiento);
		end
		else
		begin
			stop:= true;
			dimL:= dimL -1;
		end;
	end;
end;

(*Dni pares*)
procedure dniPares(var ingre:ingresantes; dimL:integer; var cantPares:integer);
var
	digito, pares,i:integer;
begin
	cantPares:= 0;
	for i:= 1 to dimL do
	begin
		pares:=0;
		while (ingre[i].DNI <> 0) do // tomamos por sentado que los DNI son de 8 digitos.
		begin
			digito:= ingre[i].DNI mod 10;
			if ( (digito mod 2)=0 )then
				pares:= pares+1;
			ingre[i].DNI:= ingre[i].DNI DIV 10;
		end; // este while termina cuando descompusimos los 8 digitos, luego vamos al IF
		if (pares > 3) then // fijarnos >7 , si no nos da.
			cantPares:= cantPares + 1; 
	end; // testear si entro al if con un writeln. 
end;

(*Minimos Nacimiento*)
procedure minEdad(ingre:ingresantes; dimL:integer; var m1:minis; var m2:minis);
var
	min,min2,i:integer;
begin
	min:= 2025; min2:= 2023;
	m2.nombre:= 'asd '; m1.nombre:= 'asd '; m2.apellido:= 'das '; m1.apellido:= 'das ';
	for i:= 1 to dimL do
	begin
		if (ingre[i].anioNacimiento < min) then
		begin
			min2:= min;
			min:= ingre[i].anioNacimiento;
			m2.nombre:= m1.nombre;
			m1.nombre:= ingre[i].nombre;
			m2.apellido:= m1.apellido;
			m1.apellido:= ingre[i].apellido;
		end
		else if (ingre[i].anioNacimiento < min2) then
		begin
			min2:= ingre[i].anioNacimiento;
			m2.nombre:= ingre[i].nombre;
			m2.apellido:= ingre[i].apellido;
		end;
	end;
end;

(*Programa Principal*)
VAR
	ingre, desco:ingresantes;
	dimL, cantPares:integer;
	min1,min2:minis;
	
BEGIN
	leerIngresantes(ingre, dimL);
	desco:=ingre;
	dniPares(desco, dimL,cantPares);
	writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares: ', ( (cantPares / dimL)*100):4:2);
	minEdad(ingre, dimL, min1, min2);
	writeln('El apellido y nombre de los dos alumnos con mayor edad:', min1.nombre, min1.apellido,' Y ', min2.nombre, min2.apellido);
END.
