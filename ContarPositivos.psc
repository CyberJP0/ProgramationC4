//Ejercicio 12, Contar cuántos números positivos se ingresan antes de ingresar un número negativo.
Algoritmo ContarPositivos
	Definir numero, contador Como Entero
	Escribir "Escriba numeros positivos (escriba un numero negativo para finalizar:)"
	Leer numero
	
	Mientras numero >=0 Hacer
		contador <- contador + 1
		Leer  numero
	FinMientras
	
	Escribir "Numeros positivos antes de uno negativo:",contador
FinAlgoritmo
