program P6ejer12;
type
	dispositivo = record
		version:integer;
		tam:integer
		ram:integer;
	end;
	
	listaDispositivo = ^nodo;
	nodo = record
		ele:dispositivo;
		sig:listaDispositivo;
	end;
	
(*Lectura del registro*) //no nos piden hacerlo
procedure leerDispo(var dispo:dispositivo);
begin
	writeln('Ingrese version del dispositivo: '); readln(dispo.version);
	writeln('Ingrese tamanio del dispositivo: '); readln(dispo.tam    );
	writeln('Ingrese ram del dispositivo: 	  '); readln(dispo.ram    );
end;
	
(*Lectura de la lista*) //no nos la piden implementar, la hacemos para dsp testear.
procedure cargarLista(var pri:listaDispositivo; var dispo);
var
	nuevo:listaDispositivo;
begin
	new(nuevo); nuevo^.ele:= dispo; nuevo^.sig:= nil;
	while (dispo.version <> 0) do 
	begin
		if (pri = nil) then
			pri:=nuevo
		else
		begin
			nuevo^.sigo:= pri;
			pri:= nuevo;
		end;	
	end;
end;

(*Recorrido de la Lista*)
procedure recorrer(pri:listaDispositivo);
var
	versionActual, cant3GB, totalDispo, tamTotal:integer;
begin
	cant3GB:=0; totalDispo:=0; tamTotal:=0;
	while (pri <> nil) do
	begin
		cantVersion:= 0;
		versionActual:= pri^.ele.version;
		while ( (pri <> nil) AND ( pri^.ele.version = versionActual )) do
		begin
			totalDispo:= totalDispo + 1;
			tamTotal:= pri^.ele.tam + tamTotal;
			cantVersion:= cantVersion +1;
			if( (pri^.ele.ram > 3) AND (pri^.ele.tam <= 5) )then
				cant3GB:= cant3GB + 1;
			pri:= pri^.sig;
		end;
		writeln('La cantidad de elementos para la version: ', versionActual, ' fue: ', cantVersion);
	end;
	writeln('La cantidad de dispositivos con mas de 3 gb y a lo sumo 5 pulgadas: ', cant3GB);
	writeln('El tamanio promedio de todas las pantallas: ', tamTotal/totalDispo);
end;

(*Programa Principal*)
VAR
	pri:listaDispostivo;
	dispo:dispositivo;

BEGIN
	cargarLista(pri, dispo);
	recorrer(pri);
END.
