program Ej14Practica2Parte2;
function toneladasHa(tipoSiembra:integer):real; // Calcula las toneladas por HA, dependiendo el tipo de zona.
var
	cantHa:integer; // esta variable se lee.
	aux:real; // la usamos de aux, para realizar operaciones, y luego establecerla en la function(toneladas).
begin
	readln(cantHa); // Cantidad de hectareas.
	if (tipoSiembra = 1) then // verifica las 3 posibilidades.
		aux:= cantHa * 6
		else if (tipoSiembra = 2) then
			aux:= cantHa * 2.4
				else
					aux:= cantHa * 1.4;
	toneladasHa:= aux ; // el total de toneladas final.
end;
function rendimiento(toneladas:real):real; // Calcula el rendimiento, con las toneladas y el precio por tonelada.
var
	precioTonelada:integer; // esta variable se lee.
	aux:real; // usamos esta aux, para establecer el rendimiento.
begin
	readln(precioTonelada);
	aux:= toneladas * precioTonelada;
	rendimiento:= aux;
end;
VAR // Programa principal.
	tipoSiembra:integer; //
	toneladas, rendimientoTotal:real;
BEGIN
	writeln('Ingresar tipo zona de siembra: ');
	readln(tipoSiembra);
	writeln('Ingresar la cantidad de hectareas:');
	toneladas:= toneladasHa(tipoSiembra);
	writeln('Ingrese el precio por tonelada de soja en USD');
	rendimientoTotal:= rendimiento(toneladas);
	writeln('Rendimiento economico total: ', rendimientoTotal:4:2, '$');
END.
