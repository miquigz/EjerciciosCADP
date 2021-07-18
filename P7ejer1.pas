program P7ejer1;
type
	sActuacion= 1..5;
	persona = record
		dni:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		rol:sActuacion;
	end;
	listaCasting = ^nodo;
	nodo = record
		ele:persona;
		sig:listaCasting;
	end;
	contadorCod = array[sActuacion]of integer;
	
(*Leer registro*)
procedure leerRegistro(var per:persona);
begin
	with per do
	begin
		writeln('Ingrese DNI de la persona que asiste al casting:	   '); readln(dni);
		writeln('Ingrese apellido de la persona que asiste al casting: '); readln(apellido);
		writeln('Ingrese nombre de la persona que asiste al casting:   '); readln(nombre);
		writeln('Ingrese edad de la persona que asiste al casting:     '); readln(edad);
		writeln('Ingrese codigo de la persona que asiste al casting:   '); readln(cod);
	end;
end;
(*Leer lista*)
procedure leerLista(var pri:lista;);
var
	nuevo:listaCasting;
	per:persona;
begin
	repeat
		leerRegistro(per);
		new(nuevo); nuevo^.ele:= per; nuevo^.ele.sig:=nil;
		if (pri = nil)then
			pri:=nuevo
		else begin
			nuevo^.sig:= pri;
			pri:=nuevo;
		end;
	until(per.dni = 33555444);
end;
(*Si el dni tiene mas dig pares:*)
function masPar(num:integer):boolean;
var
	digito, par, impar:integer;
begin
	par:=0; impar:=0;
	while (num <> 0) do
	begin
		digito:= num mod 10;
		if ((digito mod 2)=0)then
			par:= par + 1
		else
			impar:= impar + 1;
		num:= num div 10;
	end;
	masPar:= (par > impar);
end;
(*Inicializar Vector*)
procedure inicializarVec(var vec:contadorCod);
var
	i:integer;
begin
	for i:1 to 5 do
		vec[i]:=0;
end;
(*Los 2 cod Maximos, del vector*)
procedure dosMax( vec:contadorCod; var maxRol:integer; var maxRol2:integer);
var
	i, max, max2:integer;
begin
	max:= -99; max2:=-99; maxRol:=0; maxRol2:=0;
	for i:=1 to 5 do
	begin
		if (vec[i] > max)then begin
			max2:= max;
			max:=vec[i];
			maxRol2:=maxRol;
			maxRol:= i;
		end else if (vec[i] > max2) then begin
			max2:= vec[i];
			maxRol2:=i;
		end;
	end;
end;
(*Recorrido de la Lista*)
procedure recorrer(pri:listaCasting; var vec:contadorCod);
var
	cantDNI, maxRol, maxRol2:integer
	
begin
	while (pri <> nil)do
	begin
		if (masPar(pri^.ele.dni))then
			cantDNI:= cantDNI+1;
		vec[pri^.ele.cod]:= vec[pri^.ele.cod] + 1;
		pri:=pri^.sig;
	end;
	dosMax(vec, maxRol, maxRol2);
	informar(cantDNI, maxRol, maxRol2);
end;
(*Imprimir info*)
procedure informar(cantDNI:integer; maxRol:integer; maxRol2:integer); 
begin
	writeln('La cantidad de DNI con mas dig pares:    ', cantDNI);
	writeln('El codigo de genero mas elegido fue:      ', maxRol);
	writeln('El 2do codigo de genero mas elegido fue: ', maxRol2);	
end;
(*Buscar DNI*)
function buscar(pri:listaCasting; dni:integer):boolean;
var
	encontre:boolean;
begin
	encontre:=false
	while ( (pri <> nil) AND (encontre = false) ) do
	begin
		if (pri^.ele.dni = dni) then
			encontre= true
		else
			pri:+ pri^.sig;
	end;
	buscar:=encontre;
end;
(*Eliminar DNI de la lista*)
procedure eliminarNodo(var pri:listaCasting; dni:integer);
var
	actual, ant:listaCasting;
begin
	actual:=pri;
	while ((actual <> nil)and(actual^.ele.dni <> dni)) do
	begin
		ant:=actual;
		actual:= actual^.sig;
	end;
	if (actual <> nil) then
	begin
		if (actual = pri)then
		begin
			pri:= pri^.sig; dispose(actual);
		end
		else
		begin
			ant^.sig:= actual^.sig;
			dispose(actual);
		end;
	end;
end;
(*Principal*)
VAR
	vec:contadorCod;
	num:integer;

BEGIN
	inicializarVec(vec);
	recorrer(pri, vec);
	wrtieln('Ingrese un dni a eliminar de la lista:') readln(num);
	if (buscar(num)) then
		eliminarNodo(pri, num);
END.
