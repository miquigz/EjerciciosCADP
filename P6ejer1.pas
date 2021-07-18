program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

procedure armarNodo(var punteroInicial:lista; v:integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := punteroInicial;
	punteroInicial := aux;
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

procedure incrementarValor(var pI:lista; valor:integer);//d
begin
	while ( pI <> nil ) do
	begin
		pI^.num:= pI^.num + valor;
		pI:= pI^.sig;
	end;
end;

var //b:  10 21 13 48, lista
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
