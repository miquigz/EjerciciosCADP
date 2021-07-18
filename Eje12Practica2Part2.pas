program Ejercicio12Practica2Parte2;
function vocal(char1:char):boolean; // pregunta si es vocal
var
	cumple:boolean;
begin 
	cumple:= (char1 = 'a') or (char1 = 'e') or (char1 = 'i') or (char1 = 'o') or (char1 = 'u') or (char1 = 'A') or (char1 = 'E') or (char1 = 'I') or (char1 = 'O') or (char1='U');
	vocal:= cumple;
end;
function sinVocal(char1:char):boolean; // pregunta si es una letra del abecedario y si NO es vocal.
var
	cumple:boolean;
begin
	cumple:= (not vocal(char1))  AND (char1 > 'a' and char1 <= 'z'); // el boolean se establece dependiendo el resultado de este AND
	sinVocal:= cumple;
end;
procedure secuenciaA(var cumple:boolean; var char1:char); // pregunta si se cumple el patron de Vocal y $ .
begin	
	writeln('Inserte un caracter:');
	readln(char1); // Mientras cumple sea verdadera, y char1 distinto de $, entonces leo y pregunto si es vocal, si no es vocal entonces cumple es F.
	while ( (cumple) AND (char1 <> '$') ) do begin 
		if (not vocal(char1) ) then // el programa frena cuando hay un $, o cuando cumple:= false.
		cumple:= false
		else // si es vocal, entonces sigo leyendo, esta funcion tiene el else.
		readln(char1);
	end;
end;
procedure secuenciaB(cumple:boolean; var char1:char); // secuenciaB, pregunta si se cumple el patron, de Consonante y #.
begin
	writeln('inserte un caracter');
	readln(char1);
	while ( (cumple) AND (char1 <> '#') ) do begin
		if (not sinVocal(char1)) then // si no es consonante entonces finalizo el programa.
			cumple:=false
		else
		readln(char1);
	end;
end;
VAR // pongo VAR en mayusculas, para indicar que son variables locales del programa principal.
	cumple:boolean;
	char1:char;
BEGIN
	char1:= 'nada';
	cumple:= true; // inicializo en true.
	secuenciaA(cumple, char1); // declaro la primer secuencia A$, si se cumple sigue preguntando.
	if cumple = false then
		writeln('error en la secuencia A')
	else
	begin
		secuenciaB(cumple, char1); // secuencia B#
		if (cumple = false) then
			writeln('error en secuencia B') // avisa si hubo un error.
		else 
			writeln('Se cumplio el patron.');// si no hubo ningun error quiere decir que el patron se cumplio
	end;
END.
