program Practica3Ejer6;

type
	microProcesadores = record
		marca:string;
		linea:string;
		cantCores:integer;
		velGhz:real;
		tam:integer;
	end;

procedure leerMP(var mp:microProcesadores);
begin
	writeln('Ingrese la marca del micro procesador');
	readln(mp.marca);
	writeln('Ingrese la linea del micro procesador');
	readln(mp.linea);
	writeln('Ingrese la cantidad de cores');
	readln(mp.cantCores);
	if (mp.cantCores <> 0) then // Si NO SE CUMPLE, no termine de leer, por ende NO se procesa.
	begin
		writeln('Ingrese la velocidad del reloj:');
		readln(mp.velGhz);
		writeln('Ingrese el tamanio de los transistores:');
		readln(mp.tam);
	end;
end;

(*mayor= a 22*)
procedure mayor22(mp:microProcesadores);//marca y linea de los procesadores de mas de 2 cores con tam >= 22.
begin
	if (mp.tam >= 22)then
		writeln('La marca: ', mp.marca, ' , linea: ', mp.linea, ' Tiene mas de 2 cores.');
end;

procedure contador14 (mp:microProcesadores; var cantActual:integer);
begin
	if (( mp.tam = 14 )) then
		cantActual:= cantActual + 1;
end;
	
(*dosmaximos*)
procedure dosMax(mp:microProcesadores; var cantActual:integer; var maxMarca:string; var maxMarca2:string; var max:integer; max2:integer);
begin
	if ( (cantActual > max) AND (mp.cantCores <> 0) ) then
	begin
		max2:= max;
		max:= cantActual;
		maxMarca2:= maxMarca;
		maxMarca:= mp.marca;
	end
	else if(cantActual > max2) then
	begin
		max2:= cantActual;
		maxMarca2:= mp.marca;
	end;
end;

(*multicore*)
procedure procesadoresMultiCore(mp:microProcesadores; var cantProceMC:integer);
begin
	if 	( (mp.cantCores	> 1) AND ( (mp.marca = 'Intel') OR (mp.marca = 'AMD') ) AND (mp.velGhz > 2) ) then
		cantProceMC:= cantProceMC + 1;
end;

(*principal*)
VAR
	cantProceMC, cantActual, max, max2:integer;
	mp:microProcesadores;
	marcaActual, maxMarca, maxMarca2 :string;
BEGIN
	maxMarca:= ' ';
	maxMarca2:= ' ';
	max:= -1;
	max2:= -5;
	marcaActual:= ' ';
	leerMP(mp);
	cantProceMC:= 0;
	while (mp.cantCores <> 0) do
	begin
		cantActual:= 0;
		marcaActual:= mp.marca;
		while ( (mp.cantCores <> 0) AND (mp.marca = marcaActual) ) do // Mientras la marca sea igual a la ingresada: no se sale de este while.
		begin
			mayor22(mp);
			contador14(mp, cantActual);
			procesadoresMultiCore(mp, cantProceMC);
			leerMP(mp);
		end;
		dosMax(mp,cantActual, maxMarca, maxMarca2, max, max2); // La variable cant actual es de transistores con tam >= 22
	end;
	writeln('Las 2 marcas con mayor cantidad de procesadores con transistores de 14 nm: ', maxMarca, maxMarca2);
	writeln('La cantidad de procesadores multicore de Intel o AMD, con velGHZ mayor a 2:', cantProceMC);
END.
