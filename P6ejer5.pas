program P6ejer5;
type
	producto = record
		cod:integer;
		des:string; //descripcion
		stockAnual:integer;
		stockActual:integer;
		stockMin:integer;
		precio:real;
	end;
	
	superpermercado = ^nodo;
	
	nodo = record
		ele:producto;
		sig:superpermercado;
	end;

(*Lectura registro*)
procedure lecturaSuper(var prod:producto);
begin
	writeln('Ingrese cod de producto:'); readln(prod.cod);
	if (prod.cod <> -1) then
	begin
		writeln('Ingrese descripcion del producto: '); readln(prod.des);
		writeln('Ingrese stock Anual del producto: '); readln(prod.stockAnual);
		writeln('Ingrese stockActual del producto: '); readln(prod.stockActual);
		writeln('Ingrese stock   Min del producto: '); readln(prod.stockMin);
		writeln('Ingrese precio      del producto: '); readln(prod.precio);
	end;
end;

(*Lectura nodo Lista*)
procedure lecturaLista(var pri:superpermercado; var prod:producto);
var
	nuevo: superpermercado;
begin
	lecturaSuper(prod);
	while (prod.cod <> -1) do
	begin
		new(nuevo); nuevo^.ele:= prod; nuevo^.sig:= pri;
		pri:= nuevo;
		lecturaSuper(prod);
	end;
end;

(*Conteo de productos por debajo del stock minimo*)
function cantDebajo(stockActual:integer; stockMinimo:integer):integer;
var
	cant:integer;
begin
	cant:=0;
	if (stockActual < stockMinimo)then
		cant:=1;
	cantDebajo:= cant;
end;

(*Si se cumple devuelvo la descripcion, sino devuelvo: - - -*)
function descripcionPares(num:integer; des:string):string;
var
	descripcion:string;
	digito, cant:integer;
begin
	cant:=0;
	while (num <> 0) do
	begin
		digito:= num mod 10;
		if ( (digito mod 2)=0) then
			cant:= cant +1;
		num:=num div 10;
	end;
	if (cant >= 3) then
		descripcion:= des
	else
		descripcion:= ' - - - ';
	descripcionPares:= descripcion;
end;

(*Los 2 productos mas economicos*)
procedure economicos(var min:real; var min2:real; var codMin:integer; var codMin2:integer; precio:real; cod:integer);
begin
	if (precio < min) then
	begin
		min2:= min;
		min:= precio;
		codMin2:= codMin;
		codMin:= cod;
	end
	else if (precio < min2) then
	begin
		min2:= precio;
		codMin2:= cod;
	end;
end;

(*Recorrido de la lista*)
procedure recorrerLista(var pri:superpermercado; var min:real; var min2:real; var codMin:integer; var codMin2:integer);
var
	cant, cantEle:integer;
begin
	cant:=0; min:=999; min2:=999; cantEle:=0;
	while (pri <> nil) do
	begin
		cant:= cantDebajo(pri^.ele.stockActual, pri^.ele.stockMin); cantEle:= cantEle + 1;
		economicos(min, min2, codMin, codMin2, pri^.ele.precio, pri^.ele.cod);
		pri:= pri^.sig;
		writeln('Descripcion de los productos con codigo con almenos 3 digitos pares: ', descripcionPares(pri^.ele.cod, pri^.ele.des));
	end;
	writeln('Porcentaje de productos con stock actual por debajo de su stock minimo: ', cant / cantEle * 100);
	writeln('El codigo del producto mas economico: ', codMin);
	writeln('El codigo del segundo producto mas economico: ', codMin2);
end;

VAR
	pri:superpermercado;
	prod:producto;
	codMin, codMin2:integer;
	min, min2:real;

BEGIN
	new(pri);
	lecturaLista(pri, prod);
	recorrerLista(pri, min, min2, codMin, codMin2);
END.
