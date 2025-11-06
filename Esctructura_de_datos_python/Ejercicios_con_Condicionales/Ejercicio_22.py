#23. Mostrar la tabla de multiplicar de un número ingresado (del 1 al 10).

numero = int(input("Ingrese un número para mostrar su tabla de multiplicar: "))

for i in range(1, 11):
    print(f"{numero} x {i} = {numero * i}")

