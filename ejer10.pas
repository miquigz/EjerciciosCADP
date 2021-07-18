program Ejer7Practica4part1;
const
	TAM = 300;
type
	salario = array[1..TAM] of real;

procedure cargarSalario(var vec:salario; var dimL:integer);
var
	num:real;
begin
	dimL:=0; readln(num);
	while ( (dimL < TAM)  AND ( num <> 0) ) do
	begin
		dimL:= dimL +1;
		vec[dimL]:= num;
		readln(num);
	end;
end;

procedure aumentar15(vec:salario; var aumentado:salario; dimL:integer; X:real);
var
	i:integer;
begin
	for i:=1 to dimL do
		aumentado[i]:= vec[i] + (vec[i] * X);		
end;

function promedio(vec:salario; dimL:integer):real;
var
	i:integer;
	suma:real;
begin
	suma:=0;
	for i:=1 to dimL do
		suma:= suma + vec[i];
	promedio:= suma/dimL;
end;

procedure imprimirAumento (vec:salario; dimL:integer); //ingresamos el vec aumentado
var
	i:integer;
begin
	for i:=1 to dimL do
		writeln(vec[i]:4:2);
end;

VAR
	vec, aumentado:salario;
	dimL:integer;
	X:real;
BEGIN
	X:= 1.15;
	cargarSalario(vec, dimL);
	aumentar15(vec, aumentado, dimL, X);
	writeln('El promedio fue: ', (promedio(vec, dimL)):4:2 );
	imprimirAumento(aumentado, dimL);
END.
