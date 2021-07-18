{
   Practica3Ej2C.pas
   
   Copyright 2021 mique <mique@DESKTOP-CUP5TBS>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


program Practica3Ejercicio2C;

type
	casamientos = record
		dia:integer;
		mes:integer;
		anio:integer;	
	end;

procedure leerFecha(var fecha:casamientos; var cantVerano:integer; var cantPrimeros:integer);
begin
	writeln('Ingrese anio de casamiento:');
	if (fecha.anio <> 2020) then
	begin
		writeln('Ingrese dia y mes del casamiento: ');
		readln(fecha.dia, fecha.mes);
		if ( (fecha.mes = 1) OR (fecha.mes = 2) OR (fecha.mes = 3) ) then
			cantVerano:= cantVerano + 1;
		if ( (fecha.dia > 0) AND (fecha.dia <= 10) ) then
			cantPrimeros:= cantPrimeros + 1;
	end;
end;

VAR
	fecha:casamientos;
	cantPrimeros, cantVerano:integer;
BEGIN
	fecha.anio:= 0;
	while (fecha.anio <> 2020) do
		leerFecha(fecha, cantVerano,cantPrimeros);
END. 









