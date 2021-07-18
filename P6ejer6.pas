program P6ejer6;
type
	espectro = 1..7;
	sonda = record
		nombre:string;
		duracion:integer;//cant meses
		costoCons:integer;
		costoMante:integer;
		rango:espectro;
	end;
	espectros = array[1..7] of integer;
	
	listaSonda = ^nodo;
	nodo = record
		ele:sonda;
		sig:ListaSonda;
	end;
	
	listaNombres = ^nodo2;
	nodo2 = record
		ele:string;
		sig:listaNombres;
	end;
	
(*Lectura de registro*)
procedure leerSonda(var son:sonda);
begin
	with son do
	begin
		writeln('Ingrese nombre de la sonda: '); readln(nombre);
		writeln('Ingrese duracion de la sonda: '); readln(duracion);
		writeln('Ingrese costo de  Construccion de la sonda: '); readln(costoCons);
		writeln('Ingrese costo de Mantenimienot de la sonda: '); readln(costoMante);
		writeln('Ingrese rango de la sonda: '); readln(rango);
	end;
end;

(*Lectura de la lista*)
procedure leerLista(var pri:listaSonda; var son:sonda);
var
	nuevo:listaSonda;
begin
	repeat
		leerSonda(son);
		new(nuevo); nuevo^.ele:= son; nuevo^.sig:= pri;
		pri:= nuevo;
	until (son.nombre = 'GAIA');
end;

(*Sonda mas costosa, en rel a su costo total*)
procedure sondaCostosa(var max:integer; var maxNombre:string; costoMante:integer; costoCons:integer; nombre:string);
var
	costoTotal:integer;
begin
	costoTotal:= costoCons + costoMante;
	if (costoTotal > max) then
	begin
		max:= costoTotal;
		maxNombre:= nombre;
	end;
end;

(*Inicializo vector contador de espectros*)
procedure incializarVec(var vec:espectros);
var
	i:integer;
begin
	for i:=1 to 7 do
		vec[i]:= 0;
end;

(*Conteo de espectros en el que se realizar'a estudios*)
procedure cantSondas(var vec:espectros; rango:espectro);
begin
	vec[rango]:= vec[rango] + 1;
end;

(*Conteo de sondas que superan la duracion promedio*)
procedure cantSonda(var cantSupera:integer; duracion:integer; prom:real);
begin
	if (duracion > prom) then
		cantSupera:= cantSupera + 1;
end;

(*Nombre de las sondas que superan el prom de costo de construccion*)
procedure nombreSondas(var priNombre:listaNombres; cosCon:integer; nombre:string; prom:real);
var
	nuevo:listaNombres;
begin
	if (cosCon > prom) then
	begin
		new(nuevo); nuevo^.ele:=nombre; nuevo^.sig:= priNombre;
		priNombre:= nuevo;
	end;
end;

(*Imprimir informacion*)
procedure imprimirInfo(vec:espectros; priNombre:listaNombres; cantSupera:integer; maxNombre:string);
var
	i:integer;
begin
	writeln('El nombre de la sonda mas costosa es:', maxNombre);
	writeln('La cantidad de sondas que realizaran estudios en cada rango del espectro: ');
	for i:=1 to 7 do
		writeln('El rango del espectro: ',i, 'realizara la cantidad de sondas:', vec[i]);
	writeln('La cantidad de sondas que cuya duracion supera la duracion promedio: ', cantSupera);
	writeln('El nombre de las sondas cuyo costo de construccion supera el costo promedio: ');
	while (priNombre <> nil) do
	begin
		writeln(priNombre^.ele);
		priNombre:= priNombre^.sig;
	end;
end;

(*Recorrido de la Lista*)
procedure recorridoLista(pri:listaSonda; var priNombre:listaNombres; var vec:espectros);
var
	cantTotal, sumaTotal , sumaConst, cantSupera, max:integer;
	promDuracion, promConstruccion:real;
	maxNombre:string;
begin
	cantTotal:=0; cantSupera:=0; sumaTotal:=0; sumaConst:=0;
	while (pri <> nil) do
	begin
		sondaCostosa(max, maxNombre, pri^.ele.costoMante, pri^.ele.costoCons, pri^.ele.nombre);
		cantSondas(vec, pri^.ele.rango);
		cantTotal:= cantTotal + 1;
		sumaTotal:= sumaTotal + pri^.ele.duracion;
		sumaConst:= sumaConst + pri^.ele.costoCons;
		pri:= pri^.sig;
	end;
	promDuracion:= sumaTotal / cantTotal;
	promConstruccion:= sumaConst / cantTotal;
	while (pri <> nil) do begin
		cantSonda(cantSupera, pri^.ele.duracion, promDuracion);
		nombreSondas(priNombre, pri^.ele.costoCons, pri^.ele.nombre, promConstruccion);
		pri:= pri^.sig;
	end;
	imprimirInfo(vec, priNombre, cantSupera, maxNombre);
end;

(*Programa Principal*)
VAR
	pri:ListaSonda;
	priNombre:listaNombres;
	son:sonda;
	vec:espectros;
	
BEGIN
	new(pri);
	leerLista(pri, son);
	recorridoLista(pri, priNombre, vec);
END.
