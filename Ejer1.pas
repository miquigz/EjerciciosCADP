program P4Ejer1; // ejercicio de teoria
type
	vnums = array [1..10] of integer;
var

	numeros : vnums;
	i : integer;
begin
	for i:=1 to 10 do {primer bloque for}
		numeros[i] := i;
	for i := 1 to 9 do {segundo bloque for}
		numeros[i] := numeros[i] + numeros [i-1];
end.

{A: toma el valor [1,2,3,4,5,6,7,8,9,10] }
 
{B: toma el valor [1,3,5,7,9,11,13,15,17,19]  }
 
{C: for i:=1 to 9 do 
 	numeros[i]:= numeros[i]+numeros[i+1];}

{D: [1,1,1,1,1,1,1,1,1,1] }
