program P6ejer4;
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

function minimo(num:integer; min:integer):integer;
begin
	if (num < min) then
		min:= num;
	minimo:= min; //si no entra al if, qeda el mismo min.
end;

function maximo(num:integer; max:integer):integer;
begin
	if (num > max) then
		max:= num;
	maximo:= max; //si no entra al if, qeda el mismo max.
end;

function multiplos(num:integer; A:integer):integer;
var
	cant:integer;
begin
	if ( (num mod A) = 0) then
		cant:=1
	else
		cant:=0;
	multiplos:= cant;
end;

procedure recorrer(pri:lista; var min:integer; var max:integer; var cant:integer);
var
	num, A:integer;
begin
	min:=999; max:= -99; cant:=0; writeln('Ingrese un valor entero A: '); readln(A);
	while (pri <> nil) do
	begin
		num:= pri^.num;
		min:= minimo(num, min);
		max:= maximo(num, max);
		cant:= cant + multiplos(num, A);
	end;
end;

(*Principal*)
var //b:  10 21 13 48, lista
	pri : lista;
	valor, max, min, cant: integer;

begin
	pri := nil; // la lista esta vacia.
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do //voy cargando una lista hasta que ingres el valor 0
	begin
		armarNodo(pri, valor); 
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirLista(pri);
	recorrer(pri, min, max, cant);
	writeln('----Recorrido---');
	writeln('El valor min de la lista: ', min, 'el valor maximo de la lista: ', max);
	writeln('La cant de multiplos:', cant);
	writeln('Ingrese un valor a incrementar');
	readln(valor);
	incrementarValor(pri, valor);
	writeln('---Lista Incrementada----');
	imprimirLista(pri);
end.
