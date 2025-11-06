# Ejercicio 15: Leer números hasta que su suma sea mayor a 100.
suma = 0
numero = 0

while suma <= 100:
    numero = int(input("Ingrese un número: "))
    suma += numero

print(f"La suma total es: {suma}")