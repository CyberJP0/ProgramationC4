#5. Crea una clase llamada **Estudiante** con nombre y calificaciones. Implementa una función que calcule el promedio.

class Estudiante:
    def __init__(self, nombre, calificaciones):
        self.nombre = nombre
        self.calificaciones = calificaciones 

    def calcular_promedio(self):
        if len(self.calificaciones) == 0:
            return 0
        promedio = sum(self.calificaciones) / len(self.calificaciones)
        return promedio


estudiante1 = Estudiante("Jefri", [90, 85, 95, 100])
print(f"El promedio de {estudiante1.nombre} es: {estudiante1.calcular_promedio()}")
