//Ejercicio 10. Ingrese un número real y muestre su valor absoluto.
Algoritmo ValorAbsolutoReal
    Definir num, valor Como Real
    Escribir "Ingrese un número real:"
    Leer num
    Si num < 0 Entonces
        valor = -num
    Sino
        valor = num
    FinSi
    Escribir "El valor absoluto es: ", valor
FinAlgoritmo
