program Ejer5P4part1;
const
	dimF = 100;
type
	numeros = array[1..dimF]of integer;

procedure cargarNums(var vec:numeros; var dimL:integer);
var
	num:integer;
begin
	dimL:=0; // empieza en 0
	writeln('Ingrese un valor'); readln(num);
	while ( (num <> 0) AND (dimL < dimF) ) do
	begin
		dimL:= dimL +1;
		vec[dimL]:= num; 
		writeln('Ingrese un valor'); readln(num);
	end
end;

(*  B  *)
procedure intercambio(var vec:numeros; dimL:integer; x:integer; xValor:integer; y:integer; yValor:integer); 
begin  // la pos x e y , se da por sentado que son >=1 y <=100
	vec[x]:= xValor;  vec[y]:= yValor;
end;

(*  E  *)
function eleMax(vec:numeros; dimL:integer):integer; // retorna Pos del eleMax
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
function eleMin(vec:numeros; dimL:integer):integer;  //retorna Pos del eleMin
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

(*Modificar*)
procedure modificar(vec:numeros; dimL:integer);
var
	maxPos, minPos:integer;
begin
	maxPos:= eleMax(vec,dimL);
	minPos:= eleMin(vec,dimL);
	writeln('El elemento maximo: ', vec[maxPos], ' que se encontraba en: ', maxPos, 
	' fue intercambiado con el elemento minimo: ', vec[minPos], ' que se encontraba en: ', minPos);
	intercambio(vec, dimL, maxPos, vec[maxPos], minPos, vec[minPos]);
end;


(*Programa principal*)
VAR
	vec:numeros;
	dimL:integer;

BEGIN
	dimL:=0;	
	cargarNums(vec ,dimL);
	modificar(vec, dimL);
END.
