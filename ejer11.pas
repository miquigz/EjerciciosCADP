program ejer11Practica4part1;
const
	dimF = 200;
type
	fotos = record
		titulo:string;
		autor:string;
		cantLike:integer;
		cantClics:integer;
		cantComent:string;
	end;
	album = array[1..dimF] of fotos;

procedure cargarDatos(var vec:album);
var
	i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('Escriba el titulo de la foto:');
		readln(vec[i].titulo);
		writeln('Escriba el autor de la foto:');
		readln(vec[i].autor);
		writeln('Escriba la cantidad de likes de la foto:');
		readln(vec[i].cantLike);
		writeln('Escriba la cantidad de clics de la foto:');
		readln(vec[i].cantClics);
		writeln('Escriba la cantidad de comentarios de la foto:');
		readln(vec[i].cantComent);
	end;
end;

(*La foto mas visitada*)
function masVista(vec:album):string;
var
	maxTitulo:string;
	i, max:integer;
begin
	maxTitulo:= 'a';
	max:= -999;
	for i:=1 to dimF do
	begin
		if (vec[i].cantClics > max) then
		begin
			max:= vec[i].cantClics;
			maxTitulo:= vec[i].titulo;
		end;
	end;
	masVista:= maxTitulo;
end;

(*Likes de Vandelay*)
function cantTotal(vec:album):integer;
var
	i, total:integer;
begin
	total:= 0;
	for i:=1 to dimF do
	begin
		if (vec[i].autor = 'Art Vandelay') then
		begin
			total:= total + vec[i].cantLike;
		end;
	end;
	cantTotal:= total;
end;
	
(*Cantidad de comentarios c/u*)	
procedure cantCom(var vec:album);
var
	i:integer;
begin
	for i:=1 to dimF do
		writeln('La cantidad de comentarios de la foto: ', vec[i].titulo, ' fue: ', vec[i].cantComent);
end;
	
(*Programa principal*)
VAR
	vec:album;

BEGIN
	cargarDatos(vec);
	writeln('La foto mas vista fue: ' ,masVista(vec));
	writeln('La cantidad de likes del autor Vandelay fue: : ' ,cantTotal(vec));
	cantCom(vec);
END.
