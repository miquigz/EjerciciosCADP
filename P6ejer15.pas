program P6ejer15;
type
	alumno = record
		dni:integer;
		nombre:string;
		nota:integer;
	end;
	
	listaEPA = ^nodo;
	nodo = record
		ele:alumno;
		sig:listaEPA;
	end;
	
	
(*Proceso la lista EPA*)
procedure procesar(pri:listaEPA; var total1_4:listaEPA; var total2_3_5:listaEPA; var cant5:integer; var cant8:integer);
var
	nuevo:listaEPA;
begin
	cant8:=0; cant5:=0;
	while ( pri <> nil ) do
	begin
		new(nuevo); nuevo^.ele:= pri^.ele; nuevo^.sig:=nil;
		if (pri^.ele.nota >= 8) then
		begin
			cant8:= cant8 + 1;
			if (total1_4 = nil) then
				total1_4:= nuevo
			else
			begin
				nuevo^.sig:= total1_4;
				total1_4:= nuevo;
			end;
		end
		else if ( (pri^.ele.nota >= 5) and (pri^.ele.nota <= 8))then
		begin
			cant5:= cant5+1;
			if (total2_3_5 = nil)then
				total2_3_5:= nuevo
			else
			begin
				nuevo^.sig:= total2_3_5;
				total2_3_5:= nuevo;
			end;
		end;
	end;
end;

(*Repartir equitativamente 3 turnos: *)
procedure repartir3(total2_3_5:listaEPA; cant5:integer; var turno2:listaEPA; var turno3:listaEPA; var turno5:listaEPA);
var
	porcion:integer;
	sePuede:boolean;
	pri, nuevo:listaEPA;
begin
	pri:=total2_3_5;
	sePuede:= (cant5 mod 3)=0;
	porcion:= cant5 DIV 3;
	for i:=1 to 3 do begin
		while ( (pri <> nil) AND (cant <= porcion)) do
		begin
			new(nuevo); nuevo^.ele:= pri^.ele; nuevo^.sig:=nil;
			if (i = 1) then	begin
				if (pri = nil)then
					turno2:= nuevo
				else begin
					nuevo^.sig:= turno2;
					turno2:= nuevo;
				end;
			end else if(i = 2)then begin
				if (pri = nil)then
					turno3:= nuevo
				else begin
					nuevo^.sig:= turno3;
					turno3:= nuevo;
				end;
			end else if(i = 3) then begin
				if (pri = nil)then
					turno5:= nuevo
				else begin
					nuevo^.sig:= turno5;
					turno5:= nuevo;
				end;
			end;
			pri:=pri^.sig;
		end;
	end;
	if (sePuede) then
		writeln ('Los turnos fueron repartidos con un 100% de equidad')
	else
		writeln('Los turnos fueron repartidos los mas equitativos posibles.');
end;

(*Repartir equitativamente 2 turnos: *)
procedure repartir2(total1_4:listaEPA; cant8:integer; var turno1:listaEPA; var turno4:listaEPA);
var
	porcion:integer;
	sePuede:boolean;
	pri, nuevo:listaEPA;
begin
	pri:=total1_4;
	sePuede:= (cant8 mod 2)=0;
	porcion:= cant8 DIV 2;
	for i:=1 to 2 do begin
		while ( (pri <> nil) AND (cant <= porcion)) do
		begin
			new(nuevo); nuevo^.ele:= pri^.ele; nuevo^.sig:=nil;
			if (i = 1) then	begin
				if (pri = nil)then
					turno1:= nuevo
				else begin
					nuevo^.sig:= turno1;
					turno1:= nuevo;
				end;
			end else if(i = 2)then begin
				if (pri = nil)then
					turno4:= nuevo
				else begin
					nuevo^.sig:= turno4;
					turno4:= nuevo;
				end;
			end;
			pri:=pri^.sig;
		end;
	end;
	if (sePuede) then
		writeln ('Los turnos fueron repartidos con un 100% de equidad')
	else
		writeln('Los turnos fueron repartidos los mas equitativos posibles.');
end;

(*Programa Principal*)
VAR //nota: los turnos pueden ser un registro, probar dsp con eso.
	pri, total1_4, total2_3_5, turno1, turno4, turno2, turno3, turno5:listaEPA;
	cant5, cant8:integer;

BEGIN
	pri:=nil;
	cargarLista(pri); //se dispone
	procesar(pri, total1_4, total2_3_5);
	repartir3(total2_3_5, cant, turno2, turno3, turno5);
	repartir2(total1_4, cant8, turno1, turno4);
END.
