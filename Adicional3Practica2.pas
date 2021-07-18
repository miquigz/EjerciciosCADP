{
    200 productos info.
    * 
    * Leer: cod, precio, (cada cod numero entre 1 y 200);
    * Informar los codigos de los dos prod mas baratos.
    * la cant de prod de mas de 16 pesos con cod par
}


program adicional3Practica2;

procedure baratos(precio:integer; cod:integer; var min:integer; var min2:integer; var  minCod:integer; var minCod2:integer);
begin
	if (precio < min) then
	begin
		min2:= min; // Guardamos el min1, en el min2.
		minCod2:= minCod; //Guardamos el cod del min1
		min:= precio; // Establecemos el nuevo min
		minCod:= cod; //Establecemos el nuevo cod
	end
	else if (precio < min2) then
	begin
		min2:= precio;
		minCod2:= cod;
	end;
end;

procedure cant16(precio:integer; cod:integer; var cantProd:integer);
begin
	if ( (cod mod 2 = 0) AND (precio > 16) ) then
		cantProd:= cantProd+1;
end;

VAR
	i, cantProd ,min, min2, minCod, minCod2, cod, precio:integer;

BEGIN
	cantProd:=0;
	min:= 99;
	min2:= 101;
	minCod:= 0;
	minCod2:= 0;
	for i:= 1 to 5 do begin
		writeln('Ingrese codigo de producto y precio de producto: ');
		readln(cod, precio);
		baratos(precio, cod, min, min2, minCod, minCod2);
		cant16(precio, cod, cantProd);
	end;
	writeln('Los dos productos mas baratos:', minCod, minCod2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par:', cantProd);
END.

