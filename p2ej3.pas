{ 	3. Dado el siguiente programa, indicar cuál es el error y su causa.
* 
	Aca el error esta en intentar usar en el programa principal una variable de un procedure.
	* Esto no se puede hacer.
   
}

program alcance3;
	var a: integer;
procedure uno;
	var b: integer;
begin
	b:= 2;
	writeln(b);
end;
begin
	a:= 1;
	uno;
	writeln(a, b);
end.
