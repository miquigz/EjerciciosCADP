program Ej11Practica2Parte2;
procedure nroMin(nroIns:integer; apellido:string; var min:integer; var min2:integer; var apeMin:string; var apeMin2:string);
begin
	if (nroIns < min) then // Preguntamos acerca de los 2 numeros minimos de nroIns
	begin
		min2:= min; // Guardamos el min1 en min2, si se cumple la condicion
		min:= nroIns;
		apeMin2:= apeMin; // Guardamos el apellido de min1 en min2, si se cumple la condicion.
		apeMin:= apellido;
	end
	else if (nroIns < min2) then
	begin
		min2:= nroIns;
		apeMin2:= apellido;
	end;
end;{
*  nota mia: No podemos poner el max-min como variables locales, ya que si las hacemos locales
*  vamos a tener que inicializarlas dentro del modulo, y si queremos repetir el modulo, vamos a perder
*  el valor de los max-min.}
procedure nroMax (nroIns:integer; nombre:string; var max:integer; var max2:integer; var nombreMax:string; var nombreMax2:string);
begin
	if ( nroIns > max) then // preguntamos los 2 nroIns Mas grandes (max)
	begin
		max2:= max;
		max:= nroIns;
		nombreMax2:= nombreMax;
		nombreMax:= nombre;
	end
	else if (nroIns > max2) then
	begin
		max2:= nroIns;
		nombreMax2:= nombre;
	end;
end;
procedure porcentaje(nroIns:integer; var cantPares:integer; cantAlumnos:integer);
begin
	cantAlumnos:= cantAlumnos +1;
	if ( (nroIns mod 2) = 0) then //preguntamos si es par, si lo es sumamos cantPares.
		cantPares:= cantPares + 1;
end;
var {Variables programa principal}
	min, min2, max, max2, cantPares, cantAlumnos, nroIns: integer;
	apellido, nombreMax2, nombreMax, apeMin, apeMin2, nombre:string;
BEGIN
	{Variables incializadas del primer modulo, nroMin: }
	min:= 999; // ponemos el min1 como mas MINIMO que el min2
	min2:= 1005;
	apeMin:= 'Nada';
	apeMin2:= 'Nada2';
	{Variables incializadas del segundo modulo, nroMax: }	
	max:= -1; // ponemos el max como mas MAXIMO que el max2
	max2:= -5;
	nombreMax:= 'Nada1';
	nombreMax2:= 'Nadas2';
	{Variables inicializadas del tercer modulo, porcentaje.}
	cantPares:= 0;
	cantAlumnos:=0;
	repeat   // repetir hasta el Numero de inscripcion 1200.
		writeln('Ingrese numero de inscripcion, apellido, nombre: ');
		readln(nroIns);
		readln(apellido);
		readln(nombre);
		nroMin(nroIns, apellido, min, min2, apeMin, apeMin2); // ingresamos las variables al modulo.
		nroMax(nroIns, nombre, max, max2, nombreMax, nombreMax2);
		porcentaje(nroIns, cantPares, cantAlumnos);
	until ( nroIns = 1200 );
	writeln('Apellido de los alumnos con nro de ins mas chico: ', apeMin,' ', apeMin2);
	writeln('Nombre de los alumnos con nro de ins mas grande: ', nombreMax,' ', nombreMax2);
	writeln('Porcentaje: ', ( (cantPares * 100)/cantAlumnos) );
END.
