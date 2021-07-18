{
  4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
	los dos números mínimos leídos.
   
   
}


program Practica1Parte2Ejer4;

var i,num,min,min2: integer;

BEGIN
	min:= 999; //establezco el primer min, como mucho mas pequenio que el min2.
	min2:= 1500;
	for i:= 1 to 1000 do
		begin
			num:= 0;
			readln(num); // lee el primer numero
			if (num < min) then // si el num que inserte es menor a min
				begin
					min:= min2; // aca yo guardo el primer min
					min:= num; // lo establezco como min
				end
			else if (num < min2) then // si no es menor al min principal, pregunta el 2do min.
					min2:= num; // establezco ese num como nuevo min2, si hab'ia un anterior min2 desaparece.
		end;
	writeln('Los dos numeros minimos leidos son: ', min,' ', min2);
END.

