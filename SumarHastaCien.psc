//Ejercicio 15. Leer números hasta que su suma sea mayor a 100.
Proceso SumarHastaCien
    Definir numero, suma Como Entero
    suma <- 0
	
    Mientras suma <= 100 Hacer
        Escribir "Ingrese un número:"
        Leer numero
        suma <- suma + numero
    FinMientras
	
    Escribir "La suma total es ", suma, ", que es mayor a 100."
FinProceso
