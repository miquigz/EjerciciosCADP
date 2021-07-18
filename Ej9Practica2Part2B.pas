{

}
program Ej9Pract2Part2;

procedure retornar(num:integer; var cantDig:integer; var suma:integer);
begin
	while (num <> 0) do // la descomposicion del num frena cuando num es 0
	begin // muy importante poner la suma antes del: num DIV 10
		suma:= (num MOD 10) + suma; // sumamos el resto(el mod), ejemplo si es 42 mod 10, el resto es 2, entonces lo sumamos.
		num:= num DIV 10;  // dividimos el numero, asi vamos disminuyendo digitos. por lo cual 42 DIV 10 es: 4, entonces como ya tenemos el digito sumado por arriba, podemos disminuir su num.
		cantDig:= cantDig +1; // sumamos la cantidad de digitos.
	end;
end;

var
	suma,cantDig,num:integer;

BEGIN
	repeat // MUY IMPORTANTE, tener suma y cantDig, reseteandose constantemente(DENTRO DEL REPEAT).
		suma:= 0;
		cantDig:= 0;
		writeln('ingrese num entero: ');
		readln(num);
		retornar(num, cantDig, suma);
		writeln('Cant de dig: ', cantDig, ' suma de dig: ', suma);
	until(suma = 10);
END.
