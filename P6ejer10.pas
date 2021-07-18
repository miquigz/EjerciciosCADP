program P6ejer10;
type	
	cliente = record
		dni:integer;
		num:integer;
	end;
	
	listaCliente = ^nodo;
	nodo = record
		ele:cliente;
		sig:ListaCliente;
	end;
	
(*Modulo que recibe al cliente*)
procedure recibirCliente(var pri, ult:listaCliente; dni:integer);
var
	nuevo:listaCliente;
	num:integer;
begin
	new(nuevo); nuevo^.ele.dni:= dni; nuevo^.sig:= nil; num:=0;
	if ( pri = nil ) then
	begin
		writeln('Ingrese un num para asignar: ');
		readln(num);
		nuevo^.ele.num:= num;
		pri:= nuevo;
		ult:= nuevo;
	end
	else
	begin
		ult^.sig:= nuevo;
		nuevo^.ele.num:= nuevo^.ele.num + 1;
		ult:= nuevo;
	end;
end;

(*Atender cliente*)
procedure atenderCliente(var pri:listaCliente; var atendido:cliente);
var
	numero:integer
	aux:listaCliente;
begin
	aux:= pri;
	while ( (aux <> nil) and (aux^.ele.num < num) ) do
		aux:=aux^.sig;
	if (num = aux^.ele.num)then
	begin
		atendido:= aux^.ele;
		writeln('El cliente que esta siendo atendido ahora mismo es: ', atendido.num,' , dni: ', atendido.dni);
		eliminarNodo(pri, aux^.ele.num);
	end
	else
		writeln('No hay clientes en lista de espera, o no hay clientes con el numero asignado');
end;

(*Modulo para eliminar un nodo*)
procedure eliminarNodo(var pri:listaCliente; numAtendido:integer);
var //No hay repetidos, ya que los numeros de los clientes van de 1 en 1. esto borra el num atendido.
	actual, ant:listaCliente;
begin
	actual:= pri;
	while ((actual <> nil) AND (actual^.ele.num <> numAtendido)) do
	begin
		ant:=actual; actual:= actual^.sig;		
	end; //salgo del while si encontre el valor, o si termine la lista sin encontrarlo
	if (actual <> nil) then
	begin
		if (actual = pri) then
			pri:= pri^.sig; //generalmente va a pasar esto, ya que los numeros de los clientes son en manera ascendente.
		else
			ant^.sig:= actual^.sig;
		dispose(actual);
	end;
end;

(*Modulo de carga de clientes: *)
procedure cargaCliente(var pri:listaCliente);
var
	dni:integer;
begin
	writeln('Ingrese dni del cliente: '); readln(dni);
	while ( dni <> 0 ) do
	begin
		recibirCliente(pri, dni);
		writeln('Ingrese dni del cliente: '); readln(dni);
	end;
end;

(**)
VAR
	pri, ult:listaCliente;
	atendido:cliente;

BEGIN
	cargaCliente(pri, ult);
	atenderCliente(pri, atendido);
END.
