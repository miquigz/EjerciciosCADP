program Ejer7PRACTICA4parte1;
const
	dimF = 150;
type
	numeros = array[1..dimF] of integer;
	digitos = record
		cero:numeros;
		uno:numeros;
		dos:numeros;
		tres:numeros;
		cuatro:numeros;
		cinco:numeros;
		seis:numeros;
		siete:numeros;
		ocho:numeros;
		nueve:numeros;
	end;
	digDimL = record
		dimL1:integer;
		dimL2:integer;
		dimL3:integer;
		dimL4:integer;
		dimL5:integer;
		dimL6:integer;
		dimL7:integer;
		dimL8:integer;
		dimL9:integer;
		dimL0:integer;
	end;
	
procedure cargarEnteros(vec:numeros; dimL:integer);
var
	stop:boolean;
begin
	stop:= false;
	readln(nums);
	while (stop = false) do
	begin
		if ( (dimL < dimF) AND (nums <> -1) ) then
		begin
			dimL:= dimL + 1;
			vec[dimL]:= nums;
		end;
		else
			stop:= true;
	end;
end;

procedure preguntarDigito(var dig:numeros; a:digDimL; valor:integer);
begin
	if (valor = 1) then 						//1
		dig.uno:= dig.uno[a.dimL1 +1] +1;
	if (valor = 2) then 						//2
		dig.dos:= dig.dos[a.dimL2 +1] +1;
	if (valor = 3) then 						//3
		dig.tres:= dig.tres[a.dimL3+1] +1;
	if (valor = 4) then 						//4
		dig.cuatro:= dig.cuatro[a.dimL4 +1] +1;
	if (valor = 5) then							//5
		dig.cinco:= dig.cinco[a.dimL5 +1] +1;
	if (valor = 6) then 						//6
		dig.seis:= dig.seis[a.dimL6 +1] +1;
	if (valor = 7) then 						//7
		dig.siete:= dig.siete[a.dimL7 +1] +1;
	if (valor = 8) then 						//8
		dig.ocho:= dig.ocho[a.dimL8 +1] +1;
	if (valor = 9) then 						//9 
		dig.nueve:= dig.nueve[a.dimL9 +1] +1;
	if (valor = 0) then 						//0
		dig.cero:= dig.cero[a.dimL0 +1] +1;
end;

procedure descomponer(vec:numeros; dimL:integer; dig:numeros; dimLDigitos:digDimL);
var
	digito,i:integer;
begin
	digito:= 0;
	for i:= 1 to dimL // verificar si se puede modificar un parametro por valor, para solo una condicion.
	begin
		while (numeros[i] <> 0) do // arreglar la situacion de que sea 0
		begin	
			digito:= numeros[i] mod 10;
			preguntarDigito(dig, dimLDigitos, digito);
			numeros[i]:= numeros[i] DIV 10;
		end;
	end;
end;


procedure ocurrencias(dim:digDimL);
var
	i:integer;
begin
	for i:=1 to dimF do
	begin
		writeln('El numero ' i-1, ':', dim.); // ver como imprimir esto sin repetirlo 10 veces.
	end;
end;

// la descompo ya est'a, solo qeda hacer un max entre el registro digDimL 
// preguntar que digDimL no fue mayor que 1 (no tuvo ocurrencias).
// imprimir la cantidad de todas las digDimL de los digitos. 


VAR
	vec:numeros;
	dig:digitos;
	dimLDigitos:digDimL;
	dimL:integer;
	
BEGIN
	dimL:=0;
	cargarEnteros(vec, dimL);
	descomponer(vec, dimL, dig, dimLDigitos);
	writeln('');
	writeln('');
	writeln('');
END.
