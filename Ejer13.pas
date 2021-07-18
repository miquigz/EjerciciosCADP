program Ejer13Practica4part1;
const
	dimF = 100;
type
	temperaturas = array [1..dimF] of real; // Muy importante declarar ANTES, que anios.
	anios = array[1..50] of temperaturas;
	
procedure cargarDatos(var vec:anios);
var
	i,j:integer;
begin
	for i:=1 to 50 do // 1 a 50 (anios)
		for j:=1 to 100 do // 1 a 100 ( puntos de temperatura )
			readln(vec[i][j]);
end;

(*Calcular max prom y max anio de temp*)
procedure calcular(vec:anios; var maxTempAnio:integer; var maxPromAnio:integer);
var
	i, j:integer;
	max:real;
	maxProm ,promActual, totalPorAnio:real;
begin
	max:= -555; maxProm:= -555;
	for i:=1 to 50 do
	begin
		totalPorAnio:= 0;
		promActual:=0;
		for j:=1 to 100 do
		begin
			if (vec[i][j] > max ) then // si un punto en un anio cualesquiera supera el max, guardo el anio.
			begin
				max:= vec[i][j];
				maxTempAnio:= i; // guardamos anio
			end;
			totalPorAnio:= totalPorAnio + vec[i][j]; // sumo las temperatudas para sacar prom
		end;
		promActual:= totalPorAnio / 100;
		if (promActual > maxProm) then
		begin
			maxProm:= promActual;
			maxPromAnio:= i; // guardamos anio
		end;
	end;
end;

(*Programa Principal*)
VAR
	vec:anios;
	maxPromAnio , maxTempAnio:integer;
BEGIN
	maxPromAnio:=0; maxTempAnio:=0;
	cargarDatos(vec);
	calcular(vec, maxTempAnio, maxPromAnio);
END.
