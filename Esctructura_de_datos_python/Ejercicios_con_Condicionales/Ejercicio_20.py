# Ejercicio 20: Ingresar notas hasta que el usuario ingrese -1, y luego mostrar el promedio.
notas = []
while True:
    nota = float(input("Ingrese una nota (-1 para terminar): "))
    if nota == -1:
        break
    notas.append(nota)

if notas:
    promedio = sum(notas) / len(notas)
    print(f"El promedio de las notas es: {promedio}")
else:
    print("No se ingresaron notas.")