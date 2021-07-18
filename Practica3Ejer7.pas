program Practica3Ejer7;

type
	string7 = string[7]; // Como son abreviaturas, hacemos de maximo 7 letras
	centro = record // Registro CENTRO.
		nombre: string7;
		uniPert:string;
		cantInv: integer;
		cantBecarios:integer;
	end;

procedure leerCentro(var cen:centro);
begin
	writeln('Ingresar nombre del Centro de investigacion: ');
	readln(cen.nombre);
	writeln('Ingresar la universidad a la que pertenece el centro: ');
	readln(cen.uniPert);
	writeln('Ingresar cantidad de investigadores: ');
	readln(cen.cantInv);
	if ( cen.cantInv <> 0 ) then
	begin
		writeln('Ingresar cantidad de becarios: ');
		readln(cen.cantBecarios);
	end;
end;

(*Calculo el total de centros para cada Universidad.*)
procedure totalCentro(cen:centro; var cantCenActual:integer; uniActual:string);
begin 
	if ( cen.uniPert = uniActual) then
		cantCenActual:= cantCenActual + 1;
end;

(*Contador para calcular el max Inv*)
procedure contadorInvestigadores(cen:centro; uniActual:string; var invActual:integer);
begin
	if (cen.uniPert = uniActual) then // si la uni pert es = a uniActual entonces:
		invActual:= invActual + cen.cantInv;
end;

(*la Uni con mayor cantidad de Investigadores en sus centros*)
procedure maxINV(invActual:string; uniActual:string; var max:integer; var uniMax:string);
begin 
	if (invActual > max )then // pregunta si Investigadores de la UNI Actual es mayor a max.
		uniMax:= uniActual; // uniMax (nombre del max) pasa a ser uniActual. si ponemos cen.UniPert ESTA MAL, ya que esto se declara al salir del while.
		max:= invActual; //Investigadores de la uni Actual, pasa a ser el nuevo max.
end;

(*los 2 centros con menor cantidad de becarios*)
procedure dosMIN(cen:centro; var minNombre:string; var min2Nombre:string; var min:integer; var min2:integer);
begin 
	if ( cen.cantBecarios < min ) then
	begin
		min2:= min;
		min:= cen.cantBecarios;
		minNombre2:= minNombre;
		minNombre:= cen.nombre; 
	end
	else if ( cen.cantBecarios < min2 ) then
	begin
		min2:= cen.cantBecarios;
		minNombre2:= cen.nombre;
	end;
end;

(*PROGRAMA PRINCIPAL*)
VAR 
	cen:centro;
	cantCenActual, invActual, uniActual, uniMax, minNombre, min2Nombre:string;
	max, min, min2:integer;
BEGIN
	max:= -5;
	min:= 995;
	min2:=999;
	uniMax:=' ';
	leerCentro(cen);
	while ( cen.cantInv <> 0 ) do
	begin
		invActual:= 0; // Reseteo la var.
		uniActual:= cen.uniPert;
		cantCenActual:=0;
		while ( (cen.cantInv <> 0) AND (cen.uniPert = uniActual) ) do
		begin
			invActual:= cen.cantInv;
			totalCentro(cen, cantCenActual, uniActual);
			contadorInvestigadores(cen, uniActual,invActual); // suma los Inv. de una Uni.
		end;
		maxINV(invActual, uniActual, max, uniMax); // Con la suma de los inv, pregunta si supera el max.
		writeln('Total de centros en la universidad ', uniActual, ' fue: ', cantCenActual);
	end;
	writeln('La Universidad con mayor cantidad de investigadores en sus centros fue: ', uniMax);
	writeln('Los dos centros con menor cantidad de becarios: ', minNombre, min2Nombre);
END.
