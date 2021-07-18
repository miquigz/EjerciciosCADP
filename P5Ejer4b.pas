program punteros; //b)
type
	cadena = string[50];
	puntero_cadena = ^cadena;

VAR
	pc: puntero_cadena;
begin
	new(pc); // creamos y a la vez asignamos una dir de memoria dinamica a pc.
	pc^:= 'un nuevo nombre'; 
	writeln(sizeof(pc^), ' bytes'); // 51
	writeln(pc^); // escribe: 'Un nuevo nombre'
	dispose(pc); // liberamos la dir de memoria enlazada a pc.
	pc^:= 'otro nuevo nombre'; //No tiene enlazada ninguna dir de memoria, por ende no anda.
end.
