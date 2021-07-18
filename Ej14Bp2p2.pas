program Ej14BPractica2Parte2;
procedure toneladasHa(tipoSiembra:integer; cantHa:integer; var toneladas:real; var novecientos:boolean); // Calcula las toneladas por HA, dependiendo el tipo de zona. Ademas nos dice si el campo ingresado tiene 900 ha
begin
	if (tipoSiembra = 1) then // verifica las 3 posibilidades.
		toneladas:= cantHa * 6
		else if (tipoSiembra = 2) then
			toneladas:= cantHa * 2.4
				else
					toneladas:= cantHa * 1.4;
	novecientos:= (cantHa = 900);
end;
function rendimiento(toneladas:real):real; // Calcula el rendimiento, con las toneladas y el precio por tonelada.
var
	aux:real; // usamos esta aux, para establecer el rendimiento.
begin
	aux:= toneladas * 320; // 320usd es el precio de la tonelada de soja.
	rendimiento:= aux;
end;
procedure maxMin(nombreCampo:string; var maxRend:real; var minRend:real; var maxNombre:string; var minNombre:string; rendActual:real);
begin // Maximos y minimos de rendimientos, y guardan nombres.
	if (rendActual > maxRend) then
	begin
		maxRend:= rendActual;
		maxNombre:= nombreCampo;
	end;
	if (rendActual < minRend) then
	begin
		minRend:= rendActual;
		minNombre:= nombreCampo;
	end;
end;
procedure tresFebrero(campo:string; var cant10k:integer; rendActual:real);
begin
	if ( (campo = 'Tres de Febrero') AND (rendActual > 10000) ) then
		cant10k:= cant10k+1;
end;
VAR // Programa principal.
	tipoSiembra, cantLeidos, cant10k, cantHa:integer;
	toneladas,rendActual,maxRend, minRend, sumaRend:real;
	campo, maxNombre, minNombre:string;
	novecientos:boolean;
BEGIN
	novecientos:=false;
	sumaRend:= 0;
	minNombre:= 'nada';
	maxNombre:= 'nada';
	maxRend:= -5;
	minRend:= 999;
	cantLeidos:= 0;
	repeat
		writeln('Ingrese la localidad del campo:');
		readln (campo);
		writeln('Ingrese el tipo de zona del campo:');
		readln (tipoSiembra);
		writeln('Ingrese la cantidad de Hectareas sembradas del campo:');
		readln(cantHa);
		toneladasHa(tipoSiembra, cantHa, toneladas, novecientos); //Calcula toneladas por ha(y tipo de siembra), y si HA = 900.
		rendActual:=rendimiento(toneladas); // guardamos el rendimiento de este campo.
		maxMin(campo, maxRend, minRend, maxNombre, minNombre, toneladas); // procedure, que calcula max y min, y nos devuelve el nombre de los campos (max y min).
		tresFebrero(campo, cant10k, rendActual); // Pregunta si la localidad Tres de Febrero tiene un rendimiento mayora  10k usd.
		cantLeidos:= cantLeidos+1; // Variable de conteo, para poder calcular el promedi de rendimiento.
		sumaRend:= rendActual + sumaRend; // variable de suma de TODOS los rendimientos, para calcular promedio.
	until ( (novecientos = true) AND (campo = 'Saladillo') );
	writeln('La cantidad de campos con rendimiento superior a 10k, de la localidad Tres de Febrero: ', cant10k);
	writeln('La localidad del campo con mayor rendimiento economico esperado: ', maxNombre);
	writeln('El rendimiento economico promedio:', (sumaRend / cantLeidos):4:2);
	writeln('La localidad del campo con menor rendimiento economico esperado: ', minNombre);
END.
