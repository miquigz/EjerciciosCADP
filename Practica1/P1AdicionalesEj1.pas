{ ADICIONALES:
Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000
   
}

program P1AdicionalesEj1;

var i, cod, cantInversiones, cant50k, codMayor: integer;
var mayor50k: boolean;
var promedio, monto, max: real;

BEGIN
	max:= -1;
	codMayor:= 0;
	cant50k:= 0;
	repeat
		promedio:= 0;
		mayor50k:= false;
		cod:= 0;
		cantInversiones:=0;
		monto:=0;
		writeln('Ingrese codigo de empresa: ');
		readln(cod);
		writeln('Ingrese la cantidad de inversiones de su empresa:');
		readln(cantInversiones);
		
		for i:=1 to cantInversiones do
			begin
				writeln('Ingrese el monto de la inversion:');
				readln(monto);
				promedio:= promedio + monto;
				if ( (monto > 50000) AND ( mayor50k = false) ) then
					mayor50k:= true;
			end;
		if (mayor50k) then
			cant50k:= cant50k+1;	
		writeln('Resultado del analisis: Empresa: ',cod,' Promedio: ', (promedio / cantInversiones):6:2);
		if (promedio > max) then
			begin
				max:= promedio;
				codMayor:= cod;
			end;
	until (cod = 100);
	writeln('La cantidad de empresas con inversion mayor a 50000 fue: ', cant50k);
	writeln('La empresa ',codMayor,' es la que mayor dinero posee invertido: ', max:4:2);
END.
