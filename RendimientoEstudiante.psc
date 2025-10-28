//Ecercicio 8  Según la calificación (A, B, C, D, F), mostrar el mensaje de rendimiento del estudiante.
Proceso RendimientoEstudiante
    Definir calificacion Como Caracter
    Escribir "Ingrese la calificación (A, B, C, D, F):"
    Leer calificacion
	
    Segun calificacion Hacer
        "A": Escribir "Excelente rendimiento."
        "B": Escribir "Buen rendimiento."
        "C": Escribir "Rendimiento aceptable."
        "D": Escribir "Rendimiento bajo."
        "F": Escribir "Reprobado."
        De Otro Modo:
            Escribir "Calificación no válida."
    FinSegun
FinProceso
