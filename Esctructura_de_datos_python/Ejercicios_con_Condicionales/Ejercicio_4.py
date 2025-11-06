#4. Escriba un algoritmo que indique si un número es positivo, negativo o cero.

numero = float(input("Ingrese un número: "))

if numero > 0:
    print("El número es positivo.")
elif numero < 0:
    print("El número es negativo.")
else:
    print("El número es cero.")