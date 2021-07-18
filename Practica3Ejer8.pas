program P3Ejercicio8;
type
	docente = record
		DNI:integer;
		nombre:string;
		apellido:string;
		email:string;
	end;
	proyecto = record
		cod:integer;
		titulo:string;
		doc:docente;
		cantAlumnos:integer;
		nombreLocalidad:string;
		nombreEscuela:string;
	end;

(*Lectura de los datos del Proyecto*)
procedure leerProyecto(var proy:proyecto);
begin
	with proy do
	begin
		writeln('Ingrese codigo del proyecto: ');
		readln(cod);
		if (cod <> -1) then
		begin
			writeln('Ingrese el titulo del proyecto: ');
			readln(titulo);
			writeln('Ingrese el DNI del docente:');
			readln(doc.DNI);
			writeln('Ingrese el apellido del docente: ');
			readln(doc.apellido);
			writeln('Ingrese el nombre del docente: ');
			readln(doc.nombre);
			writeln('Ingrese el email del docente:');
			readln(doc.email);
			writeln('Ingrese la cantidad de alumnos: ');
			readln(cantAlumnos);
			writeln('Ingrese el nombre de la localidad: ');
			readln(nombreLocalidad);
			writeln('Ingrese el nombre de la escuela: ');
			readln(nombreEscuela);
		end;
	end;
end;

(*Conteo de escuelas por localidad*)
procedure escuelasLocalidad(proy:proyecto; localidadActual:string; var cantLocalidad:integer);
begin
	if ( proy.nombreLocalidad = localidadActual ) then
		cantLocalidad:= cantLocalidad + 1;
end;

(*Las dos escuelas con mayor cant de Alumnos*)
procedure maxAlumnos(proy:proyecto; var max:integer; var max2:integer; var maxNombre:string; var max2Nombre:string; escuelaActual:string);
begin
	if ( proy.cod <> 0 ) then
	begin
		if ( proy.cantAlumnos > max ) then
		begin
			max2:= max;
			max2Nombre:= maxNombre;
			max:= proy.cantAlumnos;
			maxNombre:= proy.nombreEscuela;
		end
		else if ( proy.cantAlumnos > max2 ) then
		begin
			max2:= proy.cantAlumnos;
			max2Nombre:= proy.nombreEscuela;
		end;
	end;
end;

(*cod misma cant dig impar/par, localidad Daireaux*)
procedure mismosParesImpares(proy:proyecto);
var
	dig, codigo, cantPar,cantImpar:integer;
begin
	cantPar:= 0;
	cantImpar:=0;
	codigo:= proy.cod;
	if( proy.nombreLocalidad = 'Daireaux' ) then
	begin
		while (codigo <> 0) do
		begin
			dig:= codigo MOD 10;
			if ( ( dig mod 2 ) = 0) then
				cantPar:= cantPar + 1
			else
				cantImpar:= cantImpar + 1;
			codigo:= codigo DIV 10;
		end;
		if (cantImpar = cantPar)then
			writeln('El proyecto:  ',proy.titulo, '  de la localidad Daireaux. TIENE codigo con misma cantidad de digitos pares/impares!!')
		else
			writeln('No es de la localidad Daireaux o en el codigo del proyecto no se cumple la condicion de mismos digitos impares-pares');
	end;
end;

(*PROGRAMA PRINCIPAL*)
VAR
	proy:proyecto;
	max,max2,cantEsc, cantLocalidad:integer;
	escuelaActual, localidadActual:string;
	maxNombre, max2Nombre:string;
// La informacion se ingresa ordenada por LOCALIDAD, y para cada Localidad se ingresa ordenada la ESCUELA.
BEGIN 
	cantLocalidad:=0;
	cantEsc:=0;
	max:=-5;
	max2:=-1;
	maxNombre:=' ';
	max2Nombre:=' ';
	leerProyecto(proy);
	while ( proy.cod <> -1 ) do
	begin
		localidadActual:= proy.nombreLocalidad;
		while ((proy.nombreLocalidad = localidadActual) AND (proy.cod <> -1)) do
		begin
			escuelaActual:= proy.nombreEscuela;
			cantEsc:= cantEsc + 1;
			mismosParesImpares(proy);
			while ( (proy.nombreEscuela = escuelaActual) AND ((proy.nombreLocalidad = localidadActual) AND (proy.cod <> -1))) do // while de ESCUELAS con mismo proyecto
			begin
				escuelasLocalidad(proy, localidadActual, cantLocalidad);
				maxAlumnos(proy, max, max2, maxNombre, max2Nombre, escuelaActual);
				leerProyecto(proy);
			end;
			writeln('La Cantidad de escuelas por la localidad:', localidadActual, 'es: ', cantLocalidad);
			cantLocalidad:=0;
		end;
		
	end;
	writeln('Nombres de las dos escuelas con mayor cantidad de alumnos participantes', maxNombre, max2Nombre);
	writeln('Cantidad total de escuelas que participan:', cantEsc);
END.
