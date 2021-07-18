program P1Ejer2;

var num:real;
BEGIN
	writeln('inserte un numero real');
	readln(num);
	if (num > 0) then
		writeln(num:4:2, ' Su valor absoluto es: ', num:4:2)
	else
		writeln( num:4:2, ' Su valor absoluto es: ', (num * -1):4:2 );
	readln();
END.
