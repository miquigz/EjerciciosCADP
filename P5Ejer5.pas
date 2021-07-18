Program Alocacion_Dinamica;
Type
	TEmpleado = record
		sucursal: char;
		apellido: string[25];
		correoElectrónico: string[40];
		sueldo: real;
	end;
	Str50 = string[50];

VAR // suponer q las var ya estan declaradas.
	alguien: TEmpleado;
	PtrEmpleado: ^TEmpleado;
Begin
(*Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)*) 
	//1+26+41+4 = 72 (registro) + 4 puntero. 76 estatica, 0 dinamica.

	Readln( alguien.apellido );// no varia, por mas que alojemos datos, la memoria es estatica en los REGISTROS.
	
(*Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)*)

	New( PtrEmpleado ); // la memoria estatica sigue siendo la misma(76),
	//ahora tenemos una dir de memoria dinamica la cual es 72 bytes (dinamica). 
	
(*¿Cuánta memoria disponible hay ahora? (III)*)

	Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido ); //por mas que alojemos datos, 
	Readln( PtrEmpleado^.correoElectrónico, PtrEmpleado^.sueldo );//la memoria dinamica es la misma. 
	//ya que solo varia cuando reservamos(new) y liberamos(dispose) memoria.
	
(*¿Cuánta memoria disponible hay ahora? (IV)*)
	Dispose( PtrEmpleado ); // liberamos la dir de dinamica del puntero, por ende hay 76 de estatica. 0 dinamica
	
	
(*¿Cuánta memoria disponible hay ahora? (V)*)
	//76 estatica, 0 dinamica.

end.
