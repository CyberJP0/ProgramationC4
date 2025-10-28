//Ejercicio 7. Según el número del día (1-7), mostrar su nombre correspondiente.
Proceso NombreDelDia
    Definir dia Como Entero
    Escribir "Ingrese un número del 1 al 7:"
    Leer dia
	
    Segun dia Hacer
        1: Escribir "Lunes"
        2: Escribir "Martes"
        3: Escribir "Miércoles"
        4: Escribir "Jueves"
        5: Escribir "Viernes"
        6: Escribir "Sábado"
        7: Escribir "Domingo"
        De Otro Modo:
            Escribir "Número inválido. Debe estar entre 1 y 7."
    FinSegun
FinProceso
