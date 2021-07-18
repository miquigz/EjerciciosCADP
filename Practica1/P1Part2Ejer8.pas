{
  8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
   
}


program Practica1Parte2Ej8;

var i, ventas, suma, monto: integer;

BEGIN
	suma:=0;
	for i:= 1 to 31 do
		begin
			ventas:=0;
			monto:=-1;
			while ( monto <> 0) do
			begin
				writeln('Ingrese el monto de las ventas:');
				readln(monto);
				suma:= suma + monto;
				ventas:= ventas+1;
			end;
			writeln('Las ventas de hoy fueron: ', ventas - 1);
// Como lee el monto en el while, tenemos que restarle 1, ya que el 0 tambien lo cuenta.
		end;
	writeln('El monto acumulado por ventas fue:', suma);
END.

