program p2adicional2;
function suma(x:integer; y:integer):integer;
var
	i, auxSUMA:integer;
begin
	auxSUMA:=0;
	for i:=x to y do //si x=4 e y=12 , va a ir de 4 a 12
		auxSUMA:= i +  auxSUMA;
	suma:= auxSUMA;
end;

function producto(x:integer; y:integer):integer;
var
	i, auxProducto:integer;
begin
	auxProducto:= 1;
	for i:=x to y do
		auxProducto:= i *  auxProducto;
	producto:= auxProducto;
end;
(*Programa Principal*)
VAR
	x,y, i:integer;
BEGIN
	for i:=1 to 10 do begin
		writeln('ingrese 2 numeros:');
		readln(x); readln(y);
		writeln('La suma es: ' ,suma(x,y));
		writeln('El producto es: ' ,producto(x,y));
	end;
END.
