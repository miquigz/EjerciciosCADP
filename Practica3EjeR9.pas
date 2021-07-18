{
* 9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.
}
program Ejer9Practica3;

type
	intendente = record
		localidad:string;
		apellido:string;
		cantVotos:integer;
		cantVotosTotal:integer;
	end;

(* ● Lectura del registro ● *)	
procedure leerInte(var inte:intendente);
begin
	with inte do
	begin
	writeln('Ingrese la localidad: ');
	readln(localidad);
	writeln('Ingrese el apellido:  ');
	readln(apellido);
	writeln('Ingrese la cantidad de votos obtenidos:  ');
	readln(cantVotos);
	writeln('Ingrese la cantidad de votos total(en la localidad)  ');
	readln(cantVotosTotal);
	end;
end;

(* ● Mayor cantidad de votos ● *)
procedure mayorCant(inte:intendente; var max:integer; var maxNombre:string);
begin
	if ( inte.cantVotos > max ) then
	begin
		max:= inte.cantVotos;
		maxNombre:= inte.apellido;
	end;
end;

(* ● Mayor porcentaje de votos en relacion al total. ● *)
procedure mayorPorcentaje(inte:intendente; var maxPorcentaje:real; var maxPorcentajeNombre:string);
var
	porcentaje:real;
begin
	porcentaje:= inte.cantVotos/inte.cantVotosTotal * 100;
	if (porcentaje > maxPorcentaje) then
	begin
		maxPorcentaje:= porcentaje;
		maxPorcentajeNombre:= inte.apellido;
	end;
end;

(* ● Programa Principal ● *)
VAR
	inte:intendente;
	max:integer;
	maxPorcentaje:real;
	maxPorcentajeNombre, maxNombre:string;
BEGIN
	maxPorcentaje:= -1;
	maxPorcentajeNombre:= ' ';
	max:=-1;
	maxNombre:= ' '; 
	repeat
		leerInte(inte);
		mayorCant(inte, max, maxNombre);
		mayorPorcentaje(inte, maxPorcentaje, maxPorcentajeNombre);
	until (inte.localidad = 'Zarate');
	writeln(' El intendente con mayor cantidad de votos: ', maxNombre);
	writeln(' El intendente con mayor porcentaje en relacion al total:', maxPorcentajeNombre);
END.
