program Practica2Parte2Ejer8;
procedure baratos(var min:integer; var min2:integer; cod:integer; precio:integer; var barato:integer; var barato2:integer);
begin // pregunta los MIN de los precios, y luego guarda el cod
	if (precio < min) then
		begin
			min2:= min;
			min:= precio;
			barato2:= barato;
			barato:=cod;
		end 
	else if (precio < min2) then
		begin
			min2:= precio;
			barato2:= cod;
		end;
end;
procedure pantalon(var max:integer; cod:integer; tipo:char; precio:integer; var pantCod:integer);
begin // pregunta si es tipo pantalon, y luego guarda el cod del max precio.
	if (tipo = 'pantalon') then
		begin
			if (precio > max) then
				begin
					max:= precio;
					pantCod:= cod;
				end;
		end;
end;
procedure promedio(precio:integer; var suma:integer);
begin // sumamos todos los precios, y luego lo dividimos por la cantidad de productos, para sacar promedio.
	suma:= suma + precio;
end;

var 
	min, min2, suma,pantCod,max,barato,barato2,precio,cod,i:integer;
	tipo:char;
BEGIN
	i:=0; // verificar si es necesario inicializarlo
	suma:= 0;
	min:= 999;
	min2:= 1999;
	pantCod:= 0;
	max:= -5;
	barato:= 999;
	barato2:= 1999;
	for i:= 1 to 5 do
	begin //repetimos 100 veces, ya que son 100 productos.
		writeln('escriba tipo de producto:'); readln(tipo);	
		writeln('escriba cod de producto:'); readln(cod);
		writeln('escriba precio de producto:'); readln(precio);
		baratos(min, min2 ,cod, precio, barato, barato2);
		pantalon(max, cod, tipo, precio, pantCod);
		promedio(precio, suma);
	end;
	writeln('Los productos mas baratos fueron: ', barato, barato2);
	writeln('Los pantalones mas caros fueron: ', pantCod);
	writeln('EL promedio de los precios fue: ', suma DIV 5);
END.
