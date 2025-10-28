//Ejercicio 10, . Según el número ingresado (1-3), mostrar un mensaje personalizado diferente para cada uno.
Proceso MensajePersonalizado
    Definir numero Como Entero
    Escribir "Ingrese un número del 1 al 3:"
    Leer numero
	
    Segun numero Hacer
        1: Escribir "Elegiste el número uno: ¡Uno nunca sabe XD!"
        2: Escribir "Elegiste el número dos: ¡hombre precavido vale x2 jaja!"
        3: Escribir "Elegiste el número tres: ¡tres cabezas piensan mejor que dos lol!"
        De Otro Modo:
            Escribir "Número inválido. Solo se permite 1, 2 o 3."
    FinSegun
FinProceso
