{
5) Dado el siguiente programa, indicar cuál es el error.
   
   La variable "a" no esta inicializada.
}

program alcance4;
function cuatro: integer;
begin
	cuatro:= 4;
end;
	var a: integer;
begin
	cuatro;
	writeln(a);
end.
