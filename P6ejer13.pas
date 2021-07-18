program P6ejer13;
const
	dimF = 3600;
type
	subRol = 1..4;
	usuario = record
		email:string;
		rol:subRol;
		revista:string;
		cantDias:integer;
	end;
	
	usuarios = array[1..dimF]of usuario;
	conteoRol = array[rangoRol] of integer; //si le pongo of rangoRol, no le puedo asignar 0, por ende no puedo sumarlo dsp.
	
	listadoAcceso = ^nodo; //listado de usuarios de la revista Economica, ordenado por la cantDias (Ascendente)
	nodo = record
		ele:usuario;
		sig:listadoAcceso;
	end;
	
(*Inicializaci'on del vector conteo*)	
procedure inicializarVector(var vecRol:conteoRol);
var
	i:integer;
begin
	for i:=1 to 4 do
		vec[i]:= 0;
end;
	
(*Recorrido del vector*)		
procedure recorrerVector(vec:usuarios; var pri:ListadoAcceso; var vecRol:conteoRol);
var
	i:integer;
	max, max2:integer
	maxEmail, maxEmail2:string;
begin
	max:= -999; max2:= -999; //maximos locales, ya que los voy a usar aca adentro. 
	for i:=1 to dimF do begin
		if(vec[i].revista = 'Economica') then
			insertar(pri, vec[i]);
		vecRol[vec[i].rol]:= vecRol[vec[i].rol] + 1; //suma de cada rol
		if (vec[i].cantDias > max) then begin
			max2:= max;
			max:= vec[i].cantDias;
			maxEmail2:= maxEmail;
			maxEmail:= vec[i].email;
		end else if (vec[i].cantDias > max2) then begin
			max2:= vec[i].cantDias;
			maxEmail2:= vec[i].email;
		end;
	end;
	for i:=1 to 4 do
		writeln('La cantidad del rol: ', i, ' es: ', vecRol[i]);
	while (pri <> nil) do begin
		writeln(pri^.ele.email); //nos pide el nombre, pero el enunciado no carga nombre, asiq damos email.
		pri:= pri^.sig;
	end;
	writeln('Los mails de los dos usuarios que hace mas tiempo no ingresan al portal es: ');
	writeln(maxEmail, ' y '. maxEmail2);
end;

(*Insertar nodos*)
procedure insertar(var pri:listadoAcceso; user:usuario);
var
	nuevo, actual, ant:listadoAcceso;
begin
	new(nuevo); nuevo^.ele:= user; nuevo^.sig:=nil;
	if (pri = nil) then //caso 1, lista vacia
		pri:= nuevo
	else
	begin
		actual:=pri; 
		ant:= pri;
		while((actual <> nil) AND (actual^.ele.cantDias < nuevo^.ele.cantDias))do
		begin
			ant:= actual;
			actual:= actual^.sig
		end; //al salir de este while encontr'e la posicion
	if(actual = pri)then
	begin
		nuevo^.sig:= pri;
		pri:= nuevo
	end
	else if(actual <> nil)then
	begin
		ant^.sig:= nuevo; 
		nuevo^.sig:= actual;
	end
	else
	begin
		ant^.sig:= nuevo;
		nuevo^.sig:=nil;
	end;
end;

 (*Programa Principal*)
VAR
	pri:listadoAcceso;
	vec:usuarios;
	vecRol:conteoRol;

BEGIN
	inicializarVector(vecRol);
	recorrerVector(vec, pri, vecRol);
END.
