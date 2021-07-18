program P7Ejer5;
const
	dimF = 100;
	anioActual = 2021;
type
	subCod = 1..100;
	camion = record //se tiene esta info de 100 camiones
		patente:integer;
		anio:integer;
		capacidad:real;
	end;
	
	camiones = array[subCod] of camion;
	
	viajes = record
		codViaje:integer;
		codCamion:subCod;
		km:integer;
		ciudadDestino:string;
		anioViaje:integer;
		choferDNI:integer;
	end;
	
	listaViajes = ^nodo;
	nodo = record
		ele:viajes;
		sig:listaViajes;
	end;
	
	vContadorKM = array[subCod] of integer;

(*Cargar VEC camion*)
procedure leerVec(var vec:camiones);
begin end;
(*Lectura del reg viajes*)
procedure leerRegistro(var viaje:viajes);
begin
	with viaje do
	begin
		writeln('Ingrese codigo del viaje: '); readln(codViaje);
		if (codViaje <> -1) then begin
			writeln('Ingrese codigo del Camion:'); readln(codCamion);
			writeln('Ingrese distancia del Viaje:'); readln(km);
			writeln('Ingrese ciudad destino del viaje:'); readln(ciudadDestino);
			writeln('Ingrese anio del viaje:'); readln(anioViaje);
			writeln('Ingrese el DNI del chofer:'); readln(choferDNI);
		end;
	end;
end;
(*Lectura de la lista Viajes*)

procedure cargarLista(var pri:listaViajes);
var
	viaje:viajes;
	nuevo:listaViajes;
begin
	leerRegistro(viaje);
	while ( viaje.codViaje <> -1) do begin
		new(nuevo); nuevo^.ele:= viaje; nuevo^.sig:=nil;
		if (pri = nil) then
			pri:=nuevo
		else begin
			nuevo^.sig:=pri;
			pri:=nuevo;
		end;
		leerRegistro(viaje);
	end;
end;
(*Inicializar Vector contador: *)
procedure inicializarVec(var vecKM:vContadorKM);
var
	i:integer;
begin
	for i:=1 to dimF do
		vecKM[i]:=0;
end;
(*Maximo y Minimo km's*)
procedure maxMin(var maxPatente:integer; var minPatente:integer; var max:integer; var min:integer; km:integer; patente:integer);
begin
	if (km > max)then begin
		max:= km;
		maxPatente:= patente;
	end else if (km < min) then begin
		min:= km;
		minPatente:= patente;
	end;;

end;

(*Informar*)
procedure informar(maxP:integer; minP:integer);
begin
	writeln('La patente con mas km recorridos fue: maxP'  );
	writeln('La patente con menos km recorridos fue: minP');
end;

function descomponerDNI(DNI:integer):boolean;
var
	digito:integer;
	hayImpar:boolean;
begin
	hayImpar:=false; //esto lo hago para q no siga descomponiendo si encontro un impar.
	while ( (DNI <> 0) AND (hayImpar) ) do begin
		digito:= DNI mod 10;
		if ( (digito mod 2) = 0) then
			hayImpar:=false
		else
			hayImpar:=true;
		DNI:= DNI div 10;
	end;
	descomponerDNI:= (hayImpar = false);
end;

procedure calcular(pri:listaViajes; vec:camiones; var vecKM:vContadorKM; var maxP:integer; var minP:integer);
var
	max, min, cantV, i:integer;
begin
	max:= -999; min:=999; cantV:=0;
	while (pri <> nil) do begin
		vecKM[pri^.ele.codCamion]:= vecKM[pri^.ele.codCamion] + pri^.ele.km;
		if ( (vec[pri^.ele.codCamion].capacidad > 30.5) AND (pri^.ele.anioViaje < anioActual-5) ) then
			cantV:= cantV + 1;
		if (descomponerDNI(pri^.ele.choferDNI)) then
			writeln(pri^.ele.codViaje);
		pri:= pri^.sig;
	end;
	for i:=1 to dimF do
		maxMin(maxP, minP, max, min,vecKM[i], vec[i].patente);
end;


(*Programa Principal*)
VAR
	vec:camiones;
	pri:listaViajes;
	vecKM:vContadorKM;
	minP ,maxP:integer;

BEGIN
	cargarLista(pri);
	inicializarVec(vecKM);
	leerVec(vec);
	calcular(pri, vec, vecKM, maxP, minP);
END.
