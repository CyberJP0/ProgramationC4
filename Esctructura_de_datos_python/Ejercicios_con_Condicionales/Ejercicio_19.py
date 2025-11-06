# Ejercicio 19: Leer números hasta que se ingrese un número negativo, mostrando la cantidad de positivos.
contador_positivos = 0

while True:
    numero = float(input("Ingrese un número (negativo para terminar): "))
    if numero < 0:
        break
    contador_positivos += 1

print("Cantidad de números positivos ingresados:", contador_positivos)
