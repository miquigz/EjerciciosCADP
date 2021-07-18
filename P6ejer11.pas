program untitled;
type 
	egresado = record
		legajo:integer;
		nombre:string;
		apellido:string;
		promedio:real;
	end;
	
	listaEgresados = ^nodo;
	nodo = record
		ele:egresado;
		sig:^listaEgresados;
	end;

	los10 = array[1..10] of egresado;

(*Lectura registro*)
procedure leerEgre(var egre:egresado);
begin
	with egre do begin
		writeln('Ingrese legajo de egresado: '); readln(legajo);
		if (legajo <> 0) then begin
		writeln('Ingrese legajo de nombre  : '); readln(nombre);
		writeln('Ingrese legajo de apellido: '); readln(apellido);
		writeln('Ingrese legajo de promedio: '); readln(promedio);
		end;
	end;
end;

(*Lectura egresados*)
procedure leerEgresados(var pri:listaEgresados; var egre:egresado);
var
	nuevo:listaEgresados;
begin
	leerEgre(egre);
	while (egre.legajo <> 0) do 
	begin
		new(nuevo); nuevo^.ele:= egre; nuevo^.sig:= nil;
		if ( pri = nil ) then
			pri:= nuevo
		else begin
			nuevo^.sig:= pri;
			pri:=nuevo;
		end;
		leerEgre(egre);
	end;
end;

(*Inforamr apellido y legajo de los egresados que reciben el premio*)
procedure informar10(vec:los10);
var
	i:integer;
begin
	if (vec[10].promedio > vec[1].promedio) then
	begin
		for i:=10 downto 1 do
		begin
			writeln('Promedio, apellido y legajo:', vec[i].promedio, ' ', vec[i].apellido, ' ', vec[i].legajo);
		end;
	end
	else if (vec[1].promedio > vec[10].promedio) then
	begin
		for i:=1 to 10 do
		begin
			writeln('Promedio, apellido y legajo:', vec[i].promedio, ' ', vec[i].apellido, ' ', vec[i].legajo);
		end;
	end;
end;


(*Programa Principal*)
VAR
	egre:egresado;
	pri:listaEgresados;
	vec:los10;
	
BEGIN
	leerEgresados(pri, egre);
	calcular10(pri, egre, vec); //
	informar10(vec);
END.

