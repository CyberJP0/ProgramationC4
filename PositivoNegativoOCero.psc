//Ejercicio 4. Escriba un algoritmo que indique si un número es positivo, negativo o cero.
Proceso PositivoNegativoOCero
    Definir numero Como Real
    Escribir "Ingrese un número:"
    Leer numero
	
    Si numero > 0 Entonces
        Escribir "El número es positivo."
    Sino
        Si numero < 0 Entonces
            Escribir "El número es negativo."
        Sino
            Escribir "El número es cero."
        FinSi
    FinSi
FinProceso
