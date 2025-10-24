//Ejercicio 17. . Ingrese un carácter y determine si es mayúscula o minúscula.
Algoritmo MayusOMinuscCaracter
	Definir letra Como Caracter
	Escribir "Introduzca un caracter:"
	Leer letra
	si letra >= "A" Y letra <= "Z" Entonces
		Escribir "Es una mayuscula"
	SiNo
		si letra >= "a" Y letra <= "z" Entonces
			Escribir "Es una minuscula"
		SiNo
			Escribir letra "No es una letra del alfabeto"
		FinSi
	FinSi
	
FinAlgoritmo
