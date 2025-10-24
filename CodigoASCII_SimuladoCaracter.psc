//Ejercicio 18. Ingrese un carácter y muestre su código ASCII
Algoritmo CodigoASCII_SimuladoCaracter
    Definir c Como Caracter
	
    Escribir "Ingrese un carácter (A, B, C, a, b, c, etc):"
    Leer c
	
    Segun c Hacer
        "A": Escribir "El código ASCII de A es 65"
        "B": Escribir "El código ASCII de B es 66"
        "C": Escribir "El código ASCII de C es 67"
        "a": Escribir "El código ASCII de a es 97"
        "b": Escribir "El código ASCII de b es 98"
        "c": Escribir "El código ASCII de c es 99"
        De Otro Modo:
            Escribir "No tengo registrado el código ASCII de ese carácter."
    FinSegun
FinAlgoritmo
