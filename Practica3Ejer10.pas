{
La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'.
}
program Ejercicio10Practica3;

type 
	especie = record
		nombre:string;
		tiempoVida:integer;
		tipo:string;
		clima:string;
		pais:string;
	end;

procedure leerPlanta(var planta:especie);
begin
	with planta do
		writeln('Ingrese tipo de la especie:');
		readln(planta.tipo);
		writeln('Ingrese nombre de la especie:');
		readln(planta.nombre);
		writeln('Ingrese tiempo promedio de vida:');
		readln(planta.tiempoVida);
		writeln('Ingrese el clima de la especie:');
		readln(planta.clima);
		writeln('Ingrese pais de la especie:');
		readln(planta.pais)
	end;
end;

(*Conteo de plantas, segun el tipo*)
procedure contadorPlanta(planta:especie; var cantActual:integer; var tipoActual:string);
begin
	if ( (planta.tipo = tipoActual) ) then
	begin
		cantActual:= cantActual + 1;
	end;
end;

(*El tipo de planta, con menor cantidad de plantas*)
procedure menorPlanta(planta:especie; cantActual:integer; tipoActual:string; var minCant:integer; var minNombre:string;);
begin
	if (cantActual < minCant) then
	begin
		minCant:= cantActual;
		minNombre:= tipoActual;
	end;
end;

	//● El tiempo promedio de vida de las plantas de cada tipo.
	//● El nombre científico de las dos plantas más longevas.
	//● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
	//● El nombre de la planta que se encuentra en más países.
	
VAR
	tipoActual, paisActual, minNombre:string;
	planta:especie;
	minCant,cantActual:integer;
	
BEGIN
	minCant:= 999;
	minNombre:= ' ';
	while ( planta.pais <> 'zzz' ) do
	begin
		cantActual:= 0;
		tipoActual:= planta.tipo;
		paisActual:= planta.pais;
		while ( (planta.tipo = tipoActual) AND (planta.pais <> 'zzz') ) do
		begin
			contadorPlanta(planta,cantActual,tipoActual);
			while ( (planta.pais = paisActual) AND (planta.tipo = tipoActual) AND (planta.pais <> 'zzz') ) do
			begin
				leer()
			end;
		end;
		menorPlanta(planta, cantActual, tipoActual, minCant, minNombre);
	end;
END.
