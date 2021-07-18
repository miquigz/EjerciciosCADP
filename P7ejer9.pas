program P7ejer9;
type

	subCod = 1..8;
	
	peliculas = record
		codPeli:integer;
		title:string;
		codGenero:subCod;
		puntaje:real;
	end;
	
	
	listaPeliculas = ^nodo;
	nodo = record
		ele:peliculas;
		sig:listaPeliculas;
	end;


	critica = record
		dni:integer;
		apellido:string;
		nombre:string;
		codPelicula:integer;
		puntaje:real;
	end;
	
	listaCriticas


VAR

BEGIN
	
	
END.

