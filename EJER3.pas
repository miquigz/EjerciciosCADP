program ejer3Practica4Parte2;
const
	dimF = 200;
type
	marzo = record
		dia:integer; // dia del mes de marzo
		monto:real; // monto transportado
		distancia:real; // distancia en km del viaje
	end;
	viajes = array[1..dimF] of marzo;
	mes = array[1..31] of integer;

(*Cargar el vector*) // a)
procedure cargarViajes(var vec:viajes; var dimL:integer);
var
	dia:integer;
	monto, distancia:real;
begin
	d:=0; mont:=0; dis:=0; dimL:=0;
	writeln('Ingrese dia, monto y distancia del mes del viaje: ');
	readln(dia); {  } readln(monto); {  } readln(distancia);
	
	while (  (dimL < dimF) AND (dis <> 0) ) do
	begin
		dimL:= dimL+1;
		vec[dimL].dia:= d; vec[dimL].monto:= mont; vec[dimL].distancia:= dis;
		writeln('Ingrese dia, monto y distancia del mes del viaje: ');
		readln(dia); {  } readln(monto); {  } readln(distancia);
	end;
end;

(*Calculamos prom, monto min, cantViajes*) // b)
procedure calcular(vec:viajes; dimL:integer; var promedio:real; var cantDias:mes; minDia:integer; var minDistancia:integer);
var
	i:integer;
	min, suma:real;
begin
	suma:=0; min:= 999; promedio:= 0;
	for i:= 1 to dimL do
	begin
		suma:= suma + vec[i].monto; //suma total para sacar prom.
		if (vec[i].monto < min)then
			pos:= i; // guardo la pos del vector de viajes.
		cantDias[vec[i].dia]:= cantDias[vec[i].dia] + vec[i].dia; // cargo el vector de cantDias.
	end;
	promedio:= suma / dimL;
	minDia:= vec[pos].dia;
	minDistancia:= vec[pos].distancia;
end;

(*Informamos los datos del modulo Calcular*) // b)
procedure informar(var cantDias:mes; var promedio:real; var minDia:integer; var minDistancia:integer);
var
	i:integer;
begin
	writeln('El promedio del monto en todos los viajes realizados fue: ', promedio:4:2);
	writeln('La distancia y dia del viaje con menor monto transportado fue: ', minDia, ' ', minDistancia);
	for i:= 1 to 31 do
		writeln('La cantidad de viajes en el dia: ', i, ' fue: ', cantDias[i]);
end;

(* Eliminar pos = 100 *) // c
procedure eliminarIgual100(vec:viajes; var eliminados:viajes; dimL:integer; dimL2:integer);
var
	pos, i, j:integer;
begin
	dimL2:= dimL; // copio el valor de dimL
	for i:=1 to dimL do
	begin
		if (vec[i].distancia = 100) then // voy preguntando en que pos la distancia es = 100.
		begin
			for j:= i to (dimL2-1) do // si se cumple, elimino la pos de i
				eliminados[j]:= eliminados[j+1]; //sobrescribo el vector 'eliminados'
			dimL2:= dimL2-1;// disminuyo en 1, la dim logica del vector 'eliminados'
		end;
	end;
end;

(*Programa Principal*)
VAR
	cantDias:mes;
	vec, eliminados:viajes;
	dimL, dimL2:integer;
	promedio:real
BEGIN
	cargarViajes(vec,dimL);
	eliminados:= vec;
	calcular(vec, dimL, promedio, cantDias, minDia, minDistancia);
	informar(cantDias, promedio, minDia, minDistancia);
	eliminarIgual100(vec, eliminados, dimL, dimL2);
END.
