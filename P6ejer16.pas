program P6ejer16;
const
	CORTE = 'Nada';
type
	corredores = record
		nombre:string;
		apellido:string;
		distancia:integer;
		tiempo:integer;
		pais:string;
		ciudadInicio:string;
		ciudadFin:string;
	end;
	
	listaCorredores = ^nodo;
	nodo = record
		ele:corredores;
		sig:listaCorredores;
	end;
	
(*leer registro*)
procedure leerCorredor(var corre:corredor);
begin
	with corre do begin
		writeln ('Ingrese nombre del corredor:		  '); readln(nombre);
		if (nombre <> CORTE) then begin
			writeln ('Ingrese apellido del corredor: 	  '); readln(apellido);
			writeln ('Ingrese distancia del corredor: 	  '); readln(distancia);
			writeln ('Ingrese tiempo del corredor:		  '); readln(tiempo);
			writeln ('Ingrese pais del corredor:		  '); readln(pais);
			writeln ('Ingrese ciudad inicio del corredor: '); readln(ciudadInicio);
			writeln ('Ingrese ciudad fin del corredor:    '); readln(ciudadFin);
		end;
	end;
end;
(*leer lista*)
procedure leerLista(var pri:listaCorredores);
var
	nuevo:listaCorredores;
	corre:corredores;
begin
	leerCorredor(corre);
	while (corre.nombre <> CORTE) do
	begin
		new(nuevo); nuevo^.ele:= corre; nuevo^.sig:=nil
		if (pri = nil) then
			pri:=nuevo
		else begin
			nuevo^.sig:= pri;
			pri:=nuevo;
		end;
		leerCorredor(corre);
	end;
end;

procedure recorrer(pri:listaCorredores; var priCity:listaCiudad);
var
	cantTotalD, cantTotalT, cantTotalC, max, cantCorre, kmActual, ciudadKM, distanciaDistinta, correBrasil, disBrasil, bostonKM, minutosBoston:integer;
	ciudadActual, maxNombre:string; //supongamos que se lee la info ordenada por ciudad
begin
	cantTotal:=0; max:=-999; cantTotalD:=0; cantTotalT:=0; cantTotalC:=0; ciudadKM:=0; correBrasil:=0; distanciaDistinta:=0; disBrasil:=0; bostonKM:=0; minutosBoston:=0;
	while ( pri <> nil) do
	begin
		cantCorre:=0; kmActual:=0;
		ciudadActual:=pri^.ele.ciudadInicio;
		while ( (pri <> nil) AND (ciudadActual = pri^.ele.ciudadInicio) ) do
		begin
			cantCorre:=cantCorre + 1;
			kmActual:= kmActual + pri^.ele.distancia;
			cantTotalD:= cantTotalD + pri^.ele.distancia;
			cantTotalT:= cantTotalT + pri^.ele.tiempo;
			if (pri^.ele.ciudadInicio <> pri^.ele.ciudadFin) then
				distanciaDistinta:= distanciaDistinta + pri^.ele.distancia;
			if (pri^.ele.pais = 'Brasil') then
			begin
				correBrasil:= correBrasil + 1;
				disBrasil:= disBrasil + pri^.ele.distancia;
			end;
			if (pri^.ele.ciudadInicio = 'Boston')then
			begin
				bostonKM:= bostonKM + pri^.ele.distancia;
				minutosBoston:= minutosBoston + pri^.ele.tiempo;
			end;
			pri:= pri^.sig;
		end;
		cantTotalC:= cantTotalC + cantCorre;
		
		if (cantCorre > max) then
		begin
			max:=cantCorre; //max guarda la cantidad de corredores.
			maxNombre:=ciudadActual; // esto guarda el nombre
			ciudadKM:= kmActual; //esto guarda los km hechos en la ciudad.
		end;
	end;
	
	writeln('La cantidad total de corredores fue:', cantTotalC);
	writeln('La cantidad total de distancia fue:', cantTotalD);
	writeln('La cantidad total de tiempo fue:', cantTotalT);
	
	writeln('Nombre de la ciudad con mas corredores: ', maxNombre,'Km en esta ciudad: ', ciudadKM);
	
	writeln('La distancia de corredores que partieron de una ciudad y finalizaron en otra: ', distanciaDistinta);
	
	writeln('La distancia promedio de los corredoes de brasil es: ', disBrasil / correBrasil);
	
	writeln('Cantidad de minutos por km es:', bostonKM / minutosBoston);
end;
(*principal*)
VAR
	pri:listaCorredores;
	
BEGIN
	leer(pri);
	recorrer(pri);
END.

