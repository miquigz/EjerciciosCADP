program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		ele:integer;
		sig:lista;
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



(*9A Devuelve si esta ordenada*)
function estaOrdenada(pri:lista):boolean;
var
	ordenada:boolean;
	anterior:integer;
begin
	ordenada:= false;
	anterior:= pri;
	while ( (aux <> nil) and (anterior^.ele <= pri^.ele) ) do
	begin
		anterior:= pri;
		pri:= pri^.sig;
	end;
	estaOrdenada:= (pri = nil); //si completo el while (quiere decir que esta ordenada).
end;

(*9B Eliminar*)
procedure eliminarNodos(var pri:lista; valor:integer); ///Lista no ordenada
var
	aux, anterior:lista;
begin
	if (pri<>nil) AND (pri^.ele = valor) then
		pri:=pri^.sig;
	aux:=pri; anterior:=pri;
	while(aux<>nil)do
	begin
		if( aux^.sig:= aux^.sig ) then
		begin
			ant^.sig:=aux^.sig;
			dispose(aux);
			aux:=ant^.sig;
		end
		else
		begin
			aux:=aux;
			aux:=aux^.sig;
		end;
	end;
end;

(*9C Sublista*)
procedure subLista(pri:lista; var priSub:subLista; A:integer; B:integer;);
var
	nuevo:lista;
begin
	while (pri <> nil)do
	begin
		if ( (pri^.ele < B) or (pri^.ele > A)) then
		begin
			new(nuevo); nuevo^.ele:= pri^ele; nuevo^.sig:=nil;
			if (pri = nil) then
				priSub:= nuevo
			else
			begin
				nuevo^.sig:=priSub;
				priSub:=nuevo;
			end;
		end;
	end;
end;

(*9C *)
Procedure GenerarSublista(l:lista;var prisub:lista;menor,mayor:integer);
//hacemos una sublista manteniendo el orden, se conserva la anterior
//Se puede simplificar si la guardamos sin el orden de la primera lista
var
	ultsub,aux:lista;
begin
	ultsub:=nil;
	//buscamos el primero que cumpla
	while(l<>nil)and((l^.num <= menor) or (l^.num >= mayor))do
		l:=l^.sig;
	//asignamos primero y ultimo, en el caso de que se haya encontrado uno que cumpla
	if(l<>nil)then begin
		new(prisub);
		prisub^.num:=l^.num;
		ultsub:=prisub;
		l:=l^.sig;
	end;
	//si la lista sigue, la recorremos agregando
	while(l<>nil)do begin
		if(l^.num > menor)and(l^.num < mayor)then begin
			new(aux);
			aux^.num:=l^.num;
			ultsub^.sig:=aux;
			ultsub:=aux;
		end;
		l:=l^.sig;
	end;
	//En el caso de que haya encontrado alguno, cierra la lista
	if(ultsub<>nil)then
		ultsub^.sig:=nil;
end;

(*9D Sublista ordenada ascendente*)
Procedure GenerarSublistaAscendente(l:lista;var prisub:lista;menor,mayor:integer);
//se optimiza para el caso de una lista ordenada por el mismo dato que evaluamos
//Se mantiene la lista anterior
//Se conserva el orden
var
	ultsub,aux:lista;
begin
	ultsub:=nil;
	//buscamos el primer mayor al menor
	while(l<>nil)and(l^.num <= menor)do
		l:=l^.sig;
	//asignamos primero y ultimo, en el caso de que se haya encontrado al primero
	if((l<>nil)and(l^.num > menor)and(l^.num < mayor))then begin
		new(prisub);
		prisub^.num:=l^.num;
		ultsub:=prisub;
		l:=l^.sig;
	end;
	//buscamos al primero mayor o igual al mayor
	while(l <> nil)and(l^.num < mayor)do begin
		new(aux);
		aux^.num:=l^.num;
		ultsub^.sig:=aux;
		ultsub:=aux;
		l:=l^.sig;
	end;
	ultsub^.sig:=nil;
end;

(*9E sublista ordenada descendente*)
Procedure GenerarSublistaDescendente(l:lista;var prisub:lista;menor,mayor:integer);
//se optimiza para el caso de una lista ordenada
var
	ultsub,aux:lista;
begin
	ultsub:=nil;
	//buscamos el primer menor al mayor
	while(l<>nil)and(l^.num >= mayor)do
		l:=l^.sig;
	//asignamos primero y ultimo, en el caso de que se haya encontrado al primero
	if((l<>nil)and(l^.num > menor)and(l^.num < mayor))then begin
		new(prisub);
		prisub^.num:=l^.num;
		ultsub:=prisub;
		l:=l^.sig;
	end;
	//buscamos al primero menor o igual al menor
	while(l <> nil)and(l^.num > menor)do begin
		new(aux);
		aux^.num:=l^.num;
		ultsub^.sig:=aux;
		ultsub:=aux;
		l:=l^.sig;
	end;
	ultsub^.sig:=nil;
end;

(*Programa PRINCIPAL*)
VAR 
	pri:lista;
	valor:integer;

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
