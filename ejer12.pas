program ejer12Practica4Parte1;
const
	dimF = 53;
type
	galaxia = record
		nombre:string;
		tipo:integer;
		masa:real;
		distancia:real;
	end;
	unionAI = array[1..dimF] of galaxia; // union astronomica internacional.

procedure leerDatos(var vec:unionAI);
var
	i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('Ingrese nombre de la galaxia: ');
		readln(vec[i].nombre);
		writeln('Ingrese tipo de la galaxia: ');
		readln(vec[i].tipo);
		writeln('Ingrese masa de la galaxia: ');
		readln(vec[i].masa);
		writeln('Ingrese distancia de la galaxia: ');
		readln(vec[i].distancia);
	end;
end;

(*Cant galaxias No irregulares, y distancia < 1k *)
function cantNoIrre1K(vec:unionAI):integer;
var
	cant, i:integer;
begin
	cant:= 0;
	for i:=1 to dimF do
	begin
		if ( (vec[i].tipo <> 4) AND ( vec[i].distancia < 1000 ) ) then
			cant:= cant + 1;
	end;
	cantNoIrre1K:= cant;
end;

(*Cantidad de tipos*)
procedure cantTipos(vec:unionAI; var tipo1:integer; var tipo2:integer; 
					var tipo3:integer; var tipo4:integer);
var
	i:integer;
begin
	tipo1:= 0; tipo2:= 0; tipo3:= 0; tipo4:= 0;
	for i:=1 to dimF do
	begin
		if (vec[i].tipo = 1) then tipo1:=tipo1 + 1;
		if (vec[i].tipo = 2) then tipo2:=tipo2 + 1;
		if (vec[i].tipo = 3) then tipo3:=tipo3 + 1;
		if (vec[i].tipo = 4) then tipo4:=tipo4 + 1;
	end;	
end;

(*2 maximos y 2 minimos*)
procedure maxYmin(vec:unionAI; var max1N:string; var max2N:string; var min1N:string; var min2N:string);
var
	i:integer;
	min1, min2 , max1, max2:real;
	
begin
	max1:= -555; max2:=-555; max1N:= ' ';  max2N:= ' ';
	min1:= 5555; min2:= 5555; min1N:= ' ';  min2N:= ' ';
	for i:=1 to dimF do
	begin // maximos:
		if (vec[i].masa > max1 ) then
		begin
			max2:= max1;
			max2N:= max1N;
			max1:= vec[i].masa;
			max1N:= vec[i].nombre;
		end
		else if ( vec[i].masa > max2 ) then
		begin
			max2:= vec[i].masa;
			max2N:= vec[i].nombre;
		end;
		// minimos:
		if (vec[i].masa < min1 ) then
		begin
			min1:= min1;
			min2N:= min2N;
			min1:= vec[i].masa;
			min1N:= vec[i].nombre;
		end
		else if ( vec[i].masa < min2 ) then
		begin
			min2:= vec[i].masa;
			min2N:= vec[i].nombre;
		end;
	end;
end;

(*Porcentaje q representa a la masa de todas las galaxias.*)
function porcentajeMasa3(vec:unionAI):real;
var
	i:integer;
	total3, total:real;

begin
	total:=0; total3:=0;
	for i:=1 to dimF do
	begin
		total:= total + vec[i].masa;
		if ( (vec[i].nombre = 'Via Lactea') OR (vec[i].nombre = 'Andromeda') 
			OR (vec[i].nombre = 'Triangulo') ) then
		begin
			total3:= total3 + vec[i].masa;
		end;
	end;
	porcentajeMasa3:= total3 / total * 100;
end;
	
(*Programa Principal*)
VAR
	vec:unionAI;
	tipo1, tipo2, tipo3, tipo4:integer;
	min1N, min2N, max1N, max2N:string;
	
BEGIN
	leerDatos(vec);
	cantTipos(vec ,tipo1, tipo2, tipo3, tipo4);
	writeln('Cantidad de las galaxias segun el tipo: 1-2-3-4: ', tipo1, ' ', tipo2, ' ', tipo3, ' ', tipo4);
	writeln('cant de Galaxias no irregulares, con PC menor a 1k de la tierra: ', cantNoIrre1K(vec));
	writeln('Porcentaje q representa la masa de via lactea, andromeda, triangulo, en relacion de las demas masas:', porcentajeMasa3(vec), '%');
	maxYmin(vec, max1N, max2N, min1N, min2N);
	writeln('las dos galaxias con mayor masa: ', max1N, ' ', max2N);
	writeln('las dos galaxias con menor masa: ', min1N, ' ', min2N);
END.
