program Vectores;
const
	cant_datos = 150;
type
	vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
	nums:real;
begin
	readln (nums);
	if (nums <> 0) then
	begin
		while ( (nums <> 0) AND (dimL < cant_datos)) do
		begin
			dimL:= dimL +1;
			v[dimL]:= nums;
			readln(nums);
		end; 
	end;	
end;

procedure modificarVectorySumar(var v:vdatos; dimL:integer; n:real; var suma:real);
var
	i:integer;
begin
	for i:= 1 to dimL do
		v[i]:= v[i] + n;
	for i:= 1 to dimL do
		suma:= suma + v[i];
end;

{ programa principal }
VAR
	datos : vdatos;
	dim : integer;
	num, sumaTotal : real;

BEGIN
	dim := 0;
	sumaTotal := 0;
	cargarVector(datos ,dim); { completar }
	writeln('Ingrese un valor a sumar');
	readln(num);
	modificarVectorySumar(datos, dim, num, sumaTotal);{completar}
	writeln('La suma de los valores es: ', sumaTotal);
	writeln('Se procesaron: ',dim, ' números')
end.
