program p7Ejer6;
type
	subCategoria = 1..7;
	
	objetos = record
		cod:integer;
		categoria:subCategoria;
		nombre:string;
		distancia:integer; //distancia a la tierra
		descubridor:string; //nombre del descubridor
		anio:integer; //anio del descubrimiento
	end;

	listaObjetos = ^nodo;
	nodo = record
		ele:objetos;
		sig:listaObjetos;
	end;
	
(*Lectura del Registro*)	
procedure leerRegistro(var obj:objetos);
begin
	with obj do begin
		writeln('Ingrese codigo del objeto:'); readln(cod);
		if (cod <> -1) then begin
			writeln('Ingrese categoria del objeto: 				'); readln(categoria);
			writeln('Ingrese nombre del objeto:					'); readln(nombre);
			writeln('Ingrese distancia a la tierra del objeto:: '); readln(distancia);
			writeln('Ingrese nombre del descubridor:		    '); readln(descubridor);
			writeln('Ingrese anio del descubrimiento: 			'); readln(anio);
		end;
	end;
end;
(*Cargar la Lista*)	
procedure cargarLista(pri:objetos);
var
	nuevo, aux:listaObjetos;
begin
	leerRegistro(obj);
	while (obj.cod <> -1 ) do begin
		new(nuevo); nuevo^.ele:= obj; nuevo^.sig:=nil;
		if (pri = nil) then
			pri:= nuevo
		else
		begin
			aux:=pri; //esta aux sirve para recorrer la lista, y encontrar la ultima pos
			while(aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig:= nuevo; //al salir del while, estoy en la ultima pos, asigno nuevo.
		end;
		leerRegistro(obj);
	end;
end;












(*Programa Principal*)
VAR


BEGIN
	
	
END.

