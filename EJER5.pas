program Ejer5Practica4Parte2;
const
	dimF = 500;

type	
	stringAF = 'A'..'F';
	codigo = 1..2400;
	//
	rFecha = record
		dia:integer;
		mes:integer;;
		anio:integer;
	end;
	//
	rCiudad = record
		codigo:integer;
		cantClientes:integer;
	end;
	//
	cliente = record
		fecha:rFecha; //fecha de firma contrato
		categoria:stringAF; // categoria monotributo (A-F).
		cod:codigo; // codigo de ciudad 
		monto:real; //monto mensual
	end;
	
	monotributistas = array [1..dimF] of cliente;
	
	categorias = 	  array [stringAF] of integer;
	
	ciudades =   	  array [codigo] of rCiudad; 
	


(*Cargar datos*)
procedure cargarClientes(var vec:monotributistas);
var
	i:integer
	aux:cliente;
begin
	for i:=1 to dimF do
	begin
		writeln('Ingrese: fecha(dia,mes,anio), categoria, codigo, y monto');
		readln(aux.fecha.dia); readln(aux.fecha.mes); readln(aux.fecha.anio);
		readln(aux.categoria); readln(aux.cod); readln(aux.monto);
		vec[i].fecha.dia:= aux.fecha.dia; vec[i].fecha.mes:= aux.fecha.mes; vec[i].fecha.anio:= aux.fecha.anio;
		vec[i].categoria:= aux.categoria; vec[i].cod:= aux.cod; vec[i].monto:= aux.monto;
	end;
end;

(*Cant contratos por mes, anio*) //1
procedure CantContratos(vec:monotributistas);
var
	i:integer;
	anioActual, mesActual:integer;
begin
	pos:=1;
	while (pos < dimF) do
	begin
		cantAnio:=0;
		anioActual:= vec[pos].fecha.anio; 
		while ( vec[pos].fecha.anio = anioActual ) then
		begin
			cantMes:=0;
			mesActual:=vec[pos].fecha.mes;
			while (vec[pos].fecha.mes = mesActual) do
			begin
				cantMes:= cantMes+1;
				pos:= pos + 1;
			end;
			wrtieln('La cantidad de contratos del mes: ', mesActual, ' fue: ', cantMes);
			cantAnio:= cantAnio + cantMes;
		end;
		writeln('La cantidad de contratos del anio: ', anioActual, ' fue: ', cantAnio);
	
	end;
end;

(*Inicializamos el vector categorias*) //2
procedure inicioCategorias(var cat:categorias); //si o si necesitamos incializar este vector
var// , ya que cuando contamos los clientes, estariamos sumando a variables sin valor
	i:string;
begin
	for i:='A' to 'Z' do
		cat[i]:=0;
end;

(*Cantidad de clientes para cada categoria*) //2
procedure cantClientes( vec:monotributistas; var cat:categorias);
var
	i:integer;
begin
	for i:1 to dimF do // si el vector NO estuviese incializado no podriamos sumarle nada.
		cat[vec[i].categoria]:= cat[vec[i].categoria + 1;
end;

procedure 



//faltan 3 y 4.




VAR // La información se ingresa ordenada por fecha de firma de contrato (los más antiguos
// primero, los más recientes últimos).

BEGIN
	
	
END.

