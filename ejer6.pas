program EJER6practica4parte1;
const
	dimF = 100;
type
	numeros = array[1..dimF] of integer;

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

procedure ambasPos(vec:numeros; dimL:integer; var maxP:integer; var minP:integer);
var
	max, min, i:integer;
begin
	max:= -999;
	min:= 999;
	for i:=1 to dimL do
	begin
		if (vec[i] > max) then
		begin
			max:= vec[i];
			maxP:= i;
		end ;// no pongo else if porq se bugea por alguna razon, pero en teoria deberia estar bien poner else.
		if (vec[i] < min) then
		begin
			min:= vec[i];
			minP:= i;
		end;
	end;
end;

VAR
	vec:numeros;
	dimL, minPos,maxPos:integer;

BEGIN
	maxPos:=-1;
	minPos:=-1;
	cargarNums(vec, dimL);
	ambasPos(vec, dimL, maxPos, minPos);
END.

