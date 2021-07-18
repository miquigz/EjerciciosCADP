//	4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
//	escritorio. 
program punteros; // a)
type
	cadena = string[50];
	puntero_cadena = ^cadena;
VAR
	pc: puntero_cadena;
	
begin
	pc^:= 'un nuevo texto'; // No se le puede asignar algo al puntero PC, ya que no le cargamos una direccion de memoria dinamica.
	new(pc);
	writeln(pc^); // no imprime nada, porque el puntero no tiene cargado nada.
end.
