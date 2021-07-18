program Practica3ejer3;

type 
  string20 = string[20];
  escuela = Record
	CUE: integer;
    nombre: string20;
    docentes: integer;
    alumnos: integer;
    localidad: string20;
  end;

procedure leer(Var esc: escuela);
begin
	writeln('Escriba el codigo CUE:');
	readln(esc.CUE);
	writeln('Escriba el nombre del Establecimiento:');
	readln(esc.nombre);
	writeln('Escriba la cantidad de docentes:');
	readln(esc.docentes);
	writeln('Escriba la cantidad de alumnos:');
	readln(esc.alumnos);
	writeln('Escriba la localidad:');
	readln(esc.localidad);
end;

(*rel Docente-Alumno*)
function relDocAlu(esc:escuela): real;
begin
	relDocAlu := esc.docentes/esc.alumnos;
end;

(*rel Mayor*)
function esMayor(relacion:real): boolean;
begin
	esMayor:=(relacion > (1/23.435));
end;

(*Mejores rel*)
procedure relacionUnesco(relacionEscuela:real; escuelas:escuela; var mejorRelacion1, mejorRelacion2:escuela; var relacionMin1, relacionMin2:real);
var
	relacion:real;
begin
  relacion := relacionEscuela -  (1/23.435);
  if (relacion < 0) then
		relacion:= relacion * -1;
  if (relacion <= relacionMin1) then
    begin
		relacionMin2 := relacionMin1;
		relacionMin1 := relacion;
		mejorRelacion2.CUE := mejorRelacion1.CUE;
		mejorRelacion1.CUE := escuelas.CUE;
		mejorRelacion2.nombre := mejorRelacion1.nombre;
		mejorRelacion1.nombre := escuelas.nombre;
    end
  else if (relacion<=relacionMin2) then
        begin
			relacionMin2 := relacion;
			mejorRelacion2.CUE := escuelas.CUE;
			mejorRelacion2.nombre := escuelas.nombre;
        end;
end;

(*principal*)
VAR
  escuelas, mejorRelacion1, mejorRelacion2:escuela;
  relacionEscuela, relacionMin1, relacionMin2:real;
  relacionSup, i:integer;
BEGIN
  relacionSup:= 0;
  relacionMin1:= 999;
  relacionMin2:= 999;
  for i:= 1 to 2400 do
    begin
        leer(escuelas);
        relacionEscuela := relDocAlu(escuelas);
        write(relacionEscuela:2:2);
		if (esMayor(relacionEscuela)) then
			relacionSup := relacionSup + 1;
		relacionUnesco(relacionEscuela, escuelas, mejorRelacion1, mejorRelacion2, relacionMin1, relacionMin2);
    end;
   writeln('CUE de las escuelas con mejor relacion fue: ', mejorRelacion1.CUE,
			' y ', mejorRelacion2.CUE);
   writeln('nombre de las escuelas con mejor relacion fue: ', mejorRelacion1.
			nombre, ' y ', mejorRelacion2.nombre);
   writeln('cantidad de escuelas que tienen una relacion mayor a la esperada es/son:', relacionSup)
END.
