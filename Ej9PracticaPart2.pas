{
   
}


program Practica2Parte2Ej9;

procedure cantDigitos(var num:integer; var suma:integer; cantDig:integer);
begin
	writeln('ingrese un numero entero:');
	readln(num);
	while (num <> 0) do
	begin
		suma:=suma + (num mod 10);
		
	end;
	
	

end;

var
	num,suma, cantDig:integer;

BEGIN
	num:=0;
	suma:=-0;
	cantDig:=0;
	cantDigitos(num, suma, cantDig);	
	writeln('La suma de los digitos fue: ', suma);
	writeln('Cantidad de digitos fue: ', cantDig);
END.

