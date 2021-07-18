program P6ejercicio2;
type
	lista = ^nodo;
	persona = record
	dni: integer;
		nombre: string;
		apellido: string;
	end;
	nodo = record
		dato: persona;
		sig: lista;
	end;
	
procedure leerPersona(p: persona);//No está por referencia. no hace nada
begin
	read(p.dni);
	if (p.dni <> 0)then begin
		read(p.nombre);
		read(p.apellido);
	end;
end;
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista;p:persona); //Lista no está por referencia.
var
aux: lista;
begin
	aux^.dato:= p;//No reserve memoria para aux (no hice new)
	aux^.sig:= l;
	l:= aux;
end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
p:nodo;//No debe ser tipo nodo, debe ser tipo persona.
begin
	leerPersona(p);
	while (p.dni <> 0) do begin//este while es infinito, no recibe nunca el valor de P
	agregarAdelante(l,p);
	end;
end;
procedure imprimirInformacion(var l:lista);//si solo queremos imprimir, no debe estar por referencia.
begin
	while (l <> nil) do 
	begin
		writeln('DNI: ', l^.dato.dni, 'Nombre:',
		l^.nombre, 'Apellido:', l^.apellido);//Mal declarados los elementos, es l^.dato.nombre y apellido (2 errores)
		l:= l^.sig;
	end;
end;
{Programa principal}
var
l:lista;
begin//No reserve memoria para L 
	generarLista(l);
	imprimirInformacion(l);
end.
