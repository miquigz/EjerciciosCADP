{
4. Dado los siguientes programas, explicar la diferencia.
* 
* En este programa, a diferencia del B, usamos una variable global, la cual es modificada en el procedure,
* y tambien en el programa principal.
}

program alcance4a;
var a,b: integer;
procedure uno;
begin
a := 1;
writeln(a);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.
