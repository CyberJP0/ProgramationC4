# Ejercicio 21: Calcular el promedio de 5 notas ingresadas.
notas = []
for i in range(5):
    nota = float(input(f"Ingrese la nota {i+1}: "))
    notas.append(nota)

promedio = sum(notas) / len(notas)
print(f"El promedio de las notas es: {promedio}")
