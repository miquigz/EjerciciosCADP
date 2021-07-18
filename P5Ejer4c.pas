program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;

VAR
	pc: puntero_cadena;
BEGIN
	new(pc); // asignamos una dir de memoria dinamica a la var pc tipo puntero.
	pc^:= 'un nuevo nombre'; //alojamos en el contenido de la var pc tipo puntero, esta string.
	writeln(sizeof(pc^), ' bytes'); //51 bytes.
	writeln(pc^); // 'un nuevo nombre' imprime.
	dispose(pc); //liberamos la dir de memoria dinamica de la var pc.
	pc^:= 'otro nuevo nombre'; // le estamos asignando a una dir: ??? , por ende no anda. No tiene dir asignada.
END.
