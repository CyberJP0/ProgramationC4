//Ejercicio 18. . Calcular el factorial de un número usando un ciclo repetir.
Proceso FactorialRepetir
    Definir numero, i, factorial Como Entero
    Escribir "Ingrese un número para calcular su factorial:"
    Leer numero
	
    factorial <- 1
    i <- 1
	
    Repetir
        factorial <- factorial * i
        i <- i + 1
    Hasta Que i > numero
	
    Escribir "El factorial de ", numero, " es ", factorial
FinProceso

