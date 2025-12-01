#2. Crea una clase llamada **Rectangulo** que reciba base y altura. Implementa una función que calcule el área.

class Rectangulo:
    def __init__(self,base,altura):
        self.base = base
        self.altura = altura

    def calcular_area(self):
      area = self.altura * self.base
      print(f"El area del Rectangulo es: {area}")


Rectangulo1 = Rectangulo(29,19)
Rectangulo1.calcular_area()
    