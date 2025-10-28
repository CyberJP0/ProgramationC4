//Ejercicio 19. Leer números hasta que se ingrese un número negativo, mostrando la cantidad de positivos.
Proceso ContarPositivosRepetir
    Definir numero, contador Como Entero
    contador <- 0
	
    Repetir
        Escribir "Ingrese un número (negativo para terminar):"
        Leer numero
        Si numero >= 0 Entonces
            contador <- contador + 1
        FinSi
    Hasta Que numero < 0
	
    Escribir "Cantidad de números positivos ingresados: ", contador
FinProceso
