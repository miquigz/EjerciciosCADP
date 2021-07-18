program P6ejer14;
type
	{Sub rangos}
	sAlumnos = 1..1300;
	sTransporte:1..5;
	sDia = 1..31;
	
	viajes = record
		codAlu:sAlumnos;
		dia:sDia;
		facu:string;
		transporte:sTransporte;
	end;
	
	listaViajes = ^nodo;
	nodo = record
		ele:viajes;
		sig:listaViajes;
	end;

	vAlumnos = array[sAlumnos] of integer;
	vTransportes = array[sTransporte] of integer;

(*Lectura Registro Viajes*)
procedure leerViaje (var viaje:viajes);
begin
	with viajes do
	begin
		writeln('Ingrese codigo del alumno:   '); readln(codAlu);
		writeln('Ingrese dia del mes        : '); readln(dia);
		writeln('Ingrese facultad del alumno: '); readln(facu);
		writeln('Ingrese medio de transporte: '); readln(transporte);
	end;
end;

(*Leer listaViajes*)
procedure leerListaViaje(var pri:listaViajes;);
var
	nuevo:listaViajes;
	viaje:viajes;
begin
	leerViaje(viaje);
	new(nuevo); nuevo^.ele:= viaje; nuevo^.sig:= nil;
	while ( viaje.codAlu <> -1 ) do 
	begin
		if (pri = nil) then
			pri:= nuevo
		else
		begin
			nuevo^.sig:= pri;
			pri:=nuevo;
		end;
	end;
end;

(*Inicializar Vector contador*)
procedure inicializarVector(var vecV:vAlumnos; var vecG:vAlumnos; var vecT:vTransportes; var vBici:vAlumnos; var vOtros:vAlumnos);
var
	i:integer;
begin
	for i:=1 to 1300 do
	begin
		vecV[i]:= 0;
		vecG[i]:=0;
		vBici[i]:=0;
		vOtros[i]:=0;
	end;
	for i:1= to 5 do
		vecT[i]:=0;
end;

(*Recorrido de la lista y Calcular*)
procedure calcularRecorrer(pri:listaViajes; var vecV:vAlumnos; var vecG:vAlumnos; var vecT:vTransportes; var vBicis:vAlumnos; var vOtros:vAlumnos);
var
	cant6, cant80, max, max2, maxNum, maxNum2, cantBici:integer
begin
	cant6:=0; cant80:=0; max:= -99; max2:= -99; maxNum:= 0; maxNum2:=0; cantBici:=0;
	while (pri <> nil) do
	begin
		vecV[pri^.ele.codAlu]:= vecV[pri^.ele.codAlu] + 1; //las veces q se repite nos determina cuantos viajes hace.
		vecG[pri^.ele.codAlu]:= vecG[pri^.ele.precio] + vecG[pri^.ele.precio]; //no existe el precio, y tampoco nos dio una tabla para calcular el enunciado.
		vecT[pri^.ele.transporte]:= vecT[pri^.ele.transporte] + 1; //sumo el transporte
		if (pri^.ele.transporte = 5 ) then
			vBicis[pri^.ele.codAlu]:= vBicis[pri^.ele.codAlu] + 1;
		if (pri^.ele.transporte < 5 ) AND ( pri^.ele.transporte >= 1 ) then
			vOtros[pri^.ele.codAlu]:= vOtros[pri^.ele.codAlu] +1;
		pri:= pri^.sig;
	end;
	for i:=1 to 1300 do
	begin
		if ( (vecV[i] / 31) > 6 ) then //si nos da un promedio mayor a 6, quiere decir q hace mas de 6 viajes al dia.
			cant6:= cant6 + 1;
		if (vecG[i] / 31 > 80 ) then
			cant80:= cant80 +1;
		if ( (vBicis[i] >=1) AND (vOtros[i] >= 1) ) then
			cantBici:= cantBici + 1;
	end;
	for i:=1 to 5 do
	begin
		if (vecT[i] > max) then begin
			max2:= max;
			max:= vecT[i];
			maxNum:= i;
		end
		else if (vecT[i] > max2) then begin
			max2:= vecT[i];
			maxNum2:= i;
	end;
	informar(maxNum, maxNum2, cantBici, cant80, cant6);
end;

(*Informar datos*)
procedure informar(maxNum:integer; maxNum2:integer; cantBici:integer cant80:integer; cant6:integer);
begin
	writeln('La cantidad de alumnos que realizan mas de 6 viajes por dia: ', cant6                        );
	writeln('La cantidad de alumnos que gastan mas de 80$ por dia: ', cant80                              );
	writeln('Los codigos de los 2 medios de transporte mas utilizados: ', maxNum, ' y  ', maxNum2         );
	writeln('La cantidad de alumnos que combinan bicicleta con algun otro medio de transporte: ', cantBici);
end;

(*Programa principal*)
VAR
	vecViajes, vecGastos, vBicis, vOtros:vAlumnos
	vecT:vTransportes;
	
BEGIN
	leerListaViaje(pri);
	inicializarVector(vecViajes, vecGastos, vecT, vBici, vOtros);
	calcularRecorrer(pri, vecViajes, vecGastos, vecT, vBicis, vOtros);
	
END.

