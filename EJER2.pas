program Ejer2APractica4parte2;
const
	dimF = 500;
type
	alumnos = array[1..dimF]of string;

(* Carga del vector*) // 2)A)
procedure cargarAlumnos(var vec:alumnos; var dimL:integer);
var
	name:string;
begin
	name:=''; dimL:=0;
	while ( (dimL < dimF) AND (name <> 'ZZZ') ) do
	begin
		dimL:= dimL +1;
		writeln('Ingrese nombre de alumno: '); readln(name);
		if (name <> 'ZZZ') then
			vec[dimL]:= name;
	end;
end;

(*Primera ocurrencia, del nombre ingresado*) //2)B) 
function posPrimera(vec:alumnos; nombre:string):integer; //recorro el vector hasta encontrar el primer nombre igual al que inserte (la primera ocurrencia)
var
	pos:integer; // ver si se puede hacer un while sin begin-end, y ver si este while anda.
begin
	pos:=1;
	while ( (pos < dimF) AND ( vec[pos] <> nombre ) ) do 
		pos:=pos + 1;  // vamos a salir de este while cuando recorramos todo el vector, o cuando encontremos la primer ocurrencia
	posPrimera:= pos;
end;

(*Eliminar la pos de la primera ocurrencia*) //2)B) 
procedure eliminarPrimera(var vec:alumnos; var dimL:integer);
var // Damos por sentado que existe una primer ocurrencia, y el nombre ingresado tambien existe.
	name:string;
	i, pos:integer;
begin
	writeln('Escriba un nombre para borrar su primera ocurrencia: '); readln(name);
	pos:= posPrimera(vec, name); // obtenemos la POS.
	for i:= pos to (dimL-1) do // partimos de las POS, y Sobrescribimos el vector.
		vec[i]:= vec[i+1];
	dimL:= dimL-1; // Disminuimos la dimension logica.
end;

(*Leer un nombre, e insertarlo en la pos 4*) //2)C) 
procedure insertar(var vec:alumnos; var dimL:integer);
var
	i:integer;
	name:string;
begin
	writeln('Ingrese un nombre para insertar:'); readln(name); //me falta agregar POS
	if ((dimL + 1) <= dimF) then  //verifico si hay espacio en el vector y la posición es válida
	begin
		for i:= dimL downto 4 do // Empezamos desde arriba del todo, hasta el valor 4
			vec[i+1]:= vec[i];
	end; // 'hacemos espacio' para poder insertar un nuevo valor.
	vec[4]:= name; // luego de hacer espacio, insertamos el nombre, sin miedo a perder ningun valor del vector.
	dimL:= dimL+1; // Aumentamos la dimension logica.
end;


(* Agregar un nombre al vector*) // 2)D
procedure agregar(var vec:alumnos; var dimL:integer);
var
	name:string;
begin
	writeln('Ingrese un nombre para agregarlo al vector:'); readln(name);
	vec[dimL+1]:= name;
	dimL:= dimL + 1;
end;

(*prog principal*)
VAR
	vec:alumnos;
	dimL:integer;
	
BEGIN
	cargarAlumnos(vec, dimL);
	eliminarPrimera(vec, dimL);
	insertar(vec, dimL);
	agregar(vec, dimL);
END.
