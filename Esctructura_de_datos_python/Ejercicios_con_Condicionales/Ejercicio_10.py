#10. Según el número ingresado (1-3), mostrar un mensaje personalizado diferente para cada uno.

numero = int(input("Ingrese un número (1-3): "))

if numero == 1:
    print("Usted ingresó el número uno.")
elif numero == 2:
    print("Usted ingresó el número dos.")
elif numero == 3:
    print("Usted ingresó el número tres.")
else:
    print("Número fuera de rango.")