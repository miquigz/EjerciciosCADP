program P6ejer7;
type
	espectro = 1..7;
	sonda = record
		nombre:string;
		duracion:integer;//cant meses
		costoCons:real;
		costoMante:real;
		rango:espectro;
	end;
	
	listaSonda = ^nodo;
	nodo = record
		ele:sonda;
		sig:ListaSonda;
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
procedure leerLista(var pri:listaSonda);
var
	nuevo:listaSonda;
	son:sonda;
begin
	repeat
		leerSonda(son);
		new(nuevo); nuevo^.ele:= son; nuevo^.sig:= pri;
		pri:= nuevo;
	until (son.nombre = 'GAIA');
end;

(*Devuelvo si cumple o no cumple los criterios H2020*)
function cumpleCriterios(son:sonda):boolean;
var
	cumple:boolean;
begin
	cumple:= false;
	if ( (son.costoMante < son.costoCons) AND ( son.rango <> 1 ) ) then
		cumple:= true;
	cumpleCriterios:= cumple;
end;

(*Proceso la lista para saber quien Cumple y quien No cumple*)
procedure procesarLista( pri:listaSonda; var priCumple:listaSonda; var priNoCumple:listaSonda);
var
	nuevo:listaSonda;
begin
	new(priCumple); new(priNoCumple); new(nuevo);
	while (pri <> nil)do
	begin
		nuevo^.ele:= pri^.ele;
		if (cumpleCriterios(pri^.ele))then 
		begin
			nuevo^.sig:= priCumple; priCumple:= nuevo;
		end 
		else begin
			nuevo^.sig:= priNoCumple; priNoCumple:= nuevo;
		end;
		pri:= pri^.sig;
	end;
end;

(*Cantidad y Costo total de los proyectos que No seran financiados por H2020*)
procedure procesarNoCumple( priNoCumple:listaSonda; var cantNo:integer; var costoTotal:real);
begin
	cantNo:=0; costoTotal:=0;
	while (priNoCumple <> nil) do
	begin
		cantNo:= cantNo + 1;
		costoTotal:= costoTotal + (priNoCumple^.ele.costoMante + priNoCumple^.ele.costoCons);
		priNoCumple:= priNoCumple^.sig;
	end;
end;

(*Programa Principal*)
VAR
	pri, priCumple, priNoCumple:listaSonda;
	cantNo:integer;
	costoTotal:real;
	
BEGIN
	pri:=nil;
	leerLista(pri);
	procesarLista(pri, priCumple, priNoCumple);
	procesarNoCumple(priNoCumple, cantNo, costoTotal);
END.
