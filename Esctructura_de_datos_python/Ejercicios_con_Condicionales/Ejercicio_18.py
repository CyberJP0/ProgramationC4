# Ejercicio 18: Calcular el factorial de un número usando un ciclo mientras y una instrucción break.
numero = int(input("Ingrese un número para calcular su factorial: "))

factorial = 1
contador = 1

while True:
    factorial *= contador
    contador += 1
    if contador > numero:
        break

print(f"El factorial de {numero} es {factorial}")
