program ejer0;

VAR

BEGIN
	1) ¿Qué se define como memoria estática?
	
		La memoria estatica es la que esta definida desde el principio en el programa
		la misma no puede ser modificada durante la ejecucion de dicho programa.
		Son generalmente (y resumidamente) las variables locales y globales.
		
	2) ¿Qué se define como memoria dinámica?
	
		La memoria dinamica es la que si puede ser modificada durante la ejecucion del programa
		, puede ser liberada o reservada durante la ejecucion del mismo. Generalmente esta definida
		y es posible calcularla viendo a que apuntan los punteros.
		
	3) ¿Qué es una variable de tipo puntero?
	
		Una variable tipo puntero es un tipo de dato simple, es capaz de tener la direccion dinamica de
		donde se encuentra almacenado un dato.
		Cada puntero puede apuntar a un nuico tipo de dato.
		
	4) ¿Qué hace la operación “NEW” aplicada en una variable del tipo puntero?
	
		La operacion NEW es la encargada de crear y a la vez asignarle una direccion de memoria 
		a una variable tipo puntero, resumidamente crea una direccion de memoria dinamica,
		y a si mismo la cargamos dentro de una variable tipo puntero.
		
	5) ¿Qué hace la operación “DISPOSE” aplicada en una variable del tipo puntero?
	
		La operacion dispose lo que hace es eliminar una direccion dinamica por completo, la cual
		seguramente estaba alojada en una variable tipo puntero. Libera la memoria dinamica que contenia
		la variable y a si mismo Elimina la direccion. 
		
		
END.

