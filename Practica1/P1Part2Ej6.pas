{
  6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
	se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
	- Los códigos de los dos productos más baratos.
	- La cantidad de productos de más de 16 pesos con código par
   
   
}


program Practica1Parte2Ejer6;


var i,cod, price, min, min2, codMin,codMin2, cantMas: integer;

BEGIN
	min:=999;
	min2:= 1500;
	codMin:= 0;
	codMin2:= 0;
	cantMas:= 0;
	for i:= 1 to 5 do
		begin
			cod:=0;
			price:=999;
			writeln('ingresar codigo del producto y precio: ');
			readln(cod, price);
			if (price < min) then
				begin
					min2:= min;
					min:= price;
					codMin:= cod
				end
			else if (price < min2) then
				begin
					min2:= price;
					codMin2:= cod;
				end;
			if ( (price > 16) AND ( (cod mod 2) = 0) ) then
				cantMas:= cantMas+1;
		end;
	writeln('Los codigos de los productos mas baratos:', codMin, ' ',codMin2);
	writeln('La cantidad de productos con mas de 16 pesos con codigo par: ', cantMas);
END.

