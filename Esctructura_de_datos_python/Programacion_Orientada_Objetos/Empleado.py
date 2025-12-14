# Clase base
class Empleado:
    def __init__(self, nombre, salario):
        self.nombre = nombre
        self.salario = salario

    def calcular_bono(self):
        return 0  # Por defecto, sin bono


# Clase hija Gerente
class Gerente(Empleado):
    def calcular_bono(self):
        # Los gerentes reciben el 20% del salario como bono
        return self.salario * 0.20


# Clase hija Técnico
class Técnico(Empleado):
    def calcular_bono(self):
        # Los técnicos reciben el 10% del salario como bono
        return self.salario * 0.10


# Probando las clases
empleado1 = Gerente("Ana", 50000)
empleado2 = Técnico("Luis", 30000)

print(f"{empleado1.nombre} - Bono: {empleado1.calcular_bono()} RD$")
print(f"{empleado2.nombre} - Bono: {empleado2.calcular_bono()} RD$")
