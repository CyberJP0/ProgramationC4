import math

# Clase base
class Figura:
    def area(self):
        return 0  # Área por defecto


# Clase hija Círculo
class Circulo(Figura):
    def __init__(self, radio):
        self.radio = radio

    def area(self):
        return math.pi * (self.radio ** 2)


# Clase hija Cuadrado
class Cuadrado(Figura):
    def __init__(self, lado):
        self.lado = lado

    def area(self):
        return self.lado ** 2


# Probando las clases
circulo = Circulo(4)
cuadrado = Cuadrado(4)

print(f"Área del círculo: {circulo.area():.2f}")
print(f"Área del cuadrado: {cuadrado.area()}")
