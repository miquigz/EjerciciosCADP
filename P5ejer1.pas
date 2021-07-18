//	1) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
//	escritorio.
program punteros;
type
	cadena = string[50];
	puntero_cadena = ^cadena;
var
	pc: puntero_cadena;
begin
	writeln(sizeof(pc), ' bytes'); // Imprime 4 
	new(pc);
	writeln(sizeof(pc), ' bytes'); // Imprime 4 ya que no estamos senialando su contenido ^ , solo la var puntero
	pc^:= 'un nuevo nombre'; //
	writeln(sizeof(pc), ' bytes'); // 4 el puntero vale 4
	writeln(sizeof(pc^), ' bytes'); //51, el contenido del puntero (string 50) vale 50 + 1.
	pc^:= 'otro nuevo nombre distinto al anterior'; 
	writeln(sizeof(pc^), ' bytes'); //51 el contenido del puntero (string50) Vale 50 + 1
end.
