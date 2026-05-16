//Ejercicio 14. Ingrese dos cadenas y muestre cuál es más larga.
Algoritmo MasLargaCadena
	Definir cadena1,cadena2 como cadena
	Definir long1,long2 como entero 
	Escribir "Introdusca la primera cadena:"
	Leer cadena1
	Escribir "Introduzca la segunda cadena,"
	Leer cadena2
	long1 = Longitud(cadena1)
	long2 = Longitud(cadena2)
	
	si long1 > long2
		Escribir cadena1," ","tiene mas letras que"," ",cadena2
	SiNo
		Escribir cadena2," ","tiene mas letras que"," ",cadena1
	FinSi

FinAlgoritmo
