program Ejer4P4part1;
const
	dimF = 100;
type
	numeros = array[1..dimF] of integer;

(*  A  *)
function posicion(vec:numeros; dimL:integer; x:integer):integer; 
begin
	if ( (x <= dimL) AND ( x >= 1) ) then
		posicion:= vec[x]
	else
		posicion:= -1;
end;

(*  B  *)
procedure intercambio(var vec:numeros; dimL:integer; x:integer; y:integer); 
var // la pos x e y , se da por sentado que son >=1 y <=100
	xValor, yValor:integer;
begin
	writeln('Ingrese el valor de x'); readln(xValor);
	writeln('Ingrese el valor de y'); readln(yValor);
	vec[x]:= xValor;  vec[y]:= yValor;
end;

(*  C  *)
function sumaTotal(vec:numeros; dimL:integer):integer; 
var
	i,suma:integer;
begin
	suma:= 0;
	for i:=1 to dimL do
		suma:= suma + vec[i];
	sumaTotal:= suma;
end;

(*  D  *)
function promedio(vec:numeros; dimL:integer):real; 
var
	suma:integer;
begin
	suma:= sumaTotal(vec, dimL);
	promedio:= suma/dimL;
end;

(*  E  *)
function eleMax(vec:numeros; dimL:integer):integer; 
var
	i,maxPos, max:integer;
begin
	max:= -99;
	for i:=1 to dimL do
	begin
		if (vec[i] > max) then
		begin
			maxPos:= i;
			max:= vec[i];
		end;
	end;
	eleMax:= maxPos;
end;

(*  F  *)
function eleMin(vec:numeros; dimL:integer):integer; 
var
	i,minPos, min:integer;
begin
	min:= 999;
	for i:=1 to dimL do
	begin
		if (vec[i] < min) then
		begin
			minPos:= i;
			min:= vec[i];
		end;
	end;
	eleMin:= minPos;
end;

(*principal*)
VAR
	vec:numeros;
	dimL,x,y,Z:integer;

BEGIN
	dimL:=0;
	cargarNumeros(vec, dimL); // no se implementa.
	writeln('Ingrese un valor cualquiera de X'); readln(Z);
	writeln('La pos de X fue: ',posicion(vec,dimL,Z)); // a
	writeln('Ingrese una posicion x e y:'); readln(x); readln(y);
	intercambio (vec, dimL, x, y); // b
	writeln('La suma total del vector numeros fue: ', sumaTotal(vec,dimL)); // c
	writeln('El promedio de los valores del vector fue: ', promedio(vec, dimL):4:2); // d
	writeln('La posicion del elemento maximo fue:', eleMax(vec,dimL)); //e
	writeln('La posicion del elemento minimo fue:', eleMin(vec,dimL)); //f
END.
