//	2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
//	escritorio.
program punteros;
type
	cadena = string[9];
	producto = record
		codigo: integer;
		descripcion: cadena;
		precio: real;
	end;
	puntero_producto = ^producto;

VAR
	p: puntero_producto;
	prod: producto;
BEGIN
	writeln(sizeof(p), ' bytes'); // 4 bytes, es solo el puntero.
	writeln(sizeof(prod), ' bytes'); // 2 + 9+1 + 4 = 16 (teoria).        pascal te da: 4+10+8= 22. 
	new(p);
	writeln(sizeof(p), ' bytes'); // 4 bytes, es solo el puntero.
	p^.codigo := 1;
	p^.descripcion := 'nuevo pro'; //
	writeln(sizeof(p^), ' bytes'); // 4 pascal bytes, teoria 2 bytes.
	p^.precio := 200;
	writeln(sizeof(p^), ' bytes'); // aunque no esten cargados los registros, valen la suma de sus campos.
	prod.codigo := 2;
	prod.descripcion := 'otro nu';
	writeln(sizeof(prod), ' bytes'); //no importa el contenido que tenga, van a valer lo mismo, con o sin inicializados.
END.
