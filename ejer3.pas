program Ejer3P4;

const
	dimF= 150;
	
type
	numeros = array[1..dimF] of integer;

(*A*)
procedure imprimirA(vec:numeros; dimL:integer);
var
	i:integer;
begin
	for i:=1 to dimL do
		writeln(vec[i]);
end;

(*B*)
procedure imprimirB(vec:numeros; dimL:integer);
var
	i:integer;
begin
	for i:= dimL downto 1 do
		writeln(vec[i]);
end;

(*C*)
procedure imprimirC(vec:numeros; dimL:integer);
var
	i, mitad:integer;
begin
	mitad:= dimL DIV 2;
	for i:= mitad downto 1 do
		writeln(vec[i]);
	mitad:= mitad +1;
	for i:= mitad to dimL do
		writeln(vec[i]);
end;

(*D*)
procedure imprimirD(vec:numeros; x:integer; y:integer);
var
	i:integer;
begin
	if (y > x) then
		for i:= x to y do
			writeln(vec[i])
	else
		for i:= x downto y do
			writeln(vec[i]);
end;

(*E*)
procedure imprimirE(vec:numeros; x:integer; y:integer);
var
	mitad, i:integer;
begin
	if (y > x) then
	begin
		for i:= x to y do (*A*)
			writeln(vec[i]);
			
		for i:= y downto x do (*B*)
			writeln(vec[i]);
			
		(*C*)
		mitad:= y DIV 2;
		if (mitad > x) then
		begin
			for i:= mitad downto x do
				writeln(vec[i]);	
			mitad:= mitad + 1;
			for i:= mitad to y do
				writeln(vec[i]);
		end;
	end
	else if (y < x) then
	begin
		for i:= y to x do(*A*)
			writeln(vec[i]);
		for i:= x downto y do(*B*)
			writeln(vec[i]);
		
		(*C*)	
		mitad:= x DIV 2;
		if (mitad > y) then
		begin
			for i:= mitad downto y do
				writeln(vec[i]);	
			mitad:= mitad + 1;
			for i:= mitad to x do
				writeln(vec[i]);
		end;
	end;
end;

VAR
	vec:numeros;
	x,y, dimL:integer;
{ Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.}
BEGIN
	dimL:=0; x:=0; y:=0;
	cargarNumeros(vec, dimL);//no se implementa. 
	imprimirA(vec, dimL);
	imprimirB(vec, dimL);
	imprimirC(vec, dimL);
	imprimirD(vec, x, y);
	imprimirE(vec, x, y);
END.
