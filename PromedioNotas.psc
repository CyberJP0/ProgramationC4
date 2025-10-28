//Ejercicio 20. Ingresar notas hasta que el usuario ingrese -1, y luego mostrar el promedio.
Proceso PromedioNotas
    Definir nota, suma, contador Como Real
    suma <- 0
    contador <- 0
	
    Repetir
        Escribir "Ingrese una nota (-1 para terminar):"
        Leer nota
        Si nota <> -1 Entonces
            suma <- suma + nota
            contador <- contador + 1
        FinSi
    Hasta Que nota = -1
	
    Si contador > 0 Entonces
        Escribir "El promedio de las notas es: ", suma / contador
    Sino
        Escribir "No se ingresaron notas válidas."
    FinSi
FinProceso
