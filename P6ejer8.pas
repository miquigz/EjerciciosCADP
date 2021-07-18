program P6ejer8;
type
	lista = ^nodo;
	nodo = record
		ele : integer;
		sig : lista;
	end;

(*Insertar ordenado*)
procedure armarNodo(var pri:lista; valor:integer );
var
	nuevo, actual, ant:lista;
begin
	new(nuevo); nuevo^.ele:= valor; nuevo^.sig:= nil;
	if (pri = nil)then
		pri:=nuevo // CASO 1
	else
	begin
		actual:= pri; ant:=pri;
		while ((actual <> nil) and (actual^.ele < nuevo^.ele))do //al salir de este while encuentro la pos
		begin
			ant:= actual;
			actual:= actual^sig; 
		end;
	end;
	if (actual = pri)then
	begin		
		nuevo^.sig:= pri; // CASO 2
		pri:= nuevo;
	end
	else if (actual <> nil) then
	begin
		ant^.sig:= nuevo;  // CASO 3
		nuevo^.sig:= actual;
	end
	else
	begin
		ant^.sig:= nuevo; // CASO 4
		nuevo^.sig:= nil; 
	end;
end;

procedure imprimirLista(pI:lista);//c
var
	aux:lista;
begin
	aux:=pI;
	while ( aux <> nil ) do
	begin
		writeln(aux^.num);
		aux:= aux^.sig;
	end;
end;

(*Programa Principal*)
var
	pri : lista;
	valor : integer;

begin
	pri := nil; // la lista esta vacia.
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do //voy cargando una lista hasta que ingrese el valor 0
	begin
		armarNodo(pri, valor); 
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirLista(pri);
	writeln('Ingrese un valor a incrementar');
	readln(valor);
	incrementarValor(pri, valor);
end.
