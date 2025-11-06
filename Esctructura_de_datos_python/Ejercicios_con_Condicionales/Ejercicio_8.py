#8.3. Según la calificación (A, B, C, D, F), mostrar el mensaje de rendimiento del estudiante.

calificacion = input("Ingrese la calificación (A, B, C, D o F): ").upper()

if calificacion == "A":
    print("Excelente rendimiento")
elif calificacion == "B":
    print("Buen rendimiento")
elif calificacion == "C":
    print("Rendimiento regular")
elif calificacion == "D":
    print("Necesita mejorar")
elif calificacion == "F":
    print("Reprobado")
else:
    print("Calificación no válida")
