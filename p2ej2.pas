{
   Aca imprime  3, 31. 
   * Esto se debe a que el procedure, no tiene una variable propia, entonces
   * cambia la variable global. 
   * Si el procedure tuviese una variable propia, con el mismo nombre que una var global
   * no pasar'ia nada, (Como es en el caso del ejercicio 1).
}

program alcance2;
var a,b: integer;
procedure uno;
begin
b := 3;
writeln(b);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.
