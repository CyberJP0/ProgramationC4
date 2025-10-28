//Ejecicio 9. Según el tipo de operación (+, -, *, /), mostrar el resultado entre dos números.
Proceso OperacionesBasicas
    Definir num1, num2 Como Real
    Definir operacion Como Caracter
	
    Escribir "Ingrese el primer número:"
    Leer num1
    Escribir "Ingrese el segundo número:"
    Leer num2
    Escribir "Ingrese la operación (+, -, *, /):"
    Leer operacion
	
    Segun operacion Hacer
        "+": Escribir "Resultado: ", num1 + num2
        "-": Escribir "Resultado: ", num1 - num2
        "*": Escribir "Resultado: ", num1 * num2
        "/": 
            Si num2 <> 0 Entonces
                Escribir "Resultado: ", num1 / num2
            Sino
                Escribir "Error: división entre cero."
            FinSi
        De Otro Modo:
            Escribir "Operación inválida."
    FinSegun
FinProceso
