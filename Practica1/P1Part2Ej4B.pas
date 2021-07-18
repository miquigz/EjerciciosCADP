{
  4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
	los dos números mínimos leídos.
   b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
	el número 0, el cual no debe procesarse
   
}


program Practica1Parte2Ejer4B;

var i,num,min,min2: integer;

BEGIN
	min:= 999; //establezco el primer min, como mucho mas pequenio que el min2.
	min2:= 1500;
	for i:= 10 downto 0 do
		begin
			if (i <> 0) then
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
		end;
	writeln('Los dos numeros minimos leidos son: ', min,' ', min2);
END.

