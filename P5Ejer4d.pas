program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena); //no esta por referencia la var pun, por ende no hace nada.
begin
	new(pun);
	pun^:= 'Otro texto'; // si hacemos un write aca, si escribiria 'otro texto'.
end;

VAR
	pc: puntero_cadena;

BEGIN
	new(pc); //Asignamos una dir de memoria dinamica a pc
	pc^:= 'Un texto'; //alojamos en el contenido de la memoria dinamica de pc: 'un texto'
	writeln(pc^); // Escribe: 'Un texto'
	cambiarTexto(pc); //Declaramos el procedimiento cambiarTexto, el cual no modifica nada en el prog principal.
	writeln(pc^); // escribe: 'un texto'
END.
