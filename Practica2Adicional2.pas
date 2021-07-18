program Practica2Adicionales2;
procedure suma(x:integer; y:integer; var sumaTotal:integer);
var
	i:integer;
begin
	for i:=x to y do
	begin
		sumaTotal:= sumaTotal + i;
	end;
end;
procedure producto(x:integer; y:integer; var productoTotal:integer);
var
	i:integer;
begin
	for i:=x to y do // Si ingresamos 5 y 7, entonces: 5 to 7
	begin
		productoTotal:= productoTotal * i;
	end;
end;
VAR
	x,y, productoTotal, sumaTotal:integer;
BEGIN
	sumaTotal:= 0; // inicializo con el neutro de la suma (0)
	productoTotal:=1; // Inicializo con el neutro de la multiplicacion (1)
	writeln('Ingrese dos pares de numeros:');
	readln(x,y);
	suma(x,y,sumaTotal);
	producto(x,y,productoTotal);
	writeln('La suma es: ', sumaTotal);
	writeln('El producto es: ', productoTotal);
END.
