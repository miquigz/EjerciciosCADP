program P7ejer2;
type
	subPoliza = 1..6;
	
	cliente = record
		cod:integer;
		dni:integer
		apellido:string;
		nombre:string;
		poliza:subPoliza;
		monto:integer
	end;
	
	listaCliente = ^nodo;
	nodo = record
		ele:cliente;
		sig:listaCliente;
	end;

	preciosPoliza = array[subPoliza] of integer;
	
(*Lectura del registro:*)
procedure leerCliente(var cli:cliente);
begin
	with cli do begin
		writeln('Ingrese codigo del cliente:  '); readln(cod);
		writeln('Ingrese dni del cliente:	  '); readln(dni);
		writeln('Ingrese apellido del cliente:'); readln(apellido);
		writeln('Ingrese nombre del cliente:  '); readln(nombre);
		writeln('Ingrese poliza del cliente:  '); readln(poliza);
		writeln('Ingrese MONto del cliente:   '); readln(monto);
	end;
end;
(*Lectura de la lista:*)
procedure leerLista(var pri:listaCliente);
var
	nuevo:listaCliente;
	cli:cliente;
begin
	repeat
		leerCliente(cli);
		new(nuevo); nuevo^.ele:= cli; nuevo^.sig:=nil;
		if(pri = nil)
			pri:=nuevo
		else
		begin
			nuevo^.sig:= pri;
			pri:=nuevo;
		end; 
	until (cli.cod = 1122);
end;
(*Si tiene dos veces el digito 9*)
function dos9(dni:integer):boolean;
var
	digito, cant9:integer;
begin
	cant9:=0;
	while (dni <> 0) do begin
		digito:= dni mod 10;
		if (digito = 9) then
			cant9:= cant9+1;
		dni:= dni div 10;
	end;
	dos9:= (cant9 >=2);
end;
(*Eliminar Nodo*)
procedure eliminarNodo(var pri:listaCliente; cod:integer);
var
	ant, actual:listaCliente;
begin
	actual:=pri;
	while ((actual<>nil) and (actual^.ele <> cod)) do
	begin
		ant:= actual;
		actual:= actual^.sig;
	end;
	if (actual<>nil) then begin
		if (actual = pri)then //caso 1, el elemento es el primero de la lista.
		begin
			pri:=pri^.sig;
			dispose(actual);
		end
		else begin// caso2, el elemento NO es el primero de la lista.
			ant^.sig:= actual^.sig
			dispose(actual);
		end;
	end;
end;
(*Recorrido de la Lista*)
procedure recorrerLista(pri:listaCliente)
var
	montoTotal:integer;
begin
	while (pri <> nil) do 
	begin
		writeln('El monto total del cliente:', pri^.ele.monto + vec[pri^.ele.poliza]) ; // el vec se dispone.
		if (dos9(pri^.ele.dni)) then begin
			writeln('Apellido:', pri^.ele.apellido, ' Nombre: ', pri^.ele.nombre);
		end;
		pri:=pri^.sig;
	end;
end;
(*Principal*)
VAR
	pri:listaCliente;
	vec:preciosPoliza;
	codi:integer
BEGIN
	cargarVector(vec); //se dispone
	leerLista(pri);
	recorrerLista(pri);
	writeln('Ingrese un codigo existente para eliminar:');
	readln(codi);
	eliminarNodo(pri, codi);
END.
