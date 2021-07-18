program P7ejer8;
type
	subMotivo = 1..7;
	
	transferencia = record
		numOrigen:integer;
		dniOrigen:integer;
		numDestino:integer;
		dniDestino:integer;
		fecha:integer;
		hora:integer;
		monto:real;
		motivo:subMotivo;
	end;
	
	listaTransferencias = ^nodo;
	nodo = record
		ele:transferencia;
		sig:listaTransferencias;
	end;
	
	montosMotivos = array[subMotivo] of integer;

(*Inicializaci'on del vector montos*)
procedure inicializarVector(var vec:montosMotivos);
var
	i:integer;
begin
	for i:=1 to 7 do
		vec[i]:= 0;
end;
(*Lista de transferencias a terceros (ordenada por *) 
procedure listaTerceros(pri:listaTransferencias; var priTerceros:listaTransferencias);
begin //ordenada por numOrigen, quiere decir q la lista va a estar organizada por cliente en orden.
	while (pri <> nil) do begin
		if (pri^.ele.dniOrigen <> pri^.ele.dniDestino) then
			insertarOrdenado(priTerceros, pri^.ele);
		pri:= pri^.sig;
	end;
end;
(*Recorrer lista de transferencias a terceros*)
procedure recorrerTerceros(priT:listaTransferencias; var vec:montosMotivos);
var // la lista se encuentra ordenada
	cuentaActual:integer;
	montoTotal:real;
begin
	while (priT <> nil) do begin
		cuentaActual:=priT^.ele.numOrigen; montoTotal:=0;
		while ( (priT <> nil) AND (priT^.ele.numOrigen = cuentaActual) ) do begin
			montoTotal:= montoTotal + priT^.ele.monto;
			vec[pri^.ele.motivo]:= vec[pri^.ele.motivo] + pri^.ele.monto;
			priT:= priT^.sig;
		end;
		writeln('El monto total transferido a terceros fue: ', montoTotal:4:2);
	end;
	for i:=1 to 7 do begin
		if (montoTotal > max) then begin
			max:=vec[i];
			maxCod:=i;
		end;
	end;
	writeln('El codigo de motiva que mas transferencias a terceros fue:', maxCod);
end;

VAR
	pri, priT:listaTransferencias;
	vec:montosMotivos;

BEGIN
	inicializarVector(vec);
	pri:= nil;
	cargarLista(pri);
	listaTerceros(pri, priT);
	recorrerTerceros(priT, vec);
END.
