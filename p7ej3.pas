program p7ejer3;
type
	viaje = record
		num:integer;
		cod:integer;
		dirO:string;
		dirD:string;
		km:real;
	end;
	listaViajes = ^nodo; //viajes mayo, ordenada por cod auto
	nodo = record
		ele:viaje;
		sig:listaViajes;
	end;
	
procedure insertarOrdenado(var pri5:listaViajes; viaj:viaje);
var
	act, ant, nuevo:listaViajes;
begin
	new(nuevo); nuevo^.ele:= viaj;
	act:= pri5; ant:= pri5;
	while (act <> nil) and (act^.ele.cod < viaj.cod) do begin
		ant:= act;
		act:= act^.sig;	
	end;
	if (act = nil) then
		pri5:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;
end;

procedure maximos(var max:real; var max2:real; var maxCod:integer; var maxCod2:integer; kmActual:real; autoActual:integer);
begin
	if (kmActual > max) then begin
		max2:= max;
		max:= kmActual;
		maxCod2:= maxCod;
		maxCod:= autoActual;
	end else if (kmActual > max2) then begin
		max2:= kmActual;
		maxCod2:= autoActual;
	end;
end;
	
procedure recorrerLista(pri:listaViajes; var pri5:listaViajes);
var
	max, max2, kmActual:real;
	maxCod, maxCod2, autoActual:integer;
begin
	max:= -99; max2:= -99;
	
	while (pri <> nil) do begin
		autoActual:= pri^.ele.cod;
		kmActual:=0;
		while (pri <> nil) and (pri^.ele.cod = autoActual) do begin	
			kmActual:= kmActual + pri^.ele.km;
			if (pri^.ele.km > 5) then
				insertarOrdenado(pri5, pri^.ele);			
			pri:= pri^.sig;
		end;
		maximos(max, max2,maxCod,maxCod2, kmActual, autoActual);
	end;
	writeln('Los dos cod de auto con mas km', maxCod, maxCod2);
end;

VAR
	pri, pri5:listaViajes;
	
BEGIN
	pri5:=nil;
	cargarLista(pri); //se dispone
	recorrerLista(pri, pri5);
END.
