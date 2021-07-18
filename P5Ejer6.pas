program P5Ejer6;
Type 
	nombre = string[50];
	punNombre = ^nombre;
	
	aPuntero = array[1..2500] of punNombre; //vector de puntero nombre.
		
VAR
	punteros: aPuntero;

BEGIN
{ A)
* Estrucutura de datos estatica: nombre=string[50];
									ciudades = array[1..2500] of nombre;
	2500 nombres de ciudades.
	'a)' 51 * 2500 = 127500, (127.5k)	127kb , 127kb requiere el programa
}


		
	//b.1: el tamanio de la var punteros al comenzar es: 4 bytes.
	
	//b.2: new(punteros); la memoria es 
	
	



	nombre=string[50];
	arrayNombresString=array [1..2500] of nombre; // inciso a
	//array [1..2500] of nombre // 127000bytes o 127kb
	
	punteroNombre= ^nombre;
	arrayNombres= array [1..2500] of punteroNombre;
	
	puntero=^arrayNombresString;
	
	//b1) 10000
 {	
    b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
	memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
	dinámica?
 }
	
procedure reservarMem(var a:arrayNombres);
	var 
		i:integer;
	begin
		for i:=1 to 2500 do
			new(a[i]);
	end;
{b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}
procedure leerNombres(var a:arrayNombres);
	var
		i:integer;
	begin
		for i:=1 to 2500 do 
			readln(a[i]^);
			
	end;

var
	aNombres:arrayNombres;
BEGIN
	reservarMem(aNombres);
	leerNombres(aNombres);
END.
