program Ejer1Practica4Parte2;
const
	dimF = 500;	
type
	numeros = array[1..dimF] of integer;

(*Carga de vector*)
procedure cargarVector(var vec:numeros);
var
	num, i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('Ingrese un valor: '); readln(num);
		vec[i]:= num;
	end;
end;

(*Busqueda de n valor*)
function busqueda(vec:numeros; n:integer):boolean;
var
	esta:boolean;
	pos:integer;
begin
	pos:=1; esta:=false;
	while ( (pos < dimF) AND (esta = false) ) do
	begin
		if (vec[pos] = n) then
			esta:=true
		else
			pos:= pos+1;
	end;
	busqueda:= esta;
end;

VAR
	vec:numeros;
	n:integer;

BEGIN
	cargarVector(vec);
	writeln('Ingrese el numero a buscar: '); readln(n);
	if (busqueda(vec, n)) then //por defecto en pascal, se pregunta si es true;
		writeln('El numero ingresado est`a en el vector')
	else
		writeln('El numero ingresado NO est`a en el vector.');
END.
