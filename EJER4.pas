program Ejer4Practica4Parte2;
const
	dimF = 1000;
type
	alu = record
		nro:integer; // se encuentra ordenada de manera ascendente.
		apellido:string;
		nombre:string;
		cantAsis:integer;
	end;
	alumnos = array[1..dimF] of alu;

//cargar otorga DIML (supongamos).
// buscar vec[i].nro = valorinsrtado  (ordenado ascendente)
(*A*)
function busqueda(vec:alumnos; dimL:integer; num:integer):integer;
var
	pri, ultimo, medio:integer;
begin
	pri:=1; ulti:= dimL;
	medio:= (pri + ulti) div 2;
	while ((pri <= ulti) AND (num <> vec[medio].nro)) do
	begin
		if (num < vec[medio].nro)then
			ulti:= medio-1
		else 
			pri:= medio+1;
		medio:=(pri + ulti) div 2;
	end;	
	busqueda:= medio; // seguro existe una pos de algun alumno con el nro ingresado.
end;

(*B*)
procedure recibirInsertar(var vec:alumnos; dimL:integer; pos:integer); //
var
	i:integer;
	aux:alu;
begin
	writeln('Ingresar nro, apellido, nombre, cantAsis del alumno a insertar en el vector:');
	readln(alu.nro); readln(aux.apellido);  readln(aux.nombre); readln(aux.cantAsis);
	if ( ((dimL + 1) <= dimF) AND (pos >=1) AND (pos <= dimL) ) then
	begin
		for i:= dimL downto pos do
			vec[i+1]:= vec[i]; // aca lo que hago es 'hacer espacio', para insertar.
			//verificar si se puede hacer esto o es necesario hacer:
			//vec[i+1].nro:= vec[i].nro;
			//vec[i+1].apellido:= vec[i].apellido;
			//vec[i+1].nombre:= vec[i].nombre;
			//vec[i+1].cantAsis:= vec[i].cantAsis;
		vec[pos]:= aux; // verificar si se puede hacer esto TAMBIEn, o es necesario todo el registro.
		dimL:= dimL +1;
	end;
end;

(*C*)
procedure eliminarPos(var vec:alumnos; var dimL:integer; pos:integer);
var
	i:integer;
begin
	if ( (pos >= 1) and (pos <= dimL) ) then
	begin
		for i:= pos to (dimL-1) do
			vec[i]:= vec[i+1];
		dimL:= dimL -1;
	end;
end;

(*D*)
procedure recibirEliminar(var vec:alumnos; var dimL:integer; num:integer); //recibimos el nro de alu a eliminar
var
	pos, i:integer;
begin
	pos:= buscar(vec, dimL, num); // busca la pos de ese nro de alu, que seguro existe.
	eliminar(vec, dimL, pos);
end;

(*E*)
procedure eliminarCero(var vec:alumnos; var dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do
	begin
		if (vec[i].cantAsis = 0) then
			eliminarPos(vec, dimL,i);
	end;
end;

 // intentar que sea un solo recorrido, y ver si se puede con un solo vector.


(* Programa Principal *)
VAR

	dimL:integer;

BEGIN
	cargar(vec, dimL)// no se implementa, suponganmos que nos da una dimL de 203 .
	dimL:= 203;
	
END.
