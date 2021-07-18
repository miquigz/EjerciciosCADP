{
 
}

program Practica2Part2Ejercicio10;

procedure paresEimpares(num:integer; var sumaPares:integer; var cantImpares:integer);
begin
	while (num <> 0) do
	begin // pregunta si es EL DIGITO ES PAR.
		if ( ( (num mod 10) mod 2) = 0) then // PREGUNTA SI EL RESULTADO (DEL RESTO DE NUM MOD 10), si el resultado divido 2 te da de resto 0, si da resto 0 es PAR.
			begin // sumamos el digito PAR.
				sumaPares:= (num mod 10) + sumaPares;
			end
		else if ( ( (num mod 10) mod 2)= 1) then // Pregunta si el resto de num MOD 10, divido por 2, te da resto 1 , si se cumple el digito es IMPAR. por ende; sumamos cantImpares.
			begin
				cantImpares:= cantImpares+1;
			end;
		num:= num div 10; // MUY IMPORTANTE NO OLVIDARSE DEL DIV, sino el while va a ser infinito.
	end;
end;

var
	num, sumaPares, cantImpares:integer;

BEGIN
	readln(num); // Primero leemos el primer numero entero, fuera del while.
	while ( num <> 12345 ) do // MIENTRAS NUM SEA DISTINTO A 123456, leemos secuencias de numeros, aplicamos el modulo.
	begin  // SI Ponemos 6 digitos, no lo toma como entero, por ende, ponemos 12345 nada mas.
		cantImpares:= 0;
		sumaPareS:=0;
		paresEimpares(num, sumaPares, cantImpares);
		writeln('Cantidad de digitos Impares: ', cantImpares, ' La suma de digitos pares: ', sumaPares);
		writeln('Escriba un numero entero: ');
		readln(num); // luego de finalizar el while, volvemos a leer el num, muy importante poner el read al final.
	end;
END.
