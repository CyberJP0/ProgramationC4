# Ejercicio 16: Pedir números y sumarlos hasta que el usuario ingrese 0.
suma = 0

while True:
    numero = float(input("Ingrese un número (0 para terminar): "))
    if numero == 0:
        break
    suma += numero

print("La suma total es:", suma)
