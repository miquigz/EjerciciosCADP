{
  a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
   
   
}


program Practica2Ej6;

function alto(num:integer):integer;
var
	max:integer;
begin
	max:= -4;
	while(num > -1)do
		if (num > max) then
			max:= num;
	alto:= max;
end;
var 
	num:integer;
BEGIN
	writeln(alto(num));
END.
