{
*  Compania de telefonia celular.
* Por cada cliente:
* 	cod, cantLineas
* 					De cada linea:
* 						numTel, cantMinutos, cantMB
* 
* 
* Se requiere realizar un modulo que lea la info de UNA linea de telefono.
* 
* Se requiere realizar otro modulo que reciba los datos de un cliente
* y lea la informacion de todas sus lineas (utilizando el modulo anterior)
* 
* y luego de esto, retornar la cantidad total de minutos y la cantidad total de MB a facturar del cliente.
}
program Ejer4Practica3;

type
	cliente = record
		cod:integer;
		cantLineas:integer;
	end;
	linea = record
		numTel:integer;
		cantMinutos:integer;
		cantMB:integer;
	end;

procedure leerLinea(var info:linea); // Lectura de linea
begin 
	writeln('Ingresar numero de telefono:');
	readln(info.numTel);
	writeln('Ingresar cantidad de minutos consumidos:');
	readln(info.cantMinutos);
	writeln('Ingresar cantidad de MB consumidos:');
	readln(info.cantMB);
end;

procedure LeerCliente(var datos:cliente; var lin:linea; var totalMB:integer; totalMinutos:integer);
var
	i:integer;
begin // Lectura de los datos del cliente
	writeln('Ingrese codigo de cliente:');
	readln(datos.cod);
	writeln('Ingrese cantidad de Lineas del cliente:');
	readln(datos.cantLineas);
	for i:= 1 to datos.cantLineas do
	begin
		leerLinea(lin);
		totalMB:= totalMB + lin.cantMB;
		totalMinutos:= totalMinutos + lin.cantMinutos;
	end;
	writeln('Cantidad total de Minutos y MB a facturar: ', totalMinutos, ' y ', totalMB);
	writeln('Precio por Minutos consumidos: ', (totalMinutos * 3.40):4:2);
	writeln('Precio por MB`s consumidos: ', (totalMB * 1.35):4:2);
	totalMinutos:= 0; // Reseteamos valores, para el proximo cliente.
	totalMB:= 0;
end;

VAR // Programa principal
	datos:cliente;
	lin:linea;
	i, totalMB, totalMinutos:integer;
BEGIN
	totalMinutos:= 0;
	totalMB:= 0;
	for i:= 1 to 5 do
	begin
		leerCliente(datos, lin, totalMB, totalMinutos);
	end;
END.

