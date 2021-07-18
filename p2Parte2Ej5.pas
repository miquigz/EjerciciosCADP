program P2Parte2Ej5;
procedure retornar(numA,numB:integer);
var
	pares, paresMayores:integer;
begin
	pares:= -2; // nos toma los dos 0 como pares, por ende inicializamos en -2
	paresMayores:=-1; // al final los dos 0, nos lo toma como >= (iguales).
	while ( (numB <> 0) AND (numA <> 0) ) do
	begin
		writeln('Ingrese el valor de numA y numB');
		readln(numA, numB);
		if ( ( (numB mod 2) = 0) AND ( (numA mod 2) = 0) ) then //pregunta si los 2 son par
			begin
				if ( (numB ) >= (numA*2) ) then // pregunta si par numB es mayor q el doble de A
					paresMayores:=paresMayores+1;
				pares:=pares+2;
			end
			else if ( ((numB mod 2)=0) OR ((numA mod 2)=0) ) then //ELSE IF, si alguno es par.
				pares:= pares+1;
	end;
	writeln('pares: ',pares, ' pares mayores: ', paresMayores); //Imprime finalmente.
end;
var
	num1,num2:integer;
BEGIN
	num1:=1;
	num2:=1; // si ponemos el valor 0, no anda el while
	retornar(num1, num2);
END.
