# Ejercicio 11: Contar números ingresados hasta un cero
contador = 0
numero = int(input("Ingrese un número (0 para terminar): "))

while numero != 0:
    contador += 1
    numero = int(input("Ingrese otro número (0 para terminar): "))

print("Ingresó", contador, "números en total.")
