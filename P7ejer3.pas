program P7ejer3;
type
	viajesMayo = record
		numViaje:integer;
		codAuto:integer;
		dirOrigen:string;
		dirDestino:string;
		km:integer;
	end;

	listaViajes = ^nodo;
	nodo = record
		ele:viajesMayo;
		sig:listaViajes;
	end;

(*Se dispone*)	
procedure cargarLista(pri:listaViajes);

(*Generar nueva lista*)
procedure generarLista(var pri5:listaViajes; viaje:viajesMayo);
var
	nuevo:listaMas5;
begin
	new(nuevo); nuevo^.ele:= viaje; nuevo^.sig:=nil;
	if (pri5 = nil )then begin
		pri5:= nuevo
	else begin
		nuevo^.sig;= pri5;
		pri:= nuevo;
	end;
end;
(*Recorrido de la Lista*)
procedure recorrer(pri:listaViajes; var pri5:listaViajes);
var
	codActual, kmActual, max, max2, maxCod, maxCod2:integer;
begin
	max:= -99; max2:= -99; maxCod:= 0; maxCod2:= 0;
	while ( pri <> nil ) do
	begin
		codActual:= pri^.ele.cod; kmActual:=0;
		while ((pri <> nil) and (pri^.ele.codAuto = codActual)) do
		begin
			kmActual:= kmActual + pri^.ele.km;
			if (pri^.ele.km > 5) then
				generarLista(pri5 ,pri^.ele);
			pri:= pri^.sig;
		end;		
		if (kmActual > max) then begin
			max2:= max;
			max:= kmActual;
			maxCod2:= maxCod;
			maxCod:= codActual;
		end else if (kmActual > max2) then begin
			max2:= kmActual;
			maxCod2:= codActual;
		end;
	end;
end;

(*Programa Principal*)
VAR
	pri, pri5:listaViajes;
BEGIN
	pri:= nil;
	cargarLista(pri);//se dispone.
	recorrer(pri, pri5);
END.
