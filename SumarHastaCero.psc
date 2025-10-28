//Ejercicio 16. Pedir números y sumarlos hasta que el usuario ingrese 0.
Algoritmo SumarHastaCero
	Definir numero,suma Como Entero
	suma <- 0
	
	Repetir
		Escribir "Escriba un numero (escriba 0 para terminar) "
		Leer numero
		suma <- suma + numero
	Hasta Que numero = 0
	
	Escribir "La suma total es:",suma

FinAlgoritmo
