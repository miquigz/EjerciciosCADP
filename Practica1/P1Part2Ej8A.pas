{
 a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas
   
}


program Practica1Parte2Ejer8A;

var i, ventas, suma, monto, max: integer;

BEGIN
	max:= -1;
	suma:= 0;
	
	for i:= 1 to 5 do
		begin
			monto:= -1;
			ventas:= 0;
			while ( monto <> 0) do
				begin
					writeln('Ingrese el monto de la venta: ');
					readln(monto);
					ventas:= ventas + 1;
					suma:= suma+monto;
					if (ventas > max) then
						max:= i;
				end;
			writeln('La cantidad de ventas de hoy fue:', ventas -1);
		end;
	writeln('La suma total en el mes de ventas fue: ', suma);
	writeln('El dia de mayor ventas fue:', max);
END.
