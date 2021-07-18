program P7ejer4;
const
	dimF = 42;
type
	subPeso = 1..42;
	pesoSemanas = array[subPeso]of integer;
	
	paciente = record
		nombre:string;
		apellido:string;
		peso:pesoSemanas; // vector del peso en cada semana
		semanas:subPeso; //es la dimL
	end;
	listaPacientes = ^nodo;
	nodo = record
		ele:paciente;
		sig:ListaPacientes;
	end;

procedure cargarSemanas(var pS:pesoSemanas;var dimL:integer);//SE DISPONE
procedure leerPaciente(var p:paciente);//SE DISPONE
procedure cargarLista(l:lista);//SE DISPONE

function mayorPeso(vec:pesoSemanas, dimL):integer;
var
	max, i, numSemana:integer;
begin
	max:= -99;
	for i:=2 to dimL do
	begin
		if (vec[i] > max) then begin
			max:=vec[i];
			numSemana:= i;
		end;
	end;
	mayorPeso:= numSemana - 1; //Porque subio el peso en la semana anterior, no en esa.
end;

(*Recorrido de la Lista*)
procedure recorrerLista(pri:listaPacientes);
var
	aumentoTotal:integer
begin
	while (pri <> nil) do
	begin
		pri^.ele.nombre
		aumentoTotal:= pri^.ele.peso[pri^.ele.semanas] - pri^.ele.peso[1]; //la ultima semana, menos la primera.
		
		writeln('La semana de mayor peso de: ', pri^.ele.nombre, ' fue la numero :', mayorPeso(pri^.ele.peso, pri^.ele.semanas));
		writeln('Aumento total de peso fue: ', aumentoTotal);
		pri:= pri^.sig;
	end;	

end;
(*Programa Principal*)
VAR
	pri:listaPacientes;

BEGIN
	pri:=nil;
	cargarLista(pri); // se dispone
	recorrerLista(pri);
END.
