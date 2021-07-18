//	3) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
//	escritorio.
program punteros;
type
	numeros = array[1..10000] of integer;
	puntero_numeros = ^numeros;

VAR
	n: puntero_numeros;
	num: numeros;
	i:integer;
begin
	writeln(sizeof(n), ' bytes'); // 4 bytes, es solo el puntero.
	writeln(sizeof(num), ' bytes'); // 2 * 10k = 20k
	new(n);
	writeln(sizeof(n^), ' bytes'); // 2 * 10k = 20k
	for i:= 1 to 5000 do
		n^[i]:= i;
	writeln(sizeof(n^), ' bytes'); // 20k, no importa si estan o no cargados.
end.
