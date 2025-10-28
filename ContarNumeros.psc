//Ejercicio 11. Leer números hasta que el usuario ingrese 0 y mostrar cuántos números ingresó.
Algoritmo  ContarNumeros
	Definir numero,contador Como Entero
	Escribir "Escriba un numero (escriba 0 para finalizar):"
	Leer numero
	
	Mientras numero <> 0 Hacer
		contador <- contador +1
		Leer numero
	FinMientras
	
	Escribir "la cantidad de veces que se introdujo un numero es:",contador
FinAlgoritmo
