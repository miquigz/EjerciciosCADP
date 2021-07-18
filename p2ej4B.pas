{
 En este ejercicio, a diferencia del A, no podemos utilizar una variable del programa principal
 * Dentro de un procedure, por lo cual no nos compila el codigo. 
 * Ya que no es una variable global, si nosotros inicializamos debajo de los procesos. Y no arriba de ellos.
}


program alcance4b;
procedure uno;
begin
a := 1;
writeln(a);
end;
var a,b: integer;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.
