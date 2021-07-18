program P7ejer7;
const
	dimF = 24;
type
	subNotas = 4..10;// los aplazos no se registran. (Notas que aprob'o)
	
	vecNotas = array[1..dimF]of subNotas;
	
	alu = record
		num:integer;
		apellido:string;
		nombre:string;
		email:string;
		anioI:integer;
		anioE:integer;
		nota:vecNotas; //damos por sentado q es una nota c/u por materia (sino seria vec de listaNota)
	end;
	
	persona = record
		apellido:string;
		nombre:string;
		email:string;
	end;
	
	listaAlumnos = record
		ele:alu;
		sig:ListaAlumnos;
	end;
	
procedure insertarOrdenado(var vec:vecNotas; num:subNotas; var dimL:integer);	
begin
	



end;
(*Leer registro*)	
procedure leerRegistro(var alumno:alu);
var
	i:integer;
	auxNota: subNotas;
begin
	writeln('Ingrese num de alu: '); readln(alumno.num);
	if (alumno.num <> -1) then begin
		with alumno do begin
			writeln('Ingrese apellido del alumno	'); readln(apellido);
			writeln('Ingrese nombre del alumno		'); readln(nombre);
			writeln('Ingrese email del alumno		'); readln(email);
			writeln('Ingrese anio ingreso del alumno'); readln(anioI);
			writeln('Ingrese anio egreso del alumno '); readln(anioE);
		end;
		for i:=1 to dimF do begin
			writeln('Ingrese nota de la materia numero :', i);
			readln(auxNota);
			insertarOrdenado(alumno.nota, auxNota);
		end;
	end;
end;
	
procedure cargarLista(var pri:listaAlumnos; var ult:listaAlumnos);
var
	nuevo:listaAlumnos;
	alum:alu;
begin
	leerRegistro(alum);
	while (alum.num <> -1) do begin
		new(nuevo); nuevo^.ele:= alum; nuevo^.sig:= nil;
		if (pri = nil) then
			pri:= nuevo
		else
			ult^.sig:= nuevo;
		ult:= nuevo;
		leerRegistro(alum);
	end;
end;

procedure dosMax(anios:integer; actual:persona; var max:integer; var max2:integer; var maxN:persona; var maxN2:persona);
begin
	if (anios > max) then begin
		max2:= max;
		maxN2:= maxN;
		max:= anios;
		maxN:= actual;
	end
	else if (anios > max2) then begin
		max2:= anios;
		maxN2:= actual;
	end;
end;

procedure recorrer(pri:listaAlumnos);
var
	i, sumaTotal, cant2012, anios:integer;
	maxN, maxN2, actual:persona;
begin
	cant2012:=0; max:= -999; max2:= -999;
	maxN.apellido:= ''; maxN.nombre:= ''; maxN.email:= '';
	while (pri <> nil) do begin
		sumaTotal:=0;
		for i:=1 to dimF do
			sumaTotal:= sumaTotal + pri^.ele.nota[i];
		writeln('El promedio del alumno: ', pri^.ele.apellido ,' ',pri^.ele.nombre);
		writeln('Fue:', sumaTotal/dimF);
		if (esPar(pri^.ele.cod) AND (pri^.ele.anioI = 2012) ) then
			cant2012:= cant2012 + 1;
		anios:= pri^.ele.anioE - pri^.ele.anioI;
		actual.nombre:= pri^.ele.nombre; actual.apellido:= pri^.ele.apellido; 
		actual.email:= pri^.ele.email;
		dosMax(anios, actual, max, max2, maxN, maxN2);
		pri:= pri^.sig;
	end;
end;
	
VAR	
	pri, ult:listaAlumnos;
	
BEGIN
	pri:=nil;
	cargarLista(pri, ult);
	recorrer(pri);
END.
