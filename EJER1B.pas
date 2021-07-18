program Ejer1BPractica4Parte2;
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
	primero, ultimo, medio:integer;
begin
	primero:=1; esta:=false; ultimo:= dimF; //si tuviesemos dimL, ultimo ser'ia la dimL
	medio:= (primero + ultimo) div 2; // dividimos por 2, la suma del primero y el ultimo, por lo tanto (500+1 DIV 2) = 250
	while ( (primero <= ultimo) AND (n <> vec[medio])) do // n es el num que buscamos. 
	begin
		if (n < vec[medio]) then
			ultimo:= medio-1 // a ultimo lo definimos como medio - 1.
		else
			primero:= medio +1; // si no se cumple lo anterior (o sea es mayor) al primero lo establecemos como el medio +1.
		medio:= ( (primero + ultimo) div 2);
	end;
	if ( (primero <= ultimo) AND (n = vec[medio]) ) then
		esta:= true;
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
