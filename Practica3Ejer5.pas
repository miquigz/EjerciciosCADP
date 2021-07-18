program Ejercicio5Practica3; // La informacion se ingresa ordenada por marca.

type
	autos = record
		marca:string;
		modelo:string;
		precio:real;
	end;

procedure leer (var info:autos); // procedimiento de leer.
begin
	with info do
	begin
		writeln('Ingresar Marca de auto:');
		readln(marca); // luego de leer la marca, pregunto si es distinta de ZZZ
		if (marca <> 'ZZZ') then
		begin
			writeln('Ingresar modelo de auto:');
			readln(modelo);
			writeln('Ingresar precio de auto:');
			readln(precio);
		end;
	end;
end;

procedure masCaro(info:autos; var modeloCaro:string; var marcaCaro:string; var max:real);
begin
	if (info.precio > max) then
	begin
		max:= info.precio;
		modeloCaro:= info.modelo;
		marcaCaro:= info.marca;
	end;
end;

VAR
	info:autos;
	marcaActual ,modeloCaro, marcaCaro:string;
	promedio, max:real;
	cantidad:integer;
BEGIN
	modeloCaro:= ' ';
	marcaCaro:= ' ';
	max:= -5;
	leer(info); // Leo por primera vez.
	while ( info.marca <> 'ZZZ') do
	begin
		marcaActual:= info.marca;
		promedio:= 0;
		cantidad:= 0;
		while (marcaActual = info.marca) do // Si la marca es igual al primero, este while va a seguir.
		begin
			cantidad:= cantidad+1;
			promedio:= promedio + info.precio;
			masCaro(info, modeloCaro, marcaCaro, max);
			leer(info); // Leo nuevamente (Y no salgo de este while, hasta que no deje de cumplirse.)
		end;
		promedio:= promedio / cantidad;
		writeln('Promedio de la marca anterior es: ', promedio:4:2); // Si sali del while que tiene la misma marca, va a repetirse el while, 
	end;  //por ende no hace falta repetir la carga de datos.
	writeln('Marca y modelo del auto mas caro: ', modeloCaro, marcaCaro);
END.

